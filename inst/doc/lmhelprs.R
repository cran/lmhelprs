## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(lmhelprs)
data(data_test1)
lm1a <- lm(y ~ x1 + x2, data_test1)
lm1b <- lm(y ~ x1 + x2 + x3 + x4, data_test1)
lm1c <- lm(y ~ x1 + x2 + x3 + x4 + cat2, data_test1)

## -----------------------------------------------------------------------------
hierarchical_lm(lm1b, lm1a, lm1c)

## ----error = TRUE-------------------------------------------------------------
try({
lm2a <- lm(y ~ x1 + x2, data_test1)
lm2b <- lm(y ~ x1 + x3 + x4, data_test1)
hierarchical_lm(lm2a, lm2b)
})

## -----------------------------------------------------------------------------
lm_mod <- lm(y ~ x1 + cat2 + cat1 + cat2:cat1, data_test1)
summary(lm_mod)

## -----------------------------------------------------------------------------
test_highest(lm_mod)

## ----echo = FALSE-------------------------------------------------------------
mod_test <- test_highest(lm_mod)

## -----------------------------------------------------------------------------
lm_mod3 <- lm(y ~ x1 + x2 + x3*x4*cat2, data_test1)
summary(lm_mod3)
test_highest(lm_mod3)

## ----error = TRUE-------------------------------------------------------------
try({
lm_mod2 <- lm(y ~ x1 + x2*x3 + x2*x4, data_test1)
test_highest(lm_mod2)
})

