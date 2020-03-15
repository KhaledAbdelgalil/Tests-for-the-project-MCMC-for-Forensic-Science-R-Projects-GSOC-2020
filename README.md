# Tests-for-the-project-MCMC-for-Forensic-Science-R-Projects-GSOC-2020

## 1. Easy Test

### Problem Statement

Download data from [https://lftdi.camden.rutgers.edu/provedit/files/](https://lftdi.camden.rutgers.edu/provedit/files/) then use `seqinr::read.abif` to read and `seqinr::plotabif` to plot an fsa file.

First, I downloaded data from the given link. Then I installed the current version of `seqinr` package, which is used for biological sequences retrieval and analysis. In the following code, I used `seqinr::read.abif()` to read the fsa file(data) and then I plot the data extracted using `seqinr::plotabif()`.

### Code
```
#loading the required packages

library(seqinr)

#reading fsa file using read.abif()

data<-read.abif("A01-Ladder-PP16-001.5sec.fsa")

#Data plotting

plotabif(data)
```
### Plot
![](images/easy.png)

## 2. Medium Test

### Problem Statement

To make a similar multi-panel ggplot with `facet_grid`.

### Code

dataframes_found_in_system=c("DATA.1","DATA.2","DATA.3","DATA.4")
#loading the required packages

library(seqinr)
library(ggplot2)

#reading fsa file using read.abif() and taking data portion only

data<-read.abif("A01-Ladder-PP16-001.20sec.fsa")$Data

#Data plotting

```
dataframes=NULL
i=length(dataframes_found_in_system)

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
  ```
### Plot

![](images/medium.png)

