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

    return fig, ax

def test_plotres():
    from numpy import sin
    fig,ax=plotres(lambda x: sin(x),-.1,10)
    fig.canvas.draw()
    fig.savefig("test_plotres.png")
    return

