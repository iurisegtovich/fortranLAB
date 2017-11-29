def logspacedx(xmin,xmax,npt,base=10):
    '''returns log spaced x from xmin to xmax by calling numpy logspace from emin to emax where xmin=b**emin and xmax=b**emax'''
    from numpy import log10, logspace
    emin=log10(xmin)/log10(base)
    emax=log10(xmax)/log10(base)
    return logspace(emin,emax,npt)
