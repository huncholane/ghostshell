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
function pygrep {
    local start=`pwd`
    local pylocation=`which python`
    local pydir=`dirname $pylocation`
    local packagedir=$pydir/Lib/site-packages
    cd $packagedir
    local package=$1
    shift
    grep -rni "$@" $package
    cd $start
}
function rootrun {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f rootrun.sh;then
            chmod +x rootrun.sh
            ./rootrun.sh
            break
        else
            cd ..
        fi
    done
    cd $start
}
function gcode {
    local files=`find . -name $1`
    local i=0
    local choices=( )
    for r in $files;do
        echo "$i) $r"
        choices+=( $r )
        let i=i+1
    done
    echo "What file do you want?"
    read choicenum
    local choice=${choices[$choicenum]}
    echo "Opening $choice with vscode"
    code $choice
}
