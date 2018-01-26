# autoSim.R
rep = 50
seed = 280
distr = c("gaussian", "t1", "t5")
nVals = seq(100, 500, by=100)


for (n in nVals) {
  for (dist in distr){
 
  oFile = paste(dist,"n", n, ".txt", sep=",")
  
  #modify arg
  arg = paste(paste("n=", n, sep=""), paste("seed=", seed, sep=""), 
              paste("distr=",distr, sep=""), paste("rep=", rep, sep=""))

  sysCall = paste("nohup Rscript runSim.R ", arg, " > ", oFile)
  
  system(sysCall)
  
  print(paste("sysCall=", sysCall, sep=""))
  }
}


