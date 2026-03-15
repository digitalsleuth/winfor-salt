param(
    [Parameter(Mandatory=$true, Position=0)] 
    [string]$SourceExe,

    [Parameter(Mandatory=$true, Position=1)] 
    [string]$OutPath,

    [ValidateSet("asInvoker", "requireAdministrator")]
    [string]$ExecutionLevel = "asInvoker"
)

$ResolvedSource = (Resolve-Path $SourceExe -ErrorAction Stop).Path
$csc = Get-ChildItem "C:\Windows\Microsoft.NET\Framework64\v4.0.*\csc.exe" | 
       Select-Object -First 1 -ExpandProperty FullName

if (-not $csc) {
    Write-Error "C# Compiler (csc.exe) not found."
    return
}

# Extract Icon logic (Simplified for brevity)
$tempIcon = [IO.Path]::GetTempFileName() + ".ico"
Add-Type -AssemblyName System.Drawing
try {
    $icon = [System.Drawing.Icon]::ExtractAssociatedIcon($ResolvedSource)
    $stream = [System.IO.File]::Create($tempIcon)
    $icon.Save($stream)
    $stream.Close()
} catch { $tempIcon = $null }

$manifestPath = [IO.Path]::GetTempFileName() + ".manifest"
@"
<?xml version="1.0" encoding="utf-8"?>
<assembly manifestVersion="1.0" xmlns="urn:schemas-microsoft-com:asm.v1">
  <assemblyIdentity version="1.0.0.0" name="New-Shim.App"/>
  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v2">
    <security>
      <requestedPrivileges xmlns="urn:schemas-microsoft-com:asm.v3">
        <requestedExecutionLevel level="$ExecutionLevel" uiAccess="false" />
      </requestedPrivileges>
    </security>
  </trustInfo>
</assembly>
"@ | Out-File -FilePath $manifestPath -Encoding UTF8

$tempSource = [IO.Path]::GetTempFileName() + ".cs"
$source = @"
using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Runtime.InteropServices;

class UniversalShim {
    [DllImport("kernel32.dll", SetLastError = true)]
    static extern bool GetBinaryType(string lpApplicationName, out uint lpBinaryType);

    static void Main(string[] args) {
        string target = @"$ResolvedSource";
        StringBuilder sb = new StringBuilder();
        foreach (string a in args) {
            string s = a.Contains(" ") ? "\"" + a.Replace("\"", "\\\"") + "\"" : a;
            if (sb.Length > 0) sb.Append(" ");
            sb.Append(s);
        }

        bool isGui = IsGuiApplication(target);

        var si = new ProcessStartInfo {
            FileName = target,
            Arguments = sb.ToString(),
            WorkingDirectory = Path.GetDirectoryName(target),
            UseShellExecute = isGui,
            CreateNoWindow = false
        };

        try {
            using (Process p = Process.Start(si)) {
                if (p != null && !isGui) {
                    p.WaitForExit();
                    Environment.Exit(p.ExitCode);
                }
            }
        } catch (Exception ex) {
            if (!isGui) Console.Error.WriteLine("Shim Error: " + ex.Message);
            Environment.Exit(1);
        }
    }

    static bool IsGuiApplication(string path) {
        try {
            using (var fs = new FileStream(path, FileMode.Open, FileAccess.Read)) {
                using (var br = new BinaryReader(fs)) {
                    fs.Seek(0x3C, SeekOrigin.Begin);
                    int peOffset = br.ReadInt32();
                    fs.Seek(peOffset + 0x5C, SeekOrigin.Begin);
                    short subsystem = br.ReadInt16();
                    return subsystem == 2; // 2 = GUI, 3 = CLI
                }
            }
        } catch { return false; }
    }
}
"@
$source | Out-File -FilePath $tempSource -Encoding UTF8
$compileArgs = "/target:exe /win32icon:`"$tempIcon`" /win32manifest:`"$manifestPath`" /out:`"$OutPath`" `"$tempSource`""
Start-Process -FilePath $csc -ArgumentList $compileArgs -Wait -NoNewWindow
Remove-Item $tempSource, $manifestPath -ErrorAction SilentlyContinue
if ($tempIcon) { Remove-Item $tempIcon }
