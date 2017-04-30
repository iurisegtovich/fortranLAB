make
readelf -d main/elf/main.elf
echo '# RUN: ----------------------------------------------------'
./main/elf/main.elf
echo '#'
echo '# RUN FAILS ----------------------------------------------------'
echo '#'
echo '#'
echo '# EXPORT LIBRARY PATH ----------------------------------------------------'
echo '#'
OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=lib1/so:$LD_LIBRARY_PATH
echo '#'
echo '# RUN AGAIN: ----------------------------------------------------'
./main/elf/main.elf
echo '#'
echo '# RUN SUCCESSFUL ----------------------------------------------------'
echo '#'
LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
