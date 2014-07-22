centroid.distance  <-  function(centroids){
  k  =  length(centroids[, 1])
  separation   =   matrix(0, k, k)
  for ( i in 1 : k){
    for ( j in 1 : k){
      separation[i, j]  =  sqrt( (centroids[i,1] - centroids[j,1]) ^ 2  +  (centroids[i,2] - centroids[j,2]) ^ 2 )
    }
  }
  return(separation)
}

gravity.model.probabilites.all.same.parameters <- function (separation, population, alpha, beta){
  k  =  length(population)
  flow.probs  =  matirx(0, k, k)
  for (i in 1 : k){
    for (j in 1 : k){
      flow.probs[i, j] = (population[j] ^ (alpha))/ (separation[i, j] ^(beta))
    }
  }
  return(flow.probs)
}