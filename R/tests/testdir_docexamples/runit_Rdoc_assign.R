setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source('../findNSourceUtils.R')

test.h2o.assign.golden <- function(H2Oserver) {
	

prosPath = system.file("extdata", "prostate.csv", package="h2o")
prostate.hex = h2o.importFile(H2Oserver, path = prosPath)
prostate.qs = quantile(prostate.hex$PSA)
PSA.outliers = prostate.hex[prostate.hex$PSA <= prostate.qs[2] | prostate.hex$PSA >= prostate.qs[10],]
PSA.outliers = h2o.assign(PSA.outliers, "PSA.outliers")
head(prostate.hex)
head(PSA.outliers)

testEnd()
}

doTest("R Doc h2o.assign", test.h2o.assign.golden)