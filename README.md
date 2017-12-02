# Project: FX_Pass_Through

## Background and Theory

I will try to examine to see [the myth of EM FX pass-through](http://www.ashmoregroup.com/sites/default/files/article-docs/EV%20Mar%202017.pdf). Below you can see the definition of *FX pass through* from Ashmore's Article:

*One of the common perceptions about emerging markets (EMs) is that inflation rises sharply when currencies weaken, because weaker currencies push up domestic prices of imported goods and services. This phenomenon has a name: FX pass-through.*

The phenamenon is generally formulated with the following [regression formula](https://en.wikipedia.org/wiki/Exchange-rate_pass-through#cite_note-Campa_goldberg-2): 

$$ \Delta \ln p_{t} = \alpha + \sum_{i=0}^{N} \gamma_{i}\Delta e_{t-1} + \delta\Delta \ln c_{t} + \psi \Delta \ln d_{t} + \epsilon_{t} $$

where

- p is import price, 
- e is the exchange rate 
- c is marginal costs 
- d is demand
- $\Delta$ denotes the difference.

If you want an academic level analysis of the phenomenon. [Here](http://www.bankofcanada.ca/wp-content/uploads/2015/10/dp2015-91.pdf), you can find an interesting paper from Bank of Canada examines exchange rate pass-through due to the depreciation of Canadian Dollar against US Dollar in previous years.

## Data

I am planning to use monthly data from 2005 to 2017 on Turkish Lira against US Dollar (USDTRY) and Consumer Price Index. 

Quandl enables us to reach these public data in CSV format.

- The Foreign Exchange Rate (USDTRY) data is from [Bank of England](https://www.quandl.com/api/v3/datasets/BOE/XUMLBK75.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly) available on Quandle.

- The CPI inflation data is from [Central Bank of Turkish Republic](https://www.quandl.com/api/v3/datasets/CBRT/TP_FG_TG01.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly) available on Quandle.


After I get the data for both Foreign Exchange Rate and Consumer Price Index, I bind them into one dataset to be able to play with it.

My ultimate aim is to make to have an analysis structure works with any data in the specified structure.

## Objectives

- Does FX rate depreciation have an effect on consumer prices?
- If there is an effect, what is the mean FxPassThrough value for the depreciation periods?

## Hypothesis

I believe FX rate depreciation has a positive effect on consumer prices for the depreciation periods. I will try to see what is the level for Turkey in the period between 2005 and 2017 when Turkish Lira depreciated against US Dollars. 


##  Steps for the Project:

I am trying to see the major steps for the analysis:

1. Save the FxRate and CPI data from web source
2. Join these datasets into single dataset
3. Make sure to have `date` is the increasing order in the dataset.
4. Create new variables for CPI and FxRate changes.
5. Create FxPassThrough variable.
6. Plot the FxPassThrough trend over the period of time. 
7. Filter the FxPassThrough variable to prevent failure due to infinity 
8. Take only depreciating periods.
9. See what is the mean value for the depreciation periods for *FxPassThrough*.

### Expected Outputs from Project

1. The plot of *FxPassThrough* trend over the time.
2. Average *FxPass Through* value for the depreciation periods.

## Analysis

If I will assume the model as simple as, 

$\ln(cpi_{t}) = \beta_0 + \beta_{1}* \ln (FXrate_{t-1})+\epsilon$ 

where $\beta_1$ is the *FxPassThrough* that I am looking for.

I will simplify the phenamenon and try to examine with the following basic formula:

$$FxPassThrough_{t} = \frac{cpi_{t}}{cpi_{t-1}} * \frac{FXrate_{t-2}}{FXrate_{t-1}} $$

where $fxChange = \frac{FXrate_{t}}{FXrate_{t-1}} - 1 > 0$ to have only the Turkish Lira is depreciated.

For the future expansion of the analysis,

1. I can test the statistical significance of the **FxPassThrough** value my model.
2. Then, I would perform analysis on a more complicated model.  




## Author

This repository is created by Cem Sinan Ozturk on 2017-11-23.