library(tidyverse)
library(MASS)
library(modelr)

df = read.csv("atmosphere.csv")

mod1 = lm(Diversity ~ Aerosol_Density, data=df)

summary(mod1)

mod2 = lm(Diversity ~ Aerosol_Density*Precip, data=df)

summary(mod2)

df = add_residuals(df, mod1)
df = add_residuals(df, mod2, var = "resid2")

mean(df[,"resid"]^2)
mean(df[,"resid2"]^2)

#mod1 has better explanatory power

df2 = add_predictions(df , mod1)
df2 = add_predictions(df2, mod2, var = "pred2" )

ggplot(df2, (aes(x=Aerosol_Density))) + geom_point(aes(y=Diversity)) + geom_point(aes(y=pred), color="Red") + geom_point(aes(y=pred2), color="Blue")

df3 = read.csv("hyp_data.csv")


df4 = add_predictions(df3 , mod1)
df4 = add_predictions(df4, mod2, var = "pred2" )



df4[,"pred"]
df4[,"pred2"]


ExpSum = c(summary(mod1), summary(mod2))

capture.output(ExpSum, file = "model_summaries.txt")

           
            