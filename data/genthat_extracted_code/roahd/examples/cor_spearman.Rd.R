library(roahd)


### Name: cor_spearman
### Title: Spearman's correlation coefficient for multivariate functional
###   data
### Aliases: cor_spearman

### ** Examples


#### TOTALLY INDEPENDENT COMPONENTS

N = 2e2
P = 1e3

grid = seq( 0, 1, length.out = P )

# Creating an exponential covariance function to simulate guassian data
Cov = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Simulating (independent) gaussian functional data with given center and
# covariance function
Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )

# Using the simulated data as (independent) components of a bivariate functional
# dataset
mfD = mfData( grid, list( Data_1, Data_2 ) )

# Correlation approx. zero (components were created independently)
cor_spearman( mfD, ordering = 'MEI' )

# Correlation approx. zero (components were created independently)
cor_spearman( mfD, ordering = 'MHI' )

#### TOTALLY DEPENDENT COMPONENTS

# Nonlinear transform of first component
Data_3 = t( apply( Data_1, 1, exp ) )

# Creating bivariate dataset starting from nonlinearly-dependent components
mfD = mfData( grid, list( Data_1, Data_3 ) )

# Correlation very high (components are nonlinearly dependent)
cor_spearman( mfD, ordering = 'MEI' )

# Correlation very high (components are nonlinearly dependent)
cor_spearman( mfD, ordering = 'MHI' )




