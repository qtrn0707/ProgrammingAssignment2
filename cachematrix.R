## 1. makeCacheMatrix: This function creates a special "matrix" object that can
##    cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix"
##    returned by makeCacheMatrix above. If the inverse has already been
##    calculated (and the matrix has not changed), then the cachesolve should
##    retrieve the inverse from the cache.

## Return a list of 4 functions:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        
        inv <- NULL
        
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        
        get <- function() x
        
        setInverse <- function(inverse) inv <<- inverse
        
        getInverse <- function() inv
        
        return (list(set = set, get = get, setInverse = setInverse,
                     getInverse = getInverse))
        
}


## If the inverse has already been cached, return that.
## If not, calculate the inverse and then return it.

cacheSolve <- function(x, ...) {
        
        inv <- x$getInverse()
        
        if (!is.null(inv)) {
                message("getting cached data")
                return(m)
        }
        
        # Else:
        inv <- solve(x$get(), ...)
        x$setInverse(inv)
        return (inv)
        
}
