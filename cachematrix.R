## tthese functions calculte the inverse of a matrix if it is the fist time it is asked or get it from the cache

## Create 4 functions to read and get the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() {x}
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() {m}
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

# Get the inverse of a matrix either by calculation or via the cache if it has been called once before
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
