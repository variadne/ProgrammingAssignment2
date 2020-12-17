## Put comments here that give an overall description of what your
## functions do

## This function will create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL    ## first write inverse as NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function() {x}  ## function to get matrix
setinverse <- function(inverse){inv <<- inverse}
getinverse <- function(){inv} ## function to get the inverse of the matrix
list(set = set , get = get , setinverse = setinverse , getinverse = getinverse)
}


## With the second function we compute the inverse of the special
"matrix" returned by "makeCacheMatrix" first function.
If the inverse has already been calculated
(and the matrix has not changed), then the cachesolve
should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)){          ##check if inverse is null
message("getting cached data")
return(inv)         ## return invserse value
}
data <- x$get()
inv <- solve(data, ...) ## Computing the inverse of a square matrix  with solve()
x$setinverse(inv)
inv    ## returns a matrix that is the inverse of 'x'
}
