require("pracma")



# Calculates the geodesic distance between two points specified by radian latitude/longitude using the
# Haversine formula (hf)
gcd.hf <- function(long1, lat1, long2, lat2) {
  R <- 6371 # Earth mean radius [km]
  delta.long <- (long2 - long1)
  delta.lat <- (lat2 - lat1)
  a <- sin(delta.lat/2)^2 + cos(lat1) * cos(lat2) * sin(delta.long/2)^2
  c <- 2 * asin(min(1,sqrt(a)))
  d = R * c
  return(d) # Distance in km
}


centroid.distance  <-  function(centroids){
  k  =  length(centroids[, 1])
  centroids = deg2rad(centroids)
  separation   =   matrix(0, k, k)
  for ( i in 1 : k){
    for ( j in 1 : k){
      separation[i, j]  =  gcd.hf(centroids[i, 1], centroids[i, 2], centroids[j, 1], centroids [j, 2])
    }
  }
  return(separation)
}

gravity.model.probabilites.all.same.parameters <- function (separation, population, alpha, beta){
  k  =  length(population)
  flow.proportions  =  matrix(0, k, k)
  for (i in 1 : k){
    for (j in 1 : k){
      flow.proportions[i, j] = (population[j] ^ (alpha)) / (separation[i, j] ^(beta))
    }
  }
  for ( i in 1 : k){
    flow.proportions[i, i] = 0
  }
  return(flow.probs)
}
