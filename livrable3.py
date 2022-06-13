from sklearn.cluster import KMeans
import pandas as pd
import numpy as np
import numpy.random as rd
import warnings
import matplotlib.pyplot as plt

datas = pd.read_csv('data.csv',sep=';', usecols = [i for i in range(1,15)])

#print(datas)

tab = []

for col in datas.columns:
    tab.append(col)


tab = tab[:-1]

#print(tab)


def Centreduire(tab):
    return (tab - np.mean(tab,axis=0))/np.std(tab,axis=0)

test = Centreduire(datas._get_numeric_data())
#print(test)

def Distance(L1,L2):
    #calcule la distance euclidienne entre 2 tableaux lignes de même taille
    p=len(L1)
    d=0
    for i in range(p):
        d+=(L1[i]-L2[i])**2
    return np.sqrt(d)

def Kmoyennes(Tab,N):
    (n,p)=Tab.shape
    
    #Initialisation des centroides avec individus aléatoires de Tab
    Centroids=np.zeros((N,p))
    rand=rd.randint(n,size=N)
    for k in range(N):
        Centroids[k]=Tab[rand[k]]
    
    for I in range(40):
        #Création du tableau des numéros de clusters
        Labels=np.zeros(n)
        Dist_i=np.zeros(N)
        for i in range(n):
            for k in range(N):
                Dist_i[k]=Distance(Tab[i],Centroids[k])
            Labels[i]=np.argmin(Dist_i)
        
        #Calcul des nouveaux centroides
        for k in range(N):
            Cluster_k=np.array([]).reshape(0,p)  #tableau qui contiendra les individus labellisés k
            for i in range(n):
                if Labels[i]==k:
                    Cluster_k=np.append(Cluster_k,[Tab[i]],axis=0)
            #print(Cluster_k)
            Centroids[k]=np.mean(Cluster_k,axis=0)
            
    return Labels, Centroids

warnings.filterwarnings("ignore",category=DeprecationWarning)

def CoordCluster(X,Y,Num,i):
    image = np.where(Num.labels_ == i)
    return X[image], Y[image]

for i in range(len(tab)):
    test[tab[i]] = test[tab[i]].fillna(0)

#print(test)

Res = KMeans(n_clusters = 4).fit(test)

Centres = Res.cluster_centers_

print(Centres)

#for i in range(4):
    #Xi, Yi = CoordCluster(X,Y,Res,i)
    #plt.plot(Xi,Yi,'o',color=Color[i])
    #plt.pie(Centres[i,0], Centres[i,1], '+', color='black')