library(tidyverse)
library(MASS)
library(modelr)

dat = read.csv("salaries.csv")

salaries.long = gather(dat, key = "Position", value = "Salary", c(5:7))

#Used gather to clean data so that Salary can be used as a dependent variable, but I'm bad at this part so I came back at the end and rand out of time :(

df = read.csv("atmosphere.csv")

mod1 = lm(Diversity ~ Aerosol_Density, data=df)


summary(mod1)

#Created first model

mod2 = lm(Diversity ~ Aerosol_Density*Precip, data=df)

summary(mod2)

#Created second model

df = add_residuals(df, mod1)
df = add_residuals(df, mod2, var = "resid2")

mean(df[,"resid"]^2)
mean(df[,"resid2"]^2)

#Compares squared residuals and detremined that mod1 has better explanatory power

df2 = add_predictions(df , mod1)
df2 = add_predictions(df2, mod2, var = "pred2" )

#Created df2 adding prediction for each model

ggplot(df2, (aes(x=Aerosol_Density))) + geom_point(aes(y=Diversity)) + geom_point(aes(y=pred), color="Red") + geom_point(aes(y=pred2), color="Blue")

#created plot with acutal diversity plotted in black, model 1 predictions plotted in red, and model 2 prediction plotted in blue 

df3 = read.csv("hyp_data.csv")


df4 = add_predictions(df3 , mod1)
df4 = add_predictions(df4, mod2, var = "pred2" )

#created df4 which has model 1 and model 2 predictions for the hypothetical data


df4[,"pred"]
df4[,"pred2"]

#displayed predictions for hypothetical data

ExpSum = c(summary(mod1), summary(mod2))

#created an output that contains summaries of both models

capture.output(ExpSum, file = "model_summaries.txt")

#created txt file with the output of both models
           
            