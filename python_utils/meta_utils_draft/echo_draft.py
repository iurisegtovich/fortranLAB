In [1]: def namestr(obj, namespace):
   ...:     return [name for name in namespace if namespace[name] is obj]
   ...: 

In [2]: 

In [2]: 

In [2]: 

In [2]: a=1

In [3]: namestr(a,globals())
Out[3]: ['a']

In [4]: namestr(a,locals())
Out[4]: ['a']

