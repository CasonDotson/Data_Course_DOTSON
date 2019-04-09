# Skills Test 3

# Below are two data sets. Using these data, re-create the two plots in the exam_3 directory.
# Use ggplot
# export (using code) these two plots into your exam_3 directory. 
# They should be saved as .png files at 300 dpi with a width of 5 inches and height of 5 inches
# Naming convention should be LASTNAME_plot1.png and LASTNAME_plot2.png
# Push your R script and the two image files to GitHub.

# Load packages
library(tidyverse)
library(gapminder)

# creating a color palette for plot 1
pal = c("#6b5456","#ec8d1b","#6abf2a","#8b53b7","#70acbe","#01c95b","#c00014","#31332f","#f7d000","#abba00")

# generate data for plot 1
plot1.data = gapminder


# Make and export plot 1
                                # your code for plot1 goes here #

?ggplot()


P1 = ggplot(plot1.data, aes(x = year, y = lifeExp, color = continent)) +  
  labs(title = "Life Expectancy Over Time", subtitle = "Colored by Continent", x = "Year", y = "Life Expectancy" ) +
    geom_point(size = 2.5, alpha = 0.15) + geom_smooth(method = "lm", fill = NA) +
  scale_color_manual(breaks = c("Africa", "Americas", "Asia", "Europe", "Oceania"),
                     values=c("tan4", "orange", "green", "purple", "turquoise")) + theme_minimal()
 
png("DOTSON_plot1.png")
P1
print(P1)
dev.off()

?png

# Generate data for plot 2 (run the following 5 lines only once to ensure we are all using identical data)
set.seed(123)
a <- data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 10, 1.2) )
b <- data.frame( x=rnorm(20000, 14.5, 1.9), y=rnorm(20000, 14.5, 1.9) )
c <- data.frame( x=rnorm(20000, 9.5, 1.9), y=rnorm(20000, 15.5, 1.9) )
plot2.data <- rbind(a,b,c)

# make and export plot2
                                # your code for plot2 goes here #

theme_bare <- theme(
  axis.line = element_blank(), 
  axis.text.x = element_blank(), 
  axis.text.y = element_blank(),
  axis.ticks = element_blank(), 
  axis.title.x = element_blank(), 
  axis.title.y = element_blank(), 
  #axis.ticks.length = unit(0, "lines"), # Error 
  axis.ticks.margin = unit(c(0,0,0,0), "lines"), 
  legend.position = "none", 
  panel.background = element_rect(fill = "gray"), 
  panel.border = element_blank(), 
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(), 
  panel.margin = unit(c(0,0,0,0), "lines"), 
  plot.background = element_rect(fill = "blue"),
  plot.margin = unit(c(0,0,0,0), "lines"))

P2 = ggplot(plot2.data, aes(x=x, y=y)) + geom_point() + theme(axis.line = element_blank(), 
                                                              axis.text.x = element_blank(), 
                                                              axis.text.y = element_blank(),
                                                              axis.ticks = element_blank(), 
                                                              axis.title.x = element_blank(), 
                                                              axis.title.y = element_blank(), 
                                                              panel.background = element_rect(fill = "white"))

P2 = ggplot(plot2.data, aes(x=x, y=y))+ geom_point(size = 8, alpha = 0.1, color = "steelblue")  + theme(axis.line = element_blank(), 
                                                              axis.text.x = element_blank(), 
                                                              axis.text.y = element_blank(),
                                                              axis.ticks = element_blank(), 
                                                              axis.title.x = element_blank(), 
                                                              axis.title.y = element_blank(), 
                                                              panel.background = element_rect(fill = "white"))
?theme

P2

png("DOTSON_plot2.png")
P2
print(P2)
dev.off()
