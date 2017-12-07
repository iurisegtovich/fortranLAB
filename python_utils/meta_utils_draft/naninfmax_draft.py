def naninf(x0,xmin=-np.inf,xmax=np.inf,jtol=0):
    import numpy as np
    x1=x0[np.logical_not(np.isnan(x0))]
    x2=x1[np.logical_not(x1>=xmax)]
    x3=x2[np.logical_not(x2<=xmin)]
    x4=x3[np.logical_not(np.imag(x3)>jtol)]
    return np.real(x4)
    

def test():
    import numpy as np
    x=np.array([1,2,3+j,np.nan, 4,5,np.inf,6,-np.inf,7])
    print(naninf(x,jtol=2))
    print(naninf(x,jtol=2))
