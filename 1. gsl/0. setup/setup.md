> https://askubuntu.com/questions/490465/install-gnu-scientific-library-gsl-on-ubuntu-14-04-via-terminal

The packages for GSL can be found [here](https://launchpad.net/ubuntu/+source/gsl)
You can install just the library by using:

~~    apt-get install libgsl0ldbl ~~

    sudo apt install libgsl2

You can also install the development package and binary using:

~~    apt-get install gsl-bin ~~

    sudo apt install libgsl-dev libgsl-dbg
    sudo apt install gsl-bin 

The resources/docs can also be installed using:

~~    apt-get install gsl-doc-info gsl-doc-pdf gsl-ref-html gsl-ref-psdoc ~~

    sudo apt install gsl-doc-info gsl-doc-pdf gsl-ref-html gsl-ref-psdoc
    
THIS INSTALLS OUTDATED VERSION (2.1 IN 2017.04.29, when official site had 2.3 as latest)

https://www.gnu.org/software/gsl/
http://mirrors.ocf.berkeley.edu/gnu/gsl/


