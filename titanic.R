## Project: Data Wrangling Exercise 2: Dealing with missing values

## Load Libraries
library(dplyr)
library(tidyr)
library(stringr)

## Read in file and Inspect Table
titanic<- read.csv("titanic_original.csv", stringsAsFactors = FALSE)
str(titanic)
head(titanic)

## Port of embarkation - Find mising values and replace with S
titanic$embarked<- gsub("^$", "S", titanic$embarked)
titanic %>% group_by(embarked) %>% summarize(total = n())

## Age - Find Mean of Age and Replace with missing values
titanic %>% filter(age != is.na(age)) %>% summarize(average_age = mean(age))
average_age = 29.88113
titanic$age[is.na(titanic$age)] <- 29.88113

## Lifeboat - replace missing values with NA
titanic$boat[titanic$boat == ""] <- "NA"
titanic %>% group_by(pclass) %>% summarize(count = n(), avg_age = mean(age))

## Cabin - create dummy variable if cabin is missing
titanic <- titanic %>% 
mutate(has_cabin_number = if_else(cabin == "",0,1)) 

## Print cleaned Titanic File
write.csv(titanic, file = "titanic_clean.csv")
