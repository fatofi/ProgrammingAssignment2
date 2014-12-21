## tthese functions calculte the inverse of a matrix if it is the fist time it is asked or get it from the cache

## Create 4 functions to read and get the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL ## set inverse to NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        } ##Set function to-reassign a matrix to an old one
        get <- function() {x} ## return the original matrix
        setinverse <- function(inverse) m <<- inverse  ##assign the inverse of the matrix
        getinverse <- function() {m}  ##return the inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

# Get the inverse of a matrix either by calculation or via the cache if it has been called once before
cacheSolve <- function(x, ...) {
        m <- x$getinverse()  ##asign the inverse to me
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        } ##if it has been called before, return from cache
        data <- x$get() ##return the matrix
        m <- solve(data) ##calculate the inverse and assign to m
        x$setinverse(m) ##assign the inverse
        m ##return the inverse
}
