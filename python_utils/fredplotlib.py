def cat_colors(NCAT=1,NSUB=1):
    colorM=np.ndarray([NCAT,NSUB],dtype=object)
    diccmaptCATs={'tab20c':4}
    cmap=plt.cm.get_cmap('tab20c')
    cmapCATs=diccmaptCATs['tab20c']
    for i in range(NCAT):
        for j in range(NSUB):
            colorM[i,j]=cmap.colors[cmapCATs*i+j]
            pass
        pass
    return colorM

