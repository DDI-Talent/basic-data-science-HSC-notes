library(tidyverse)
library(here)

cancelled_ops1 = read_csv("phs_cancelled1.csv")

cancelled_ops2 = read_csv("data/phs_cancelled2.csv")

cancelled_ops3 = read_csv(here("data", "phs_cancelled3.csv"))

phs_cancelled4 <- read_csv("data/phs_cancelled4.csv", 
                           col_types = cols(CancelledByPatientReasonQF = col_skip(), 
                                            ClinicalReasonQF = col_skip(), Month = col_date(format = "%Y%m"), 
                                            NonClinicalCapacityReasonQF = col_skip(), 
                                            OtherReasonQF = col_skip(), TotalCancelledQF = col_skip(), 
                                            TotalOperationsQF = col_skip()))
