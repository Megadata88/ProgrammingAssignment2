## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # Initialize a cache variable to store the inverse
  cache <- NULL
  
  # Define a function to set the matrix
  set <- function(matrix) {
    x <<- matrix  # Use <<- to assign to the parent environment
    cache <<- NULL  # Clear the cache when a new matrix is set
  }
  
  # Define a function to get the matrix
  get <- function() {
    x  # Return the matrix
  }
  
  # Define a function to cache the matrix's inverse
  setInverse <- function(inverse) {
    cache <<- inverse
  }
  
  # Define a function to get the cached inverse if available
  getInverse <- function() {
    cache
  }
  
  # Return a list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  # Check if the cached inverse exists and return it if available
  cached_inverse <- mat$getInverse()
  if (!is.null(cached_inverse)) {
    message("Getting cached inverse")
    return(cached_inverse)
  }
  
  # If the cached inverse does not exist, calculate the inverse and cache it
  matrix_data <- mat$get()
  if (!is.null(matrix_data)) {
    message("Calculating and caching new inverse")
    inverse <- solve(matrix_data)
    mat$setInverse(inverse)
    return(inverse)
  } else {
    stop("Matrix is not set.")
  }
}


# Create a special matrix object
mat <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow = 2))

# Get the matrix
mat$get()

# Calculate and cache the inverse
cacheSolve(mat)

# Retrieve the cached inverse
cacheSolve(mat)  # This should retrieve the cached inverse without recalculating it
