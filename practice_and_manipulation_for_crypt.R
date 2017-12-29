data = read.csv("currency.csv",header=T)
str(data)
data$X = NULL
data$Date = as.character(data$Date)
data$Date = as.Date(data$Date , format = "%Y-%m-%d")
data$year = format(data$Date,format="%Y")
data$year = as.numeric(data$year)

library(dplyr)
data2 = data %>% group_by(Type,year) %>% summarise(volume = sum(Volume)) %>% arrange(-volume)
data_b = filter(data2, volume == max(volume))
str(data_b)
req_type = c("Bitcoin","LiteCoin","Ethereum","Ripple","Dash")
req_data = filter(data,data$Type %in% req_type )

bitcoin = filter(data,Type=="Bitcoin")
library(ggplot2)
ggplot(req_data,aes(x=Date,y = Volume, colour = Type))  + geom_smooth()  + theme_bw()

