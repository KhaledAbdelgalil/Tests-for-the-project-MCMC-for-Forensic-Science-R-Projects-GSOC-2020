#loading the required packages

library(seqinr)

#reading fsa file using read.abif()

data<-read.abif("A01-Ladder-PP16-001.5sec.fsa")

#Data plotting

plotabif(data)
