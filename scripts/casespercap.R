library(ggplot2)
library(dplyr)
library(lubridate)

#Change date
date <- "2020-07-20"
cases_data <- read_csv("cases.csv")
income_data <- read_csv("population.csv")
cases_data$`Report Date` <- mdy(cases_data$`Report Date`)

#Sort, Filter and Organize Data
cases_data <- filter(cases_data, cases_data$`Report Date` == date)
total <- merge(cases_data,income_data,by="Locality")
total$percap <- total$`Total Cases` / total$Population
final <- total[order(-total$percap),]
top5 <- head(final, 5)

#Generate plot
barplot(top5$percap, main="Virginia COVID Hotspots", horiz=TRUE,
        names.arg=c(top5$Locality), xlab="Cases per Capita (higher is worse)")
