load("~/Documents/Dengue Vietnam data/Viet_dat.RData")
centroids1 = unlist(list.dat[1])
centroids = matrix(0, 22, 2)
centroids[,1] = centroids1[1:22]
centroids[,2] = centroids1[23:44]
incidence = unlist(list.dat[2])
cases = unlist(list.dat[3])
population = unlist(list.dat[4])
