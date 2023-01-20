#!/bin/Rscript

install.packages(
   c(
      `httr2`,
      'rlang',
      'uuid', 
      'digest', 
      'callr', 
      'tidyverse', 
      'dplyr',
      'rversions',
      'shiny',
      'DT',
      'covr',
      'roxygen2',
      'formatR', 
      'remotes', 
      'selectr', 
      'caTools', 
      'stringi', 
      'curl',
      'openssl',
      'git2r',
      'httr',
      'gh',
      'usethis',
      'shiny',
      'RJSONIO',
      'devtools',
      'nloptr',
      'lme4'
       )
       )

install.packages("lme4")
install.packages("survminer")
install.packages("nloptr")
install.packages('IRkernel')

IRkernel::installspec(user = FALSE)