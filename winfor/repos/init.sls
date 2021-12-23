winfor-repos-add:
  file.append:
    - name: 'C:\\ProgramData\\Salt Project\\salt\\conf\\minion'
    - text: |
        #####  Windows Software Repo settings #####  
        ###########################################  
        # Location of the repo on the master:  
        #winrepo_dir_ng: '/srv/salt/win/repo-ng'
        #  
        # List of git repositories to include with the local repo:
        winrepo_remotes_ng:
          - main https://github.com/digitalsleuth/salt-winrepo-ng.git 
        # List of git repositories to include with the local repo:
        winrepo_remotes:  
