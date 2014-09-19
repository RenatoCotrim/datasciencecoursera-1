library(stringr)

traindata<-read.table("train/X_train.txt")
testdata<-read.table("test/X_test.txt")
rawdata<-rbind(traindata,testdata)
lables<-read.table("features.txt")
lables<-as.data.frame(lables)
needlables<-lables[str_detect(lables$V2,"std") | str_detect(lables$V2,"mean"), ]
extractdata<-rawdata[,needlables$V1]
names(extractdata) <- needlables$V2
checkData<-sapply(extractdata,mean)
write.table(checkData,file="output.txt",row.names=FALSE)
print(checkData)
