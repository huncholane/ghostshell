touch ~/.ghost/secret.sh
source ~/.ghost/secret.sh
git config --global core.autocrlf input
git config --global pull.rebase true
if uname -a | grep -q MINGW;then
    export thisos='windows'
    alias python3=python
    alias Python=python
    alias drivers='cd /c/Windows/System32/drivers/etc'
else
    alias python=python3
fi
alias Vim='vim ~/.vimrc'
alias Gvim='vim ~/.ghost/ghost.vimrc'
alias Gbash='vim ~/.ghost/ghost.sh'
alias Gfuncs='vim ~/.ghost/gfuncs.sh'
alias clip=clip.exe
alias Bash='vim ~/.bashrc'
alias Source='source ~/.bashrc'
alias ghook='~/.ghost/ghook/startproject.sh'
alias venv='python -m venv venv'
alias Gsecret='vim ~/.ghost/secret.sh'
alias postgres='docker run -p 5432:5432 --name postgres -e POSTGRES_HOST_AUTH_METHOD=trust -v postgres -d postgres:15'
alias psql='docker exec -it postgres psql -U postgres'
alias redis='docker run -p 6379:6379 --name redis -v redis -d redis:5'
alias redis-cli='docker exec -it redis redis-cli'
alias pm='python -m'
alias pi='python -m pip install'
alias djp='django-admin startproject'
alias dwipe='~/.ghost/dwipe.sh'
alias Ggit='vim ~/.gitconfig'
alias ddev='docker compose -f dev-compose.yml up -d --remove-orphans'

source ~/.ghost/gfuncs.sh
