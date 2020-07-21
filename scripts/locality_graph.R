library(ggplot2)
library(dplyr)
library(lubridate)

#change data and select locality
data <- read_csv("cases3.csv")
location_str <- "Galax"

#Filter and structure data
data <- filter(data, data$Locality == location_str)
data$`Report Date` <- mdy(data$`Report Date`)


#Generate Chart
newdata <- data
p <- ggplot(newdata, aes(x=newdata$`Report Date`, y=newdata$`Total Cases`, color="orange")) +
  geom_line(lwd=1.5, fill="#CC6666") + 
  ggtitle(paste(location_str, "Coronavirus Cases"))+
  xlab("Time")+
  ylab("Total Cases")+
  theme(axis.text.x = element_text(color = "grey20", size = 12, angle = 90, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "grey20", size = 12, angle = 0, hjust = 1, vjust = 0, face = "plain"),  
        axis.title.x = element_text(color = "grey20", size = 15, angle = 0, hjust = .5, vjust = 0, face = "plain"),
        plot.title = element_text(color = "grey20", size = 20, angle = 0, hjust = .5, vjust = 0, face = "plain"),
        legend.position = "none",
        axis.title.y = element_text(color = "grey20", size = 15, angle = 90, hjust = .5, vjust = .5, face = "plain"))

#Display Chart
p


