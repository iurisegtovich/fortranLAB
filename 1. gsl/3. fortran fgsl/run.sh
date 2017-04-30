#1 /urs/env/bin bash

make

#test
./main.static.elf


#test
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
./main.shared.elf


