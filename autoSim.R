# autoSim.R
rep = 50
seed = 280
distr = c("gaussian", "t1", "t5")


nVals = seq(100, 500, by=100)
for (n in nVals) {
  for (dist in distr){
 
  oFile = paste(dist, "n", n, ".txt", sep="")
  
  #modify arg
  arg = paste("n=", n, sep="", "seed=", seed, sep="", )
  arg = paste("n=", n, sep="")
  
  #no change
  sysCall = paste("nohup Rscript runSim.R ", arg, " > ", oFile)
  
  #no change
  system(sysCall)
  
  #no change
  print(paste("sysCall=", sysCall, sep=""))
  }
}


