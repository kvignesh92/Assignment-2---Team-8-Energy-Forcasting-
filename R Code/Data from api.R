install.packages("dplyr")
install.packages("tidyr")
install.packages("jsonlite")
library(jsonlite)
library(curl)
library(dplyr)
library(tidyr)
install.packages("stringr")
library("stringr")

date <-  as.Date('20140101',format = "%Y%m%d")
date2 <-  as.Date('20141231',format = "%Y%m%d")
# create a sequence of every day in this year
s <- seq(date,to = date2, by='days') 

datereplace<-str_replace_all(s,"-","")

data<-paste0("http://api.wunderground.com/api/592294402e180a18/history_",datereplace[1],"/q/MA/Boston.json")
weather1<- fromJSON(data)
result<- data.frame(weather1$history$observations$date$pretty,weather1$history$observations$date$year,weather1$history$observations$date$mon,weather1$history$observations$date$mday,weather1$history$observations$date$hour,weather1$history$observations$date$min,weather1$history$observations$tempi, weather1$history$observations$dewpti,weather1$history$observations$hum,
                    weather1$history$observations$pressurei,weather1$history$observations$visi,weather1$history$observations$wspdi,
                    weather1$history$observations$wdire,weather1$history$observations$conds,weather1$history$observations$wdird)
#Result<-data.frame(lapply(Result,as.character))

for (i in 2:365)
{
  data<-paste0("http://api.wunderground.com/api/592294402e180a18/history_",datereplace[i],"/q/MA/Boston.json")
  weather1<- fromJSON(data)
  result1<- data.frame(weather1$history$observations$date$pretty,weather1$history$observations$date$year,weather1$history$observations$date$mon,weather1$history$observations$date$mday,weather1$history$observations$date$hour,weather1$history$observations$date$min,weather1$history$observations$tempi, weather1$history$observations$dewpti,weather1$history$observations$hum,
                       weather1$history$observations$pressurei,weather1$history$observations$visi,weather1$history$observations$wspdi,
                       weather1$history$observations$wdire,weather1$history$observations$conds,weather1$history$observations$wdird)
  #Result1<-data.frame(lapply(Result1,as.character))
  dplyr::tbl_df(result)
  dplyr::tbl_df(result1)
  result<-dplyr::bind_rows(result, result1)
  #print(fromJSON(file=data))
  # append(weather1,fromJSON(file=data))
  
}

result_1<-subset(result,weather1.history.observations.date.min == "54")
utils::View(result_1)

#To Remove extra columns
result_1<-result_1 %>%  ungroup() %>%select(-weather1.history.observations.date.pretty,-weather1.history.observations.date.min)

colnames(result_1)[1:13] = c("year","month","day","hour","Temperature","Dew_PointF","Humidity","Sea_Level_PressureIn","VisibilityMPH","Wind_SpeedMPH","Wind_Direction","Conditions","WindDirDegrees") 
utils::View(result_1)
#Final_df<-dplyr::semi_join(Result, Raw_df,by="year","day","month","hour")#Rows that appear in either or both Result and Raw_df.
Raw_df1<- Raw_df %>% mutate(day = as.numeric(day),month = as.numeric(month),hour = as.numeric(hour))
result<- result_1 %>% mutate(day = as.numeric(day),month = as.numeric(month),hour = as.numeric(hour))


#mergedData <- merge(result, Raw_df1,all=TRUE)
mergedDatadelete <- merge(result, Raw_df1,all=FALSE)
utils::View(Raw_df)
utils::View(result)
#utils::View(mergedData)
utils::View(mergedDatadelete)
##############trial

write.csv(mergedDatadelete, file = "Reg_data.csv")
