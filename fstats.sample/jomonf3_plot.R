#fstatsa_ch1_f3####

filename <- "Results/fstatsa_ch1_f3.txt"
outputname <- "Results/fstatsa_ch1_f3.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                 as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "Chromosome 1 / all sites",
       #subtitle = "サブタイトル",
       x = "F3(FIN, X; YRI)",y = "",
       #caption = "キャプション",
       color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_ch1_f3####

filename <- "Results/fstatsa2_ch1_f3.txt"
outputname <- "Results/fstatsa2_ch1_f3.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "Chromosome 1 / all sites",
    #subtitle = "サブタイトル",
    x = "F3(FIN, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_ah####

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_FIN_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa_f3_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(FIN, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa2_ah####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_FIN2_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa2_f3_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(FIN, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa_f3####

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(FIN, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3####

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(FIN, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_f3_jpt####

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_jpt.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="JPT")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="JPT")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="JPT" | resultf3$V2=="JPT"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(JPT, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_jpt####

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_jpt.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="JPT")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="JPT")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="JPT" | resultf3$V2=="JPT"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(JPT, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_f3_gbr####

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_gbr.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="GBR")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="GBR")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="GBR" | resultf3$V2=="GBR"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(GBR, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_gbr####

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_gbr.png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="GBR")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="GBR")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="GBR" | resultf3$V2=="GBR"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(GBR, X; YRI)",y = "",
    #caption = "キャプション",
    color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()
