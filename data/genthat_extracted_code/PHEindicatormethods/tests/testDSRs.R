context("test_phe_dsr")

#test calculations
test_that("dsrs and CIs calculate correctly",{

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop)),
               data.frame(select(test_DSR_results[9:11,],1,4:6)),
               check.attributes=FALSE, check.names=FALSE,info="test default")

  expect_equal(data.frame(phe_dsr(test_DSR_1976, count, pop, stdpop = test_DSR_1976$esp1976)),
               select(slice(test_DSR_results,12),4:6),
               check.attributes=FALSE, check.names=FALSE,info="test with user specified vector")

  expect_equal(data.frame(phe_dsr(test_DSR_1976, count, pop, stdpop = esp1976, stdpoptype="field")),
               data.frame(select(slice(test_DSR_results,12),4:6)),
               check.attributes=FALSE, check.names=FALSE,info="test with user specified stdpop by col name")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop,
               stdpop = c(5000, 5500, 5500, 5500, 6000, 6000, 6500, 7000, 7000, 7000, 7000, 6500, 6000, 5500, 5000, 4000, 2500, 1500, 1000))),
               data.frame(select(slice(test_DSR_results,9:11),1,4:6)),
               check.attributes=FALSE, check.names=FALSE,info="test stdpop as specified vector")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, type="full")),
               data.frame(select(slice(test_DSR_results,9:11),1:9)),
               check.attributes=FALSE, check.names=FALSE,info="test full")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, type="value")),
               data.frame(select(slice(test_DSR_results,9:11),1,4)),
               check.attributes=FALSE, check.names=FALSE,info="test value")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, type="lower")),
               data.frame(select(slice(test_DSR_results,9:11),1,5)),
               check.attributes=FALSE, check.names=FALSE,info="test lower")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, type="upper")),
               data.frame(select(slice(test_DSR_results,9:11),1,6)),
               check.attributes=FALSE, check.names=FALSE,info="test upper")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, confidence = 0.998)),
               data.frame(select(slice(test_DSR_results,13:15),1,4:6)),
               check.attributes=FALSE, check.names=FALSE,info="test confidence")

  expect_equal(data.frame(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, multiplier=10000)),
               data.frame(select(slice(test_DSR_results,1:3),1,4:6)),
               check.attributes=FALSE, check.names=FALSE,info="test multiplier")

})




# test error handling

test_that("dsrs - errors are generated when invalid arguments are used",{

  expect_error(phe_dsr(test_multiarea, count),
                "function phe_dsr requires at least 3 arguments: data, x, n",info="error invalid number of arguments")

  expect_error(phe_dsr(test_err1, count, pop, stdpop = esp2013),
               "numerators must all be greater than or equal to zero",info="error numerators < 0")

  expect_error(phe_dsr(test_err2, count, pop, stdpop = esp2013),
               "denominators must all be greater than zero",info="error denominator = 0")

  expect_error(phe_dsr(test_err3, count, pop, stdpop = esp2013),
               "denominators must all be greater than zero",info="error denominator < 0")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, confidence = 0.74),
               "confidence level must be between 90 and 100 or between 0.9 and 1",info="error confidence < 0.9")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, confidence = 3),
               "confidence level must be between 90 and 100 or between 0.9 and 1",info="error confidence between 1 and 90")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, confidence = 1000),
               "confidence level must be between 90 and 100 or between 0.9 and 1",info="error confidence >100")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpop = esp2013, type="combined"),
               "type must be one of value, lower, upper, standard or full",info="error invalid type")

  expect_error(phe_dsr(filter(test_multiarea,count < 100), count, pop, stdpop = esp2013),
               "data must contain the same number of rows for each group",info="error num rows per group")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpop = test_DSR_1976$esp1976),
               "stdpop length must equal number of rows in each group within data",info="error stdpop length")

  expect_error(phe_dsr(test_multiarea, count, pop, stdpoptype = "column"),
               "valid values for stdpoptype are vector and field",info="error stdpoptype")

  expect_error(phe_dsr(test_DSR_1976, count, pop, stdpoptype = "field", stdpop = esp),
               "stdpop is not a field name from data",info="error stdpop field doesn't exist")
})


