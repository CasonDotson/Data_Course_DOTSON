library(tidyverse)

read.csv("DNA_Conc_by_Extraction_Date.csv")

?read.csv
df = read.delim("DNA_Conc_by_Extraction_Date.csv")

?hist

hist(df$DNA_Concentration_Katy, main = "Katy", xlab = "DNA Concentration", col = "RED")
hist(df$DNA_Concentration_Ben, main = "Ben", xlab = "DNA Concentration", col = "BLUE")

df$Year_Collected = factor(df$Year_Collected)

?plot

plot(x = df$Year_Collected, y = df$DNA_Concentration_Katy, main = "Katy's Extractions", 
     xlab ="YEAR", ylab = "DNA Concentration" )

as.factor


