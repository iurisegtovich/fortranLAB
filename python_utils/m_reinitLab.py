#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar 25 10:03:49 2018

@author: segtovichisv

usage:

# insert path
import sys
with open("../lib_paths/python_utils.path","r") as f:
    path = f.readline()[:-1]
    print(path)
    sys.path.insert(0, path)

# standard import
from python_utils import m_reinitLab

# self test
#m_reinitLab = m_reinitLab.reinitLab("python_utils.m_reinitLab")

"""

# Import-version-print-manifest
import subprocess as _subprocess #check_output
import time as _time #strftime, localtime
import os as _os #path.getmtime

#using bash' readlink to find out original path of 
_bash_command="readlink -f "
#parsing string from bash command
_phys_file_path_str=str(_subprocess.check_output(_bash_command+"\""+__file__+"\"", shell=True))[2:-3]
#parsing string from mtime functions
_modification_time = _time.strftime('"%d/%m/%y %H:%M:%S"', _time.localtime(_os.path.getmtime(str(_phys_file_path_str))))
_manifest="loading "+"m_reinitLab.py"+" from \n", _phys_file_path_str, 
"\n modified at ", _modification_time
m_reinitLab_manifest=_manifest
#print(m_reinitLab_manifest)

def reinitLab(module_name,varsdict=None,echo=False):
    '''module_name :: string with complete reference to the module, e.g. "myPackage.aModule.targetSubmodule";
                      to be checked against sys.modules and fed into importlib.reload or importlib.import_module.
       varsdict :: to be fed with vars() from local scope,
                   will update the varsdict object as if "from myPackage.aModule.targetSubmodule import *" was run in the caller scope,
                   but ignoring variables starting with _
                   returns the filtereddict, which was used to update the varsdict,
                   there is no need to bind it in the caller scope except for debugging purposes;
                   if None, returns the module object as if "import myPackage.aModule.targetSubmodule as _*" was run in the caller scope.
       echo :: if True, tries to print the _manifest variable of the target module.
    '''
    import importlib
    import sys
    
    if module_name in sys.modules:
        module_name_obj=importlib.reload(sys.modules[module_name])
    else:
        module_name_obj=importlib.import_module(module_name)
    
    if echo:
        print(module_name_obj._manifest)
    
    if varsdict is not None:
        filtereddict={k: v for k, v in module_name_obj.__dict__.items() if k[0] != "_"}
        varsdict.update(filtereddict) #update as in "from m_HydLab import *"
        return filtereddict
    else:
        return module_name_obj#return newly either newly imported module or update existing
