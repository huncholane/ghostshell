git config --global core.autocrlf input
alias python=python3
alias Vim='vim ~/.vimrc'
alias Gvim='vim ~/.ghost/ghost.vimrc'
alias Gbash='vim ~/.ghost/ghost.sh'
alias clip=clip.exe
alias Bash='vim ~/.bashrc'
alias Source='source ~/.bashrc'
alias gcom='git add . && git commit -m'
alias ghook='~/.ghost/ghook/startproject.sh'
alias venv='python3 -m venv venv'
function vsource() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if ! source venv/bin/activate; then
            cd ..
        else 
            cd $start
            break
        fi
    done
}
function Gsend() {
    local start=`pwd`
    local message=$@
    echo message
    cd ~/.ghost
    gcom '"'message'"'
    git push -u origin main 
}

export -f vsource
export -f Gsend
