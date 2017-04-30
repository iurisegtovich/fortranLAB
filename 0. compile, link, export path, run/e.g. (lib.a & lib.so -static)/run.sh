make
echo '# READ SHARED: ----------------------------------------------------'
readelf -d ./main/elf/shared/main.elf
echo '# RUN SHARED WITH BAD PATH: ----------------------------------------------------'
./main/elf/shared/main.elf
echo '#'
echo '# FAILS ----------------------------------------------------'
echo '#'
echo '# READ STATIC: ----------------------------------------------------'
readelf -d ./main/elf/static/main.elf
echo '# RUN STATIC: ----------------------------------------------------'
./main/elf/static/main.elf
echo '#'
echo '# SUCCESS ----------------------------------------------------'
