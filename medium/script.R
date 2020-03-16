#Add your dataframes here
dataframes_found_in_system=c("DATA.1","DATA.2","DATA.3","DATA.4")
#loading the required packages

library(seqinr)
library(ggplot2)

#reading fsa file using read.abif() and taking data portion only

data<-read.abif("A01-Ladder-PP16-001.20sec.fsa")$Data

#Data plotting


dataframes=NULL
i=length(dataframes_found_in_system)

#while there is dataframe take it and bind it with previous dataframes
while(i!=0)
{
time<-c(1:length(data[[dataframes_found_in_system[i]]]))
data_number<-rep(dataframes_found_in_system[i],length(data[[dataframes_found_in_system[i]]]))
value<-data[[dataframes_found_in_system[i]]]
temp<-data.frame(time,data_number,value)
dataframes=rbind(dataframes,temp)
i=i-1
}



#plotting multi-panel ggplot with facet_grid
ggplot(data = dataframes,group=data_number,aes(color=data_number)) +
  geom_line(data = dataframes,aes(x=time,y=value))+facet_grid(data_number~.,scales = "free")+
  scale_x_continuous(name = "Time/1000")+scale_y_continuous(name = "RFU/1000")
