#! /bin/bash

# Change cwd to parent directory of current script
cd "${0%/*}"
cd ..

if [[ -z "$1" ]]
then
    echo "Usage: $0 <core|grep> [TARGET]"
    echo " Default value of TARGET:"
    echo "  For core option: coreutils"
    echo "  For grep option: grep"
    exit 1
fi

TARGET=$2

if [[ "$1" = "core" ]]
then
    if [[ -z "$TARGET" ]]
    then
        TARGET=coreutils
    fi
    echo "======================"
    echo " Fixing core.61de57cd "
    echo "======================"
    cd $TARGET/61de57cd/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests && patch -p0 --forward) < ../../../patch/core.61de57cd.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests && make check)
    cd ../../../
    echo "============================="
    echo " End of fixing core.61de57cd "
    echo "============================="

    echo "======================"
    echo " Fixing core.2e636af1 "
    echo "======================"
    cd $TARGET/2e636af1/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests && patch -p0 --forward) < ../../../patch/core.2e636af1.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests && make check)
    cd ../../../
    echo "============================="
    echo " End of fixing core.2e636af1 "
    echo "============================="
 
    echo "======================"
    echo " Fixing core.b8108fd2 "
    echo "======================"
    cd $TARGET/b8108fd2/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests/misc && patch -p0 --forward) < ../../../patch/core.b8108fd2.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests/misc && make check)
    cd ../../../
    echo "============================="
    echo " End of fixing core.b8108fd2 "
    echo "============================="

    echo "======================"
    echo " Fixing core.a860ca32 "
    echo "======================"
    cd $TARGET/a860ca32/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests/misc && patch -p0 --forward) < ../../../patch/core.a860ca32.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests/misc && make check)
    cd ../../../
    echo "============================="
    echo " End of fixing core.a860ca32 "
    echo "============================="

fi

if [[ "$1" = "grep" ]]
then
    if [[ -z "$TARGET" ]]
    then
        TARGET=grep
    fi
    ERROR_REVS=(3c3bdace c1cb19fe 8f08d8e2 3220317a 9c45c193 5fa8c7c9 6d952bee db9d6340 54d55bba)
    for REV in "${ERROR_REVS[@]}"
    do
        echo "======================"
        echo " Fixing grep.$REV "
        echo "======================"
        cd $TARGET/$REV/grep
        echo "================="
        echo " Running make... "
        echo "================="
        make
        echo "==================="    
        echo " Applying patch... "
        echo "==================="
        (cd tests && patch -p0 --forward) < ../../../patch/grep.$REV.patch
        echo "======================="
        echo " Running make check... "
        echo "======================="
        (cd tests && make check)
        cd ../../../
    done

fi
