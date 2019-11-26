# Bootstrap 1.0
Bootstrap method for the LWS estimator version 1.0

The software in Matlab allows to compute two types of bootstrap for the least trimmed
squares and least weighted squares estimators of parameters in linear regression.
Particularly, residual bootstrap and nonparametric bootstrap are computed, which
yields estimates of the covariance matrix of the two robust estimators. The method
allows to compare the stability of the estimates and reveals to bring arguments
in favor of the least weighted squares estimator over a variety of datasets.

Feel free to use or modify the code.

## Requirements

 * You need the file fastlts.m to run the full code, which compares the LWS with the least trimmed squares (LTS) estimator. 
   Available at https://jp.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/17554/versions/5/previews/fastlts.m/index.html

 * You will need also the LWS method, particularly the file lwsCheck.m.
   Available at https://github.com/Veragin/LWScode

## Usage
   Start file bootstrap.m

### Interpreting the results

* Each run of the bootstrap yields two rows of output, one for the LWS and one for the LTS.
* Each row contains variances (i.e. evaluated as diagonal elements of the covariance matrix) of the corresponding estimator.
 
## Authors
 * Jan Tichavský, The Czech Academy of Sciences, Institute of Computer Science
 * Jan Kalina, The Czech Academy of Sciences, Institute of Computer Science

## Contact

Do not hesitate to contact us (tichavsk@seznam.cz) or write an Issue.

## How to cite

Please consider citing the following:

Tichavský J, Kalina J (2019). LWS code. Available at https://github.com/Veragin/Bootstrap.

Kalina J, Tichavský J (2019). Statistical learning for recommending (robust) nonlinear regression methods. Journal of Applied Mathematics, Statistics and Informatics 15 (2). In press.

## Acknowledgement

This work was supported by the Czech Science Foundation grant 19-05704S.