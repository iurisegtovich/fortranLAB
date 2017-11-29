#logspacedx

## Import-version-print-manifest
#import subprocess #check_output
#import time #strftime, localtime
#import os #path.getmtime

##using bash' readlink to find out original path of 
##parsing string from bash command
#phys_file_path_str=str(subprocess.check_output("readlink -f "+"\""+__file__+"\"", shell=True))[2:-3]
##parsing string from mtime functions
#modification_time = time.strftime('"%d/%m/%y %H:%M:%S"', time.localtime(os.path.getmtime(str(phys_file_path_str))))

def logspacedx(xmin,xmax,npt,base=10):
    '''returns log spaced x from xmin to xmax by calling numpy logspace from emin to emax where xmin=b**emin and xmax=b**emax'''
    from numpy import log10, logspace
    emin=log10(xmin)/log10(base)
    emax=log10(xmax)/log10(base)
    return logspace(emin,emax,npt)
