## Load Packages

library(stringr)
library(dplyr)
library(tidyr)

## Read in Original Data & View Contents

refine<- read.csv("refine_original.csv", stringsAsFactors = FALSE)
str(refine)
head(refine)

## Celan Up Brand Names
refine$company<- tolower(refine$company)
refine$company<- gsub("^ph.*", "philips", refine$company)
refine$company<- gsub("^fil.*", "philips", refine$company)
refine$company<- gsub("^ak.*", "akzo", refine$company)
refine$company<- gsub("^uni.*", "unilever", refine$company)  

## Separate Product Code and Number
refine_clean<- separate(refine, Product.code...number,c("product_code", "product_number"),sep = "-")

## Add Product Categories
refine_clean<- refine_clean %>%
 mutate(
    product_category = case_when(
    product_code == "p" ~ "Smartphone",
    product_code == "v" ~ "TV",
    product_code == "x" ~ "Laptop",
    product_code == "q" ~ "Tablet")
         )

## Add Full Address for Geocoding
refine_clean<- unite(refine_clean, full_address, c("address","city","country"), sep = ",")

## Create Dummy Variables for Company and Product Category
refine_clean<- refine_clean %>%
  mutate(
    company_philips = ifelse(company == "philips", 1,0)
  )

refine_clean<- refine_clean %>%
  mutate(
    company_akzo = ifelse(company == "akzo", 1,0)
  )

refine_clean<- refine_clean %>%
   mutate(
     company_van_houten = ifelse(company == "van_houten", 1,0)
   )

refine_clean<- refine_clean %>%
   mutate(
     company_unilever = ifelse(company == "unilever", 1,0)
   )

refine_clean<-  refine_clean %>%
   mutate(
     product_smartphone = ifelse(product_code == "p", 1,0)
   )

refine_clean<- refine_clean %>%
   mutate(
     product_tv = ifelse(product_code == "v", 1,0)
   )

refine_clean<- refine_clean %>%
   mutate(
     product_laptop = ifelse(product_code == "x", 1,0)
   )

refine_clean<- refine_clean %>%
   mutate(
     product_tablet = ifelse(product_code == "q", 1,0)
   )

## Export CSV File 
write.csv(refine_clean, file = "refine_clean.csv", row.names = FALSE)
