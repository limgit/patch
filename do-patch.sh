#! /bin/bash

# Change cwd to parent directory of current script
cd "${0%/*}"
cd ..

if [[ -z "$1" ]]
then
    echo "Usage: $0 [core]"
    exit 1
fi

if [[ "$1" = "core" ]]
then
    echo "======================"
    echo " Fixing core.61de57cd "
    echo "======================"
    cd coreutils/61de57cd/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests && patch -p0) < ../../../patch/core.61de57cd.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests && make check)
    cd ../../../

    echo "======================"
    echo " Fixing core.2e636af1 "
    echo "======================"
    cd coreutils/2e636af1/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests && patch -p0) < ../../../patch/core.2e636af1.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests && make check)
    cd ../../../
 
    echo "======================"
    echo " Fixing core.b8108fd2 "
    echo "======================"
    cd coreutils/b8108fd2/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests/misc && patch -p0) < ../../../patch/core.b8108fd2.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests/misc && make check)
    cd ../../../

    echo "======================"
    echo " Fixing core.a860ca32 "
    echo "======================"
    cd coreutils/a860ca32/coreutils
    echo "================="
    echo " Running make... "
    echo "================="
    make
    echo "==================="    
    echo " Applying patch... "
    echo "==================="
    (cd tests/misc && patch -p0) < ../../../patch/core.a860ca32.patch
    echo "======================="
    echo " Running make check... "
    echo "======================="
    (cd tests/misc && make check)
    cd ../../../

fi
