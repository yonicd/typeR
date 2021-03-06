library(checkargs)
context("isZeroOrNaOrNanVector")

test_that("isZeroOrNaOrNanVector works for all arguments", {
  expect_identical(isZeroOrNaOrNanVector(NULL, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(TRUE, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(FALSE, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(NA, stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(0, stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(-1, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(-0.1, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(0.1, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(1, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(NaN, stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(-Inf, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(Inf, stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector("", stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector("X", stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(TRUE, FALSE), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(FALSE, TRUE), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(NA, NA), stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(c(0, 0), stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(c(-1, -2), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(-0.1, -0.2), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(0.1, 0.2), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(1, 2), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(NaN, NaN), stopIfNot = FALSE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(c(-Inf, -Inf), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c(Inf, Inf), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c("", "X"), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_identical(isZeroOrNaOrNanVector(c("X", "Y"), stopIfNot = FALSE, message = NULL, argumentName = NULL), FALSE)
  expect_error(isZeroOrNaOrNanVector(NULL, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(TRUE, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(FALSE, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_identical(isZeroOrNaOrNanVector(NA, stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(0, stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_error(isZeroOrNaOrNanVector(-1, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(-0.1, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(0.1, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(1, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_identical(isZeroOrNaOrNanVector(NaN, stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_error(isZeroOrNaOrNanVector(-Inf, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(Inf, stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector("", stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector("X", stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(TRUE, FALSE), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(FALSE, TRUE), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_identical(isZeroOrNaOrNanVector(c(NA, NA), stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_identical(isZeroOrNaOrNanVector(c(0, 0), stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_error(isZeroOrNaOrNanVector(c(-1, -2), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(-0.1, -0.2), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(0.1, 0.2), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(1, 2), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_identical(isZeroOrNaOrNanVector(c(NaN, NaN), stopIfNot = TRUE, message = NULL, argumentName = NULL), TRUE)
  expect_error(isZeroOrNaOrNanVector(c(-Inf, -Inf), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c(Inf, Inf), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c("", "X"), stopIfNot = TRUE, message = NULL, argumentName = NULL))
  expect_error(isZeroOrNaOrNanVector(c("X", "Y"), stopIfNot = TRUE, message = NULL, argumentName = NULL))
})
