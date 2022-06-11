## Get inverse of a matrix
## functions do

## makeCacheMatrix is to create a special "vector", which is a list containing a function to set/get the value of the matrix and set/get value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        m<- NULL
        set <- function(y) {
                x <<-y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list (set=set, get=get,
              setInverse=setInverse,
              getInverse=getInverse)
        }


## This is to calculate inverse of the special vector created above.

cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- slove(data,...)
        x$setInverse(m)
        m
}
