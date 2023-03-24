function gcom {
    local message=$@
    echo "$message"
    git add . && git commit -m "$message"
}
function vsource() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -d venv; then
            source venv/**/activate
            break
        else 
            cd ..
        fi
    done
    cd $start
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
        else
            cd ..
        fi
    done
    cd $start
}
function dj() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f manage.py;then
            python manage.py $@
            break
        else
            cd ..
        fi
    done
    cd $start
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
    local search=$@
    grep -rni "$search" $package
    cd $start
}
function pygrepcore {
    local start=`pwd`
    wd python
    cd include
    local package=$1
    shift
    grep "$@" $package.h
    cd $start
}
function pmain {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f main.py;then
            python main.py $@
            break
        else
            cd ..
        fi
    done
    cd $start
}
function dev {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f dev.sh;then
            chmod +x dev.sh
            ./dev.sh
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
function vbash {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -d venv;then
            vim venv/**/activate
            break
        else
            cd ..
        fi
    done
    cd $start
}
function wdl {
    dirname `which $1`
}
function wd {
    cd `wdl $1`
}
function dev {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f dev.sh;then
            ./dev.sh
            break
        else
            cd ..
        fi
    done
    cd $start
}
function pipd () {
    updatesetupversion
    rm -rf dist *.egg-info build
    python setup.py bdist_wheel
    pm twine upload --skip-existing dist/*
    rm -rf dist *.egg-info build
    gcom `cat setup.py | grep version`
    git push origin main
}
function updatesetupversion () {
    local num=`cat setup.py | grep version | tr -dc '0-9.'`
    local updatePart=`echo $num | grep -oE '[^.]+$'`
    local updatedPart=$((updatePart+1))
    local firstPart=`echo $num | grep -oE -m 0 '[^.]+$'`
    local update=$((firstPart)).$updatedPart
    echo $update
    sed -i "s/$num/$update/g" setup.py
}
function psand () { 
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f sandbox.py;then
            python sandbox.py
            break
        else
            cd ..
        fi
    done
    cd $start
}
function venv () {
    pm venv venv
    vsource
    pi --upgrade pip
    pi -U autopep8
}
function rust () {
    local base=`echo $1 | cut -d\. -f1`
    rustc $1 && ./$base && rm $base.exe $base.pdb
}
function forward () {
    while true; do
        ssh -N -R $2:localhost:$3 $1
    done
}
function dnames () {
    docker ps --format '{{.Names}}'
}
function dsh () {
    local container=$(dnames | grep $1 | head -1)
    echo "Connecting to $container"
    docker exec -it $container sh
}
