#clean forecast data
library(tidyr)
library(dplyr)

fc_data<-read.csv("forecastData.csv",sep=",",header=TRUE)
fc_data

###remove(fc_df)
fc_df<- data.frame(fc_data)
fc_df
dplyr::tbl_df(fc_df)
###utils::View(fc_df)

na.strings=c(""," ","NA")# to rplace blank with NA
fc_df<-fc_df %>% ungroup() %>%select(c(-X,-TimeEDT,-Gust_SpeedMPH,-PrecipitationIn,-Events,-DateUTC))#remove first column witl Sl. No.
fc_df<-tidyr::separate(fc_df, Time, c("year","month","day","hour"))#seperate date and time

fc_df$Date <- as.Date(with(fc_df, paste(year, month, day,sep="/")), "%Y/%m/%d")#add Date column

DayofWeek<-as.POSIXlt(fc_df$Date)$wday
fc_df<-dplyr::mutate(fc_df,DayofWeek)#get week day from dates
#check for weekday
fc_df$Weekday<-ifelse(fc_df$DayofWeek == 1|fc_df$DayofWeek == 2|fc_df$DayofWeek == 3|fc_df$DayofWeek == 4|fc_df$DayofWeek == 5, "1", "0")
#peek hour column
fc_df <- fc_df %>% mutate(hour = as.numeric(hour))
fc_dff<-fc_df
###remove(fc_dff)
fc_dff$Peakhour<-ifelse(fc_dff$hour > 6 & fc_dff$hour < 20, "1", "0")
###utils::View(fc_dff)
write.csv(fc_dff, file = "forecast_data.csv")