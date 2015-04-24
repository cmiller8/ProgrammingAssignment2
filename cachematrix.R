## Coursera Assignment #2 __ Scoping Exercise

## The goal of this function can be best described according to the assignment outline:

        # Matrix inversion is usually a costly computation and there may be some benefit to caching 
        # the inverse of a matrix rather than computing it repeatedly 
        # (there are also alternatives to matrix inversion that we will not discuss here). 
        # Your assignment is to write a pair of functions that cache the inverse of a matrix.

##The first function is a set of functions that sets, gets, and provides caching functionality
##A good description can also be found in the assignment docs:

        ##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        ##create the inverse placeholder
        inv <- NULL 
        
        ##create the 'set' function to assign the calculated inverse to the cache
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        
        ##create the 'get' function to determine if a cached inverse exists
        get <- function() x
        
        #create the 'setinverse' fucntino to solve for the inverse
        setinverse <- function(solve) inv <<- inverse
        
        #create the 'getinverse' functino to retrieve the calculated inverse
        getinverse <- function() inv
        
        #assigne functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The 'cacheSolve' function is the workhorse function which is utilizing the functions created
## in 'makeCacheMatrix' to check if the inverse has been calculated already and, if not, calculates it

cacheSolve <- function(x, ...) {
        
        ##get the 'inv' stored in the cache and if it exists, then use it!
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        
        ##at this point, the fucntion knows that the inverse didn't exist in the cache 
        ##so we must compute it and set the cache for future retrieval
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(m)
        return(inv)
}
