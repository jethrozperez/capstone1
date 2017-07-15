---
title: "Capstone Project"
author: "Jethro Perez"
date: "7/15/2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Marketing Mix Model

The foundation of any sustainable consumer packaged goods company lies on the ability to generate revenue that exceeds costs. In order to accomplish profitability the ratio of customer lifetime value over (CLV) cost per acquisition (CPA) must exceed 1. Any value below 1 indicates that the business is running at an operating loss.

The definition of customer lifetime value differentiates from business to business but at the end of the day you form a persona(s) on customers based on your business model. Once your model to predict customer lifetime value your goal is to maximize the aforementioned CLV/CPA ratio. In order to maximize this ratio companies can generate more revenue from their existing client base or minimize the cost per acquisition of new customers. The latter of these two approaches is the basis for my capstone project.  

Minimizing cost per acquisition has proven to be a challenge for markers. This is due to a number factors including but not limited to. 
 
* Fixed CPA targets in place to keep the CLV/CPA ratio at or above 1.
* A deluge of data from various media partners all with their own reporting mechanisms and philosophies.
* The pressure to continue customer growth that exceeds churn.
* Budgets with future customer goals set in stone to meet future revenue forecasts


Solving for these and many others problems requires companies to devise as media plan that will maximize customer growth and minimize costs. Doing so requires devising a [marketing mix model](https://en.wikipedia.org/wiki/Marketing_mix_modeling) (MMM)
  
## Scope

The objective of this project is to take data from an ecommerce platform to devise a marketing strategy that minimizes the average cost per acquisition. The client has given me access to their marketing data for the various vendors as well as customer counts for their numerous product lines. 

Each product line has CPA target which cannot be exceeded. I am therefore tasked with creating a model that will give the company the proper mix in spend per channel as well as forecast future sales under various budget scenarios for each product line. Lastly the client will want to know by channel at what level of marketing spend will they maximize customer growth regardless of CPA. 

Using this model the client will adjust their acquisition strategy as well as focus efforts to invest more in partners that maximize customer acquisition as well as understand why other channels aren't as successful.

## Execution

The excecution of this project will be summarized below by the order in which it will be performed

### Data Collection

I will procure data from a variety of acquisition partners all of which come with a variety of dimensions including but not limited to 

* Amount spent in a given period of time
* Vendor reported conversions/sales
* Clicks to ads that let to website sessions 
* Vendor specific dimensions (e.g. ad performance, targeting parameters, geographic related information)

Data across vendors is **not uniform** meaning that advertisers give data at their discretion. The only two common elements among the entire data set are partner spend and conversions. The latter of the two has different methodologies of measurement due mainly to the differences in offline and online channels. 
 
I will also have customer counts by product line and clickstream from the client. 

### Data Preparation

I will wrangle the data from the various sources in order to clean and normalize. I will store this data and my code in a Github repository.

### Exploratory Data Analysis 

Using a number of R packages that I will load with the following code

```{r}
library("ggplot2")
library("grofit")
library("knitr")
```

I will compare vendor reporting to actual customer counts over time in order to track any discrepancies with the two as well as seasonal impacts between the two. 

* Are there any sings that some vendors over report sales?
* Are there signs of seasonality? Do they differ across product 
lines?
* Is there any covariance between certain vendors?
* Do certain vendors drive inefficient traffic that lead to inefficient CPAs?


### Data Modeling

My initial hypothesis is to use a Multiple Linear Regression which is expressed below.

$$ Y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ...+ \beta_nx_n $$

In this regression my exploratory variables are partner spend and my response variable is sales. 

I will gather this information and run a linear model in R using a subset of training data from our population.  The output of the standard error, p-value and R squared values will determine which response variables will be included in the algorithm and which ones should be excluded. 

### Algorithum Assesment

I will then run this algorithm through cross validation to ensure that the model can accurately predict sales using non-training sets.  

If the model is sufficient given the assumptions behind it then move forward. If not then assess any learning’s and choose a different model (e.g. polynomial, stepwise, spile, etc..)

### Communicate Results

Once the model is built I will review my results and ask

1. Does this differ from the current mix?
2. If so how do I communicate this as with a high degree of confidence?
3. Are certain partners not worth any investment?
4. When does my model breakdown? 

Once these questions have been answered I will prepare a deck with an overview of my findings layered on with the assumptions in place and how this model can change the landscape of the business.  It is key that these results are kept at a high level so as not to intimidate or upset members who may not understand the power of statistical modeling.
