library(tidyverse)

df = read.csv("DNA_Conc_by_Extraction_Date.csv")  



#Part 1


hist(df$DNA_Concentration_Katy, main = "Katy's Ectractions", xlab = "DNA Concentration", col = "RED")

hist(df$DNA_Concentration_Ben, main = "Ben's Extractions", xlab = "DNA Concentration", col = "BLUE")

#Part II

class(df$Year_Collected)

df$Year_Collected = as.factor(df$Year_Collected)


plot(df$Year_Collected, df$DNA_Concentration_Katy, main= "Katy's Extractions", xlab = "YEAR", ylab = "DNA Concentration")

plot(df$Year_Collected, df$DNA_Concentration_Ben, main= "Ben's Extractions", xlab = "YEAR", ylab = "DNA Concentration")

#Only problem I see is that the plot dimensions are narrower on yours which changes the way the x axis values are displayed
#I will try and fix this if I have time.
#This seems to have fixed itself after exporting using the jpeg function, so I am not going to worry about it.


#Part III

?jpeg()

jpeg("DOTSON_Plot1.jpeg")

plot(df$Year_Collected, df$DNA_Concentration_Katy, main= "Katy's Extractions", xlab = "YEAR", ylab = "DNA Concentration")

dev.off()

jpeg("DOTSON_Plot2.jpeg")

plot(df$Year_Collected, df$DNA_Concentration_Ben, main= "Ben's Extractions", xlab = "YEAR", ylab = "DNA Concentration")

dev.off()


#Part IV

group_by(df, df$Year_Collected)