#fstatsa_ah_jpt####

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_JPT_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa_f3_jpt_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(JPT, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa2_ah_jpt####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_JPT2_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa2_f3_jpt_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(JPT, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa_ah_gbr####

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_GBR_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa_f3_gbr_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(GBR, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa2_ah_gbr####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_GBR2_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa2_f3_gbr_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(GBR, X; YRI)",y = "",
      #caption = "キャプション",
      color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa_ah_3pop####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename1 <- sprintf("Results/f3_FIN_%s.txt",ah)
  filename2 <- sprintf("Results/f3_GBR_%s.txt",ah)
  filename3 <- sprintf("Results/f3_JPT_%s.txt",ah)
  filename <- c(filename1,filename2,filename3)
  
  outputname <- sprintf("Results/fstatsa_f3_3pop_%s.png",ah)
  
  resultf3.dat.3pop <- data.frame(sample=NULL,f3=NULL,pop=NULL,dat=NULL)
    
  for(i in 1:3){
    resultf3 <- read.table(filename[i],header=T)
    
    resultf3.dat <- data.frame(sample=resultf3$pop3,f3=resultf3$est)
    
    phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
    
    jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                       pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                             "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
    jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
    resultf3.dat <- merge(resultf3.dat,jork)
    resultf3.dat.3pop <- data.frame(sample=append(as.character(resultf3.dat.3pop$sample),as.character(resultf3.dat$sample)),
                                    f3=append(as.character(resultf3.dat.3pop$f3),as.character(resultf3.dat$f3)),
                                    pop=append(as.character(resultf3.dat.3pop$pop),as.character(resultf3.dat$pop)),
                                    dat=append(as.character(resultf3.dat.3pop$dat),rep(c("FIN","GBR","JPT")[i],nrow(resultf3.dat))))
  }

  
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                                  levels=c("Africa","North-America","South-America",
                                           "Europe","South-Asia","East-Asia",
                                           "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  
  
  resultf3.dat.3pop$pop <- factor(resultf3.dat.3pop$pop,
                                  levels=c("Africa","North-America","South-America",
                                           "Europe","South-Asia","East-Asia",
                                           "Jomon","Kofun"))
  resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$sample,decreasing=F),]
  resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$pop),]
  resultf3.dat.3pop$sample <- factor(resultf3.dat.3pop$sample,
                                levels=resultf3.dat$sample)
  resultf3.dat.3pop$f3 <- as.numeric(as.character(resultf3.dat.3pop$f3))
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat.3pop,aes(x=f3,y=sample,color=pop,shape=dat)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(FIN/GBR/JPT, X; YRI)",y = "",
      #caption = "キャプション",
      color = "",
      shape = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15)) + 
    theme(axis.text.x = element_text(angle = 75)) +
    scale_x_continuous(limits = c(-0.001, 0.03))
    #scale_x_continuous(limits = c(-0.001, 0.001+max(resultf3.dat.3pop$f3)))
  
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa2_ah_3pop####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename1 <- sprintf("Results/f3_FIN2_%s.txt",ah)
  filename2 <- sprintf("Results/f3_GBR2_%s.txt",ah)
  filename3 <- sprintf("Results/f3_JPT2_%s.txt",ah)
  filename <- c(filename1,filename2,filename3)
  
  outputname <- sprintf("Results/fstatsa2_f3_3pop_%s.png",ah)
  
  resultf3.dat.3pop <- data.frame(sample=NULL,f3=NULL,pop=NULL,dat=NULL)
  
  for(i in 1:3){
    resultf3 <- read.table(filename[i],header=T)
    
    resultf3.dat <- data.frame(sample=resultf3$pop3,f3=resultf3$est)
    
    phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
    
    jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                       pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                             "Jomon","Kofun"))
    jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
    resultf3.dat <- merge(resultf3.dat,jork)
    resultf3.dat.3pop <- data.frame(sample=append(as.character(resultf3.dat.3pop$sample),as.character(resultf3.dat$sample)),
                                    f3=append(as.character(resultf3.dat.3pop$f3),as.character(resultf3.dat$f3)),
                                    pop=append(as.character(resultf3.dat.3pop$pop),as.character(resultf3.dat$pop)),
                                    dat=append(as.character(resultf3.dat.3pop$dat),rep(c("FIN","GBR","JPT")[i],nrow(resultf3.dat))))
  }
  
  
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  
  
  resultf3.dat.3pop$pop <- factor(resultf3.dat.3pop$pop,
                                  levels=c("Africa","North-America","South-America",
                                           "Europe","South-Asia","East-Asia",
                                           "Jomon","Kofun"))
  resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$sample,decreasing=F),]
  resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$pop),]
  resultf3.dat.3pop$sample <- factor(resultf3.dat.3pop$sample,
                                     levels=resultf3.dat$sample)
  resultf3.dat.3pop$f3 <- as.numeric(as.character(resultf3.dat.3pop$f3))
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat.3pop,aes(x=f3,y=sample,color=pop,shape=dat)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
      #subtitle = "サブタイトル",
      x = "F3(FIN/GBR/JPT, X; YRI)",y = "",
      #caption = "キャプション",
      color = "",
      shape = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15)) + 
    theme(axis.text.x = element_text(angle = 75)) +
    scale_x_continuous(limits = c(-0.001, 0.03))
    #scale_x_continuous(limits = c(-0.001, 0.001+max(resultf3.dat.3pop$f3)))
  
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}
#fstatsa_f3_3pop####

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_3pop.png"
resultf3 <- read.table(filename)

resultf3.dat.3pop <- data.frame(sample=NULL,f3=NULL,pop=NULL,dat=NULL)

for(i in 1:3){
  resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2==c("FIN","GBR","JPT")[i])),
                                      as.character(subset(resultf3$V2,resultf3$V1==c("FIN","GBR","JPT")[i])[-1])),
                             f3=subset(resultf3$V3,resultf3$V1==c("FIN","GBR","JPT")[i] | resultf3$V2==c("FIN","GBR","JPT")[i]))
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                             pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                   "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                             f3=resultf3.dat$f3/1000)
  
  resultf3.dat.3pop <- data.frame(sample=append(as.character(resultf3.dat.3pop$sample),as.character(resultf3.dat$sample)),
                                  f3=append(as.character(resultf3.dat.3pop$f3),as.character(resultf3.dat$f3)),
                                  pop=append(as.character(resultf3.dat.3pop$pop),as.character(resultf3.dat$pop)),
                                  dat=append(as.character(resultf3.dat.3pop$dat),rep(c("FIN","GBR","JPT")[i],nrow(resultf3.dat))))
}


resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.3pop$pop <- factor(resultf3.dat.3pop$pop,
                                levels=c("Africa","North-America","South-America",
                                         "Europe","South-Asia","East-Asia",
                                         "Jomon","Kofun"))
resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$sample,decreasing=F),]
resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$pop),]
resultf3.dat.3pop$sample <- factor(resultf3.dat.3pop$sample,
                                   levels=resultf3.dat$sample)
resultf3.dat.3pop$f3 <- as.numeric(as.character(resultf3.dat.3pop$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.3pop,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(FIN/GBR/JPT, X; YRI)",y = "",
    #caption = "キャプション",
    color = "",
    shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15)) + 
  theme(axis.text.x = element_text(angle = 75)) +
  scale_x_continuous(limits = c(-0.001, 0.07))
 #scale_x_continuous(limits = c(-0.001, 0.001+max(resultf3.dat.3pop$f3)))

plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa2_f3_3pop####

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_3pop.png"
resultf3 <- read.table(filename)

resultf3.dat.3pop <- data.frame(sample=NULL,f3=NULL,pop=NULL,dat=NULL)

for(i in 1:3){
  resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2==c("FIN","GBR","JPT")[i])),
                                      as.character(subset(resultf3$V2,resultf3$V1==c("FIN","GBR","JPT")[i])[-1])),
                             f3=subset(resultf3$V3,resultf3$V1==c("FIN","GBR","JPT")[i] | resultf3$V2==c("FIN","GBR","JPT")[i]))
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                             pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                   "Jomon","Kofun"),
                             f3=resultf3.dat$f3/1000)
  resultf3.dat.3pop <- data.frame(sample=append(as.character(resultf3.dat.3pop$sample),as.character(resultf3.dat$sample)),
                                  f3=append(as.character(resultf3.dat.3pop$f3),as.character(resultf3.dat$f3)),
                                  pop=append(as.character(resultf3.dat.3pop$pop),as.character(resultf3.dat$pop)),
                                  dat=append(as.character(resultf3.dat.3pop$dat),rep(c("FIN","GBR","JPT")[i],nrow(resultf3.dat))))
}


resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.3pop$pop <- factor(resultf3.dat.3pop$pop,
                                levels=c("Africa","North-America","South-America",
                                         "Europe","South-Asia","East-Asia",
                                         "Jomon","Kofun"))
resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$sample,decreasing=F),]
resultf3.dat.3pop <- resultf3.dat.3pop[order(resultf3.dat.3pop$pop),]
resultf3.dat.3pop$sample <- factor(resultf3.dat.3pop$sample,
                                   levels=resultf3.dat$sample)
resultf3.dat.3pop$f3 <- as.numeric(as.character(resultf3.dat.3pop$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.3pop,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
    #subtitle = "サブタイトル",
    x = "F3(FIN/GBR/JPT, X; YRI)",y = "",
    #caption = "キャプション",
    color = "",
    shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15)) + 
  theme(axis.text.x = element_text(angle = 75)) +
  scale_x_continuous(limits = c(-0.001, 0.07))
#scale_x_continuous(limits = c(-0.001, 0.001+max(resultf3.dat.3pop$f3)))

plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa_f3_jomon(Funadomari)####

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_jomon(Funadomari).png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="Jomon")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="Jomon")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="Jomon" | resultf3$V2=="Jomon"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
       #subtitle = "サブタイトル",
       x = "F3(Jomon(Funadomari), X; YRI)",y = "",
       #caption = "キャプション",
       color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_jomon(samples)####

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_jomon(samples).png"
resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="Jomon")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="Jomon")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="Jomon" | resultf3$V2=="Jomon"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all sites",
       #subtitle = "サブタイトル",
       x = "F3(Jomon, X; YRI)",y = "",
       #caption = "キャプション",
       color = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_ah_jomon(Funadomari)####

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_Jomon_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa_f3_jomon(Funadomari)_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
         #subtitle = "サブタイトル",
         x = "F3(Jomon(Funadomari), X; YRI)",y = "",
         #caption = "キャプション",
         color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa2_ah_jomon(samples)####
for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_Jomon2_%s.txt",ah)
  outputname <- sprintf("Results/fstatsa2_f3_jomon(samples)_%s.png",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  library(ggplot2)
  library(RColorBrewer)
  display.brewer.pal(4,"RdYlBu")
  col <- brewer.pal(4,"RdYlBu")
  
  g <- ggplot(resultf3.dat,aes(x=f3,y=sample,color=pop)) + 
    geom_point(size=5) +
    labs(title = sprintf("All Autosomes / %s sites",ah),
         #subtitle = "サブタイトル",
         x = "F3(Jomon, X; YRI)",y = "",
         #caption = "キャプション",
         color = "") +
    theme(text = element_text(size = 15)) + 
    theme(axis.text.x = element_text(size = 15)) +
    theme(axis.text.y = element_text(size = 15))
  plot(g)
  
  png(outputname,width = 800,height = 900)
  plot(g)
  dev.off()
}

#fstatsa_f3_jomon(Funadomari)_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_jomon(Funadomari)_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="Jomon")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="Jomon")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="Jomon" | resultf3$V2=="Jomon"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_Jomon_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))

}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                levels=c("Africa","North-America","South-America",
                                         "Europe","South-Asia","East-Asia",
                                         "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                   levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(Jomon(Funadomari), X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_jomon(samples)_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_jomon(samples)_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="Jomon")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="Jomon")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="Jomon" | resultf3$V2=="Jomon"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_Jomon2_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))
  
}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                 levels=c("Africa","North-America","South-America",
                                          "Europe","South-Asia","East-Asia",
                                          "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                    levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(Jomon(samples), X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_f3_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_FIN_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))
  
}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                 levels=c("Africa","North-America","South-America",
                                          "Europe","South-Asia","East-Asia",
                                          "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                    levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(FIN, X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="FIN")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="FIN")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="FIN" | resultf3$V2=="FIN"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_FIN2_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))
  
}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                 levels=c("Africa","North-America","South-America",
                                          "Europe","South-Asia","East-Asia",
                                          "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                    levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(FIN, X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()


#fstatsa_f3_gbr_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa_f3.txt"
outputname <- "Results/fstatsa_f3_gbr_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="GBR")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="GBR")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="GBR" | resultf3$V2=="GBR"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_GBR_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Jomon","Jomon","Jomon","Jomon","Jomon","Kofun","Jomon","Kofun","Jomon","Kofun","Jomon","Jomon","Jomon"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))
  
}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                 levels=c("Africa","North-America","South-America",
                                          "Europe","South-Asia","East-Asia",
                                          "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                    levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(GBR, X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

#fstatsa2_f3_gbr_merge####

resultf3.dat.merge <- NULL

filename <- "Results/fstatsa2_f3.txt"
outputname <- "Results/fstatsa2_f3_gbr_alltypesites.png"

resultf3 <- read.table(filename)
resultf3.dat <- data.frame(sample=c(as.character(subset(resultf3$V1,resultf3$V2=="GBR")),
                                    as.character(subset(resultf3$V2,resultf3$V1=="GBR")[-1])),
                           f3=subset(resultf3$V3,resultf3$V1=="GBR" | resultf3$V2=="GBR"))
phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
resultf3.dat <- data.frame(sample=resultf3.dat$sample,
                           pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                                 "Jomon","Kofun"),
                           f3=resultf3.dat$f3/1000)
