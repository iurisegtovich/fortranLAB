def labdict(names,objlist):
    return dict(zip(names.replace(" ","").split(","),objlist))

'''x=1
y=2
z=3
print(labdict("x,y,z",
              [x,y,z]))'''

def ddicteval(ddict,keys):
    for key in keys:
        value=ddict[key]
        ddict=value
        pass
    return value

'''testddict={"C1":{"com":"value"}}
value=ddicteval(testddict,("C1","com",))
print(value)'''
