# Tests:
context("rule_fill_gradient")

test_that("rule_fill_gradient works in the limits (0.6 syntax)", {
  # Deprecated
  data(iris)
  x <- condformat(iris[c(1,51,101),])
  expect_warning(r1 <- rule_fill_gradient(Sepal.Length, low = "#FF0000", high = "#00FF00"))
  y <- x + r1
  out <- condformat2html(y)
  expect_match(out, "^<table.*</table>$")
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#FF0000.*5.1)", line))),
    1)
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#00FF00.*7.0)", line))),
    1)
})

test_that("rule_fill_gradient works in the limits (0.7 syntax)", {
  data(iris)
  x <- condformat(iris[c(1,51,101),])
  y <- x %>% rule_fill_gradient(Sepal.Length, low = "#FF0000", high = "#00FF00")
  out <- condformat2html(y)
  expect_match(out, "^<table.*</table>$")
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#FF0000.*5.1)", line))),
    1)
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#00FF00.*7.0)", line))),
    1)
})


test_that("rule_fill_gradient_ works in the limits (0.6 syntax)", {
  # Deprecated
  data(iris)
  x <- condformat(iris[c(1,51,101),])
  expect_warning(r1 <- rule_fill_gradient_("Sepal.Length", low = "#FF0000", high = "#00FF00"))
  y <- x + r1
  out <- condformat2html(y)
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#FF0000.*5.1)", line))),
    1)
  expect_equal(
    length(sapply(strsplit(as.character(out), "\n", fixed = TRUE),
                  function(line) grep("(#00FF00.*7.0)", line))),
    1)
})

context("rule_fill_gradient2")

test_that("rule_fill_gradient2 works (0.6 syntax)", {
  data(iris)
  x <- condformat(iris[c(1, 51, 101),])
  expect_warning(r1 <- rule_fill_gradient2(Sepal.Length))
  y <- x + r1
  out <- condformat2html(y)
  expect_warning(r2 <- rule_fill_gradient2_("Sepal.Length"))
  y2 <- x + r2
  out2 <- condformat2html(y2)
  expect_match(out, "^<table.*</table>$")
  expect_equal(out, out2)
})

test_that("rule_fill_gradient2 works (0.7 syntax)", {
  data(iris)
  x <- condformat(iris[c(1, 51, 101),])
  y <- x %>% rule_fill_gradient2(Sepal.Length)
  out <- condformat2html(y)
  y2 <- x %>% rule_fill_gradient2("Sepal.Length")
  out2 <- condformat2html(y2)
  expect_match(out, "^<table.*</table>$")
  expect_equal(out, out2)
})
