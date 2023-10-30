dir2<-setwd("~/IFOP/CBA/REINETA/Brama_2022/s2")
getwd()
#system('./ss_osx') 

mydir2 <- dir2

SS_doRetro(
  masterdir = mydir2,
  oldsubdir = "",
  newsubdir = "retrospectives",
  years = 0:-5
)


retroModels <- SSgetoutput(
  dirvec = file.path(mydir2, "retrospectives", paste("retro", 0:-5, sep = ""))
)
retroSummary <- SSsummarize(retroModels)
endyrvec <- retroSummary[["endyrs"]] + 0:-5

dc2='~/IFOP/CBA/REINETA/Brama_2022/s2/retrospectives'
SSplotComparisons(retroSummary,
                  endyrvec = endyrvec,
                  subplots = 1:4,
                  legendlabels = paste("Data", 0:-5, "years"),
                  print = TRUE,
                  png = TRUE,
                  plot=TRUE,
                  models = "all",
                  plotdir = dc2
)


dir3<-setwd("~/IFOP/CBA/REINETA/Brama_2022/s3")
getwd()
system('./ss_osx') 

mydir3 <- dir3
getwd()
SS_doRetro(
  masterdir = mydir3,
  oldsubdir = "",
  newsubdir = "retrospectives",
  years = 0:-5
)


dir4<-setwd("~/IFOP/CBA/REINETA/Brama_2022/s4")
getwd()
system('./ss_osx') 

mydir4 <- dir4

SS_doRetro(
  masterdir = dir4,
  oldsubdir = "",
  newsubdir = "retrospectives",
  years = 0:-5
)



dir5<-setwd("~/IFOP/CBA/REINETA/Brama_2022/s5")
getwd()
system('./ss_osx') 
dir()
mydir5 <- dir5

SS_doRetro(
  masterdir = dir5,
  oldsubdir = "",
  newsubdir = "retrospectives",
  years = 0:-5
)
