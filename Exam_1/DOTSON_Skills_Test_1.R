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



group_by(df, df$Year_Collected) %>% summarise(df$DNA_Concentration_Ben)


?sum
?summarise

#I suspect I need to use pipes to group and examine the data by year but I am struggling with this one so I will come back if I have time.
#I did not have time :(

#Part V

?subset


df1 = subset(df, df$Lab == "Downstairs")

df1$Date_Collected = as.POSIXct(df1$Date_Collected)


plot(df1$Date_Collected, df1$DNA_Concentration_Ben, xlab = "Date_Collected", ylab = "DNA_Concentration_Ben")


jpeg("Ben_DNA_over_time.jpg")

plot(df1$Date_Collected, df1$DNA_Concentration_Ben, xlab = "Date_Collected", ylab = "DNA_Concentration_Ben")

dev.off()


#Part VI

df2 = subset(df, select = c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

group_by(df2, df2$Year_Collected) 

df2000 = subset(df, Year_Collected == 2000,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2001 = subset(df, Year_Collected == 2001,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2002 = subset(df, Year_Collected == 2002,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2003 = subset(df, Year_Collected == 2003,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2004 = subset(df, Year_Collected == 2004,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2005 = subset(df, Year_Collected == 2005,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2006 = subset(df, Year_Collected == 2006,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2007 = subset(df, Year_Collected == 2007,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2008 = subset(df, Year_Collected == 2008,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2009 = subset(df, Year_Collected == 2009,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2010 = subset(df, Year_Collected == 2010,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2011 = subset(df, Year_Collected == 2011,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

df2012 = subset(df, Year_Collected == 2012,select =  c(Year_Collected, Extract.Code, Date_Collected, DNA_Concentration_Ben, Lab))

?mean

mean(df2000$DNA_Concentration_Ben)

Extraction_Year = c("2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2010", "2011", "2012")

Average_Value = c(mean(df2000$DNA_Concentration_Ben), mean(df2001$DNA_Concentration_Ben),
                  mean(df2002$DNA_Concentration_Ben), mean(df2003$DNA_Concentration_Ben),
                    mean(df2004$DNA_Concentration_Ben), mean(df2005$DNA_Concentration_Ben), 
                  mean(df2006$DNA_Concentration_Ben), mean(df2007$DNA_Concentration_Ben),
                  mean(df2008$DNA_Concentration_Ben),
                  mean(df2010$DNA_Concentration_Ben), mean(df2011$DNA_Concentration_Ben),
                  mean(df2012$DNA_Concentration_Ben)) 

data.frame(Year = Extraction_Year, Average = Average_Value) 

df3 = data.frame(Year = Extraction_Year, Average = Average_Value) 

#I am sure there is an easier way to do this, but this does seem to be working!

max(df3$Average)

#max shows the highest value but not which row (year) it is.

summary(df3)

# However, the summary function includes the year with the highest average (2005) in the output!


write.csv(df3, file = "Ben_Average_Conc.csv",row.names=FALSE)
