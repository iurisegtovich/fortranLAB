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


def place_abcd(*args, **kwargs):
    print('''
#https://stackoverflow.com/questions/18344939/matplotlib-panel-label-out-of-the-box-above-the-ylabel
#subnumbering with letters
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams["font.family"] = "dejavu serif"
fig = plt.figure()
for i, label in enumerate(('(a)', '(b)', '(c)', '(d)')):
    ax = fig.add_subplot(2,2,i+1)
    ax.text(0.05, 0.95, label, transform=ax.transAxes, va='top')
plt.tight_layout()
plt.show()
    ''')
    
    print('''
#complete subcaption above
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams["font.family"] = "dejavu serif"
fig = plt.figure()
for i, label in enumerate(('(a) A subcaption', '(b) A subcaption', '(c) A subcaption', '(d) A subcaption')):
    ax = fig.add_subplot(2,2,i+1)
    ax.set_title(label,loc='center')
plt.tight_layout()
plt.show()
    ''')
    
    print('''
#complete subcaption below plus legend on the side
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import gridspec

plt.rcParams["font.family"] = "dejavu serif"

fig = plt.figure()

gs = gridspec.GridSpec(4,4, height_ratios=(1,.01,1,.01), width_ratios=(1,.3,1,.3))
axs = np.ndarray([4,4],dtype=object)
series1 = np.ndarray([4,4],dtype=object)
series2 = np.ndarray([4,4],dtype=object)


for i in (0,2):
    for j in (0,2):
# for i, label in enumerate(()):
        for ax in (axs[i,j],):
            ax = fig.add_subplot(gs[i,j])
            #the comma is essential to unpack the series from the 1 element list
            series1[i,j], =ax.plot([0,1],[.1,1],label=str(i)+str(j))
            series2[i,j], =ax.plot([.5,0],[0,.3],label=str(i)+str(j)+'b')                        
#     ax.set_title(label,loc='center')

labels=[['(a) A subcaption', '(b) A subcaption'], ['(c) A subcaption', '(d) A subcaption']]
for i in (1,3):
    for j in (0,2):
        for ax in (axs[i,j],):
            ax = fig.add_subplot(gs[i,j])
            ax.set_title(labels[(i-1)//2][j//2],loc='center')
            for each in ('top','bottom','right','left'):
                ax.spines[each].set_visible(False)
            ax.axes.xaxis.set_visible(False)
            ax.axes.yaxis.set_visible(False)

            
labels=[['(a) A subcaption', '(b) A subcaption'], ['(c) A subcaption', '(d) A subcaption']]
for i in (0,2):
    for j in (1,3):
        for ax in (axs[i,j],):
            ax = fig.add_subplot(gs[i,j])
            for each in ('top','bottom','right','left'):
                ax.spines[each].set_visible(False)
            ax.axes.xaxis.set_visible(False)
            ax.axes.yaxis.set_visible(False)
            ax.legend((series1[i,j-1],series2[i,j-1]),(series1[i,j-1].get_label(),series2[i,j-1].get_label()))


plt.tight_layout()
plt.show()
    ''')
    return
