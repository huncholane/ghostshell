touch ~/.ghost/secret.sh
source ~/.ghost/secret.sh
git config --global core.autocrlf input
if uname -a | grep -q MINGW;then
    alias python3=python
    alias Python=python
else
    alias python=python3
fi
#alias python=python3
alias Vim='vim ~/.vimrc'
alias Gvim='vim ~/.ghost/ghost.vimrc'
alias Gbash='vim ~/.ghost/ghost.sh'
alias clip=clip.exe
alias Bash='vim ~/.bashrc'
alias Source='source ~/.bashrc'
alias ghook='~/.ghost/ghook/startproject.sh'
alias venv='python -m venv venv'
alias Gsecret='vim ~/.ghost/secret.sh'
function gcom {
    local message=$@
    echo "$message"
    git add . && git commit -m "$message"
}
function vsource() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if ! source venv/**/activate; then
            cd ..
        else 
            cd $start
            break
        fi
    done
}
function Gpush() {
    local start=`pwd`
    cd ~/.ghost
    gcom $@
    git push -u origin main 
    cd $start
}
function djs() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f manage.py;then
            python manage.py runserver $1
            break
        fi
    done
}
function dj() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f manage.py;then
            python manage.py $@
            break
        fi
    done
}
function Gupdate() {
    local start=`pwd`
    cd ~/.ghost && git pull
    Source
    cd $start
}
function djp() {
    # start a django project
    django-admin startproject $@
}
function pi {
    python -m pip install $@
}
function pm {
    python -m $@
}
function redis {
    docker run -p 6379:6379 --name redis -d redis:5
}
function redis-cli {
    docker exec -it redis redis-cli $@
}
