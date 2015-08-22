## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL		## cache for matrix inverse. set to NULL by default
        set <- function(y) {	## function to set the matrix
                x <<- y
                inv <<- NULL
        }
        get <- function() x	## function to read the matrix
        setInv <- function(invMat) inv <<- invMat	## function to set the matrix inverse
        getInv <- function() inv	## function to read the matrix inverse
        list(set = set, get = get,	## function returns a list containing the four get and set methods
             setInv = setInv,
             getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        if(is.null(x$getInv())) {	## checking if the matrix inverse is NULL or not i.e inverse has been set in cache or not
                message("Calculating inverse")	## if not set then displaying appropriate message
		x$setInv(solve(x$get()))	## and calculating the matrix inverse and setting the cache
        }
	else{						## if inverse is set
		message("Getting cached inverse")	## then displaying the appropriate message
	}
	x$getInv()	## returning the matrix inverse from the cache
}

## some sample usage

x <- makeCacheMatrix(matrix(c(1, 2, 9, 4, 8, 7, 3, 4, 16), 3, 3))	## setting the matrix

x$get()		## checking matrix value
     [,1] [,2] [,3]
[1,]    1    4    3
[2,]    2    8    4
[3,]    9    7   16

x$getInv()	## checking that matrix inverse has not been cached or not
NULL

cacheSolve(x)	## cacheSolve is calculating the inverse as the cache is not set
Calculating inverse
            [,1]       [,2]        [,3]
[1,] -1.72413793  0.7413793  0.13793103
[2,] -0.06896552  0.1896552 -0.03448276
[3,]  1.00000000 -0.5000000  0.00000000

x$getInv()	## now getInv() method returns the matrix inverse from cache. cache  has been set in the previous step
            [,1]       [,2]        [,3]
[1,] -1.72413793  0.7413793  0.13793103
[2,] -0.06896552  0.1896552 -0.03448276
[3,]  1.00000000 -0.5000000  0.00000000

cacheSolve(x)	## cacheSolve is fetching the inverse from the cache
Getting cached inverse
            [,1]       [,2]        [,3]
[1,] -1.72413793  0.7413793  0.13793103
[2,] -0.06896552  0.1896552 -0.03448276
[3,]  1.00000000 -0.5000000  0.00000000

solve(x$get())	## manually calculating matrix inverse. The value matches with the value returned from cache
            [,1]       [,2]        [,3]
[1,] -1.72413793  0.7413793  0.13793103
[2,] -0.06896552  0.1896552 -0.03448276
[3,]  1.00000000 -0.5000000  0.00000000





