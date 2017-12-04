def logspacedx(xmin,xmax,npt,base=10):
    '''returns log spaced x from xmin to xmax by calling numpy logspace from emin to emax where xmin=b**emin and xmax=b**emax'''
    from numpy import log10, logspace
    emin=log10(xmin)/log10(base)
    emax=log10(xmax)/log10(base)
    return logspace(emin,emax,npt)

def test_logspacedx():
    print(logspacedx(1,100,3))
    return

def plotres(f,xmin,xmax):
    import numpy as np
    import matplotlib
    from matplotlib import pyplot as plt
    import python_utils
    from python_utils import num_utils
    N=100
    flin=np.zeros([2*N])
    flog=np.zeros([2*N])
    xlin=np.linspace(xmin,xmax,2*N)
    
    if xmin > 0:
        xlog=num_utils.logspacedx(xmin,xmax,2*N)
    else:
        xlog=np.zeros(2*N)
        xlog[0:N] = (-1.*num_utils.logspacedx(-1*xmin/N,-1*xmin,N))[::-1]
        xlog[N:2*N]=num_utils.logspacedx(xmax/N,xmax,N)
    for i,x in enumerate(xlin):
        flin[i]=f(x)
    for i,x in enumerate(xlog):
        flog[i]=f(x)        
        
    fig,ax = plt.subplots(2,2)
    
    ax[0,0].plot(xlin,flin)
    ax[0,0].scatter(xlin,flin)
    
    ax[0,1].plot(xlog,flog)
    ax[0,1].scatter(xlog,flog)
    ax[0,1].set_xscale("symlog", linthreshx=xmax/N) 
    
    ax[1,0].plot(xlin,flin)
    ax[1,0].scatter(xlin,flin)
    ax[1,0].set_yscale("symlog", linthreshy=np.nanmax(flog[np.isfinite(flog)])/N) 

    ax[1,1].plot(xlog,flog)
    ax[1,1].scatter(xlog,flog)
    ax[1,1].set_xscale("symlog", linthreshx=max(abs(xmax),abs(xmin))/N)    
    ax[1,1].set_yscale("symlog", linthreshy=np.nanmax(abs(flog[np.isfinite(flog)]))/N)        
    
    for i,j in [(x, y) for x in [0,1] for y in [0,1]]:
        ax[i,j].plot(xlin,2*N*[0],c='k',ls='--')
        ax[i,j].set_xlim(xmin,xmax)
        almostzero=np.sqrt(np.min(np.concatenate([flin,flog])**2))
        ax[i,j].set_ylim(-10*almostzero, 10*almostzero)
    return fig, ax

def test_plotres():
    from numpy import sin
    fig,ax=plotres(lambda x: sin(x),-.1,10)
    fig.canvas.draw()
    fig.savefig("test_plotres.png")
    return

def hysteretical_split(x,xp,fp,verbose=False):
    import numpy as np
    if len(xp)==len(fp) and np.isscalar(x):
        n=len(xp)
        t=np.arange(n)
        piecewises=[]
        ijs=[]
        s=[+1]
        p=0
        i=0
        j=0
        while i<n:
            if np.all(np.diff(xp[j:i+1]) > 0):
                s[p]=+1
                pass
            elif np.all(np.diff(xp[j:i+1]) < 0):
                s[p]=-1
                pass
            else:
                piecewises+=[xp[j:i]]
                ijs+=[(j,i)]
                s+=[0]
                j=i
                p+=1
            i+=1
        piecewises+=[xp[j:i]] #last one, maybe the only one
        ijs+=[(j,i)]     
    return p, ijs, s

def hysteretical_interp(x,xp,fp,pi=0,verbose=False):
    import numpy as np
    if len(xp)==len(fp) and np.isscalar(x):
        p,ijs,s = hysteretical_split(x,xp,fp,verbose)
        if verbose: print("series split into ", p, " pieces")
        if verbose: print("seeking x ",x)

        if verbose: print("between ",ijs[pi])
        nx=s[pi]*x
        nxp=s[pi] * np.asarray (xp[ijs[pi][0]:ijs[pi][1]])
        nfp=fp[ijs[pi][0]:ijs[pi][1]]
        
        if verbose: print("as nx ",nx)
        if verbose: print("in nxp",nxp)
        if verbose: print("vs nfp",nfp)
        
#         print(nxp)
#         print(nfp)
        return np.interp(nx,nxp,nfp)

def test_hysteretical_interp():
    import numpy as np
    print(
    hysteretical_interp(-80,[1,2,3,4,50,60,58,40,31,22,0,-90,70,8,9],np.arange(15),1)
    )
  return