resultf3.dat$pop <- factor(resultf3.dat$pop,
                           levels=c("Africa","North-America","South-America",
                                    "Europe","South-Asia","East-Asia",
                                    "Jomon","Kofun"))
resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
resultf3.dat$sample <- factor(resultf3.dat$sample,
                              levels=resultf3.dat$sample)


resultf3.dat.merge <- data.frame(sample=resultf3.dat$sample,
                                 f3=resultf3.dat$f3,
                                 pop=resultf3.dat$pop,
                                 dat="all")

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  filename <- sprintf("Results/f3_GBR2_%s.txt",ah)
  resultf3 <- read.table(filename,header=T)
  resultf3.dat <- data.frame(sample=resultf3$pop3,
                             f3=resultf3$est)
  
  phase3 <- read.table("E:\\hmiwa\\genome\\VCF\\Human\\1000G-phase3\\all_pops.txt",sep=",")
  
  jork <- data.frame(sample=as.character(read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1[-1]),
                     pop=c(as.character(phase3$V3[-which(phase3$V1 %in% "YRI")]),
                           "Jomon","Kofun"))
  jork$sample <- factor(jork$sample,levels=resultf3.dat$sample)                  
  resultf3.dat <- merge(resultf3.dat,jork)
  resultf3.dat$pop <- factor(resultf3.dat$pop,
                             levels=c("Africa","North-America","South-America",
                                      "Europe","South-Asia","East-Asia",
                                      "Jomon","Kofun"))
  resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
  resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]
  resultf3.dat$sample <- factor(resultf3.dat$sample,
                                levels=resultf3.dat$sample)
  
  
  resultf3.dat.merge <- data.frame(sample=append(as.character(resultf3.dat.merge$sample),as.character(resultf3.dat$sample)),
                                   f3=append(as.character(resultf3.dat.merge$f3),as.character(resultf3.dat$f3)),
                                   pop=append(as.character(resultf3.dat.merge$pop),as.character(resultf3.dat$pop)),
                                   dat=append(as.character(resultf3.dat.merge$dat),rep(ah,nrow(resultf3.dat))))
  
}

#resultf3.dat$pop <- factor(resultf3.dat$pop,
#                           levels=c("Africa","North-America","South-America",
#                                    "Europe","South-Asia","East-Asia",
#                                    "Jomon","Kofun"))
#resultf3.dat <- resultf3.dat[order(resultf3.dat$sample,decreasing=F),]
#resultf3.dat <- resultf3.dat[order(resultf3.dat$pop),]


resultf3.dat.merge$pop <- factor(resultf3.dat.merge$pop,
                                 levels=c("Africa","North-America","South-America",
                                          "Europe","South-Asia","East-Asia",
                                          "Jomon","Kofun"))
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$sample,decreasing=F),]
resultf3.dat.merge <- resultf3.dat.merge[order(resultf3.dat.merge$pop),]
resultf3.dat.merge$sample <- factor(resultf3.dat.merge$sample,
                                    levels=resultf3.dat$sample)
resultf3.dat.merge$f3 <- as.numeric(as.character(resultf3.dat.merge$f3))

library(ggplot2)
library(RColorBrewer)
display.brewer.pal(4,"RdYlBu")
col <- brewer.pal(4,"RdYlBu")

g <- ggplot(resultf3.dat.merge,aes(x=f3,y=sample,color=pop,shape=dat)) + 
  geom_point(size=5) +
  labs(title = "All Autosomes / all/archaic humans sites",
       #subtitle = "サブタイトル",
       x = "F3(GBR, X; YRI)",y = "",
       #caption = "キャプション",
       color = "",
       shape = "") +
  theme(text = element_text(size = 15)) + 
  theme(axis.text.x = element_text(size = 15)) +
  theme(axis.text.y = element_text(size = 15))
plot(g)

png(outputname,width = 800,height = 900)
plot(g)
dev.off()

