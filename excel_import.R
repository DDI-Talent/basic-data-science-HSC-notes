library(readxl)

cancelled_data <- read_excel(here("data", "phs_cancelled.x1sx"), sheet = "2016")

phs_cancelled <- read_excel ("data/phs_cancelled.x1sx",
sheet = "2016", col_types = c("text",
"text", "numeric", "skip", "skip", "numeric",
"numeric", "skip", "numeric", "skip", "numeric", "skip",
"numeric", "skip"))
