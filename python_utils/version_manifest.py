# version manifest

def version_manifest(f):
  import subprocess #check_output
  import time #strftime, localtime
  import os #path.getmtime
  
  #using bash' readlink to find out original path of 
  #parsing string from bash command
  phys_file_path_str=str(subprocess.check_output("readlink -f "+"\""+f+"\"", shell=True))[2:-3]
  #parsing string from mtime functions
  modification_time = time.strftime('"%d/%m/%y %H:%M:%S"', time.localtime(os.path.getmtime(str(phys_file_path_str))))
  return phys_file_path_str, modification_time
  
phys_file_path_str, modification_time = version_manifest(__file__)
