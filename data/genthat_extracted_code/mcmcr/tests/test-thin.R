context("thin")

test_that("thin.mcmcarray", {
  expect_identical(thin(mcmcr_example[[1]]), mcmcr_example[[1]])
  mcmcr2t <- thin(mcmcr_example[[2]], 2L)
  expect_identical(nchains(mcmcr2t), nchains(mcmcr_example[[2]]))
  expect_equal(niters(mcmcr2t), niters(mcmcr_example[[2]]) / 2)
})

test_that("thin.mcmcr", {
  expect_identical(thin(mcmcr_example), mcmcr_example)
  mcmcr2t <- thin(mcmcr_example, 2L)
  expect_identical(nchains(mcmcr2t), nchains(mcmcr_example))
  expect_equal(niters(mcmcr2t), niters(mcmcr_example) / 2)
  expect_equal(terms(mcmcr2t), terms(mcmcr_example))
})
