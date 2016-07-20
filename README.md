
<!-- README.md is generated from README.Rmd. Please edit that file -->
copertura
=========

The goal of copertura is to make it easy to solve the Maximal Location Coverage Problem. Currently it uses the `lp` solver from the `lpsolve` package.

Why copertura?
==============

It is named "copertura" as this means "coverage" in Italian, and the research problem that created the need for this package is in Ticino, the Italian speaking canton of Switzerland.

How to Install
==============

``` r

# install.packages("devtools")
devtools::install_github("njtierney/copertura")
```

Example Usage
-------------

``` r

library(copertura)

# generate the A matrix with a function

rand_A <- function(I, J){
    
    rand_vec <- sample(c(0,1),
                       size = I,
                       replace = TRUE)
    
    A <- matrix(rep(rand_vec, J),
                nrow = J)
    
    return(A) 
}

my_A <- rand_A(I = 100, # 100 locations
               J = 20) # 20 cases

# top corner
my_A[1:5,1:5]
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    1    0    1    1
#> [2,]    0    0    1    1    0
#> [3,]    0    0    1    1    0
#> [4,]    0    1    0    0    0
#> [5,]    0    1    1    1    1

# bottom corner
my_A[16:20,96:100]
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    1    1
#> [2,]    1    1    0    1    1
#> [3,]    0    1    0    0    1
#> [4,]    1    0    0    1    0
#> [5,]    0    0    0    0    1

my_soln <- max_coverage(A = my_A,
                        num_aed = 5) # five AEDs
# print the solution.
my_soln$solution
#>   [1] 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#>  [36] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#>  [71] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1
#> [106] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
```

Speed
=====

When A is 20 rows and 100 columns

``` r

my_A <- rand_A(I = 100, # 100 locations
               J = 20) # 20 cases

system.time(
max_coverage(A = my_A,
             num_aed = 5) # five AEDs
)
#>    user  system elapsed 
#>   0.001   0.000   0.000
```

When A is 200 rows and 1,000 columns

``` r

my_A <- rand_A(I = 1000, # 1000 locations
               J = 200) # 200 cases

system.time(
max_coverage(A = my_A,
             num_aed = 5) # five AEDs
)
#>    user  system elapsed 
#>   0.085   0.007   0.094
```

When A is 2,000 rows and 10,000 columns

``` r
my_A <- rand_A(I = 10000, # 10000 locations
               J = 2000) # 2000 cases

system.time(
max_coverage(A = my_A,
             num_aed = 5) # five AEDs
)
#>    user  system elapsed 
#>   5.284   0.844   6.184
```

When A is 10,000 rows and 50,000 columns

``` r
my_A <- rand_A(I = 50000, # 100000 locations
               J = 10000) # 20000 cases

system.time(
max_coverage(A = my_A,
             num_aed = 5) # five AEDs
)
#>    user  system elapsed 
#> 370.589  78.001 497.213
```

Known Issues
============

At this point the package is in a prototype stage, and does not scale super well. There may also be identified bugs, please keep this in mind!

Future Work
===========

In the future we will include a set of functions to allow the user to keep their work within a dataframe and specify the potential locations and the cases that require coverage.