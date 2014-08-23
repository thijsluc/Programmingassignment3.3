## File : cachematrix.R
## Date : 23/07/2014
## Author: L. Thijssen
## Comment: This script contains two functions which helps to compute the
##          inverse of square matrix. As calculating the inverse matrix can
##          be a timeconsuming job an extra function was designed to store the
##          result of the last inversed matrix in the permanent-environment (memory).
##          As the input matrix has not changed this environment can be read 
##          to give the correct answer. 
##          These scripts are based on Makevector and cachemean from
##          the Coursera Course R Programming Assignment 2 Lexical scoping

## makeCacheMatrix creates a special "matrix" object that can cache a inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(z) m <<- z
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve computes the inverse of a matrix. If the inverse has already
## been calculated (and the matrix has not changed) then the function should
## retrieve the one from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached Inversed matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m

}
