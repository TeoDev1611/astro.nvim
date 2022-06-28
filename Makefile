fmt:
	  stylua -s .

install-sh:
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && sh ./installer.sh ~/.cache/dein

install-pwsh:
    powershell -c "Invoke-WebRequest https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1 -OutFile installer.ps1 && Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser && ./installer.ps1 ~/.cache/dein"
