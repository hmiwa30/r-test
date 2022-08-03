.libPaths("C:\\Users\\himar\\Documents\\R")
.libPaths()
#install.packages("shiny")
#install.packages("shinythemes")
#install.packages("shinyjs")
#install.packages("shinyBS")
#install.packages("shinyFiles")
#install.packages("shinyalert")
#install.packages("shinyWidgets")
#install.packages("shinydashboard")
#install.packages("DT")
#install.packages("jquerylib")
library(admixtools)
#################################
gc(reset=T)
gc(reset=T)

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output_%s",ah)
  extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[9]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_FIN_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis2_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output2_%s",ah)
  extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[9]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_FIN2_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[5]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_GBR_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis2_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output2_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[5]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_GBR2_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[16]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_JPT_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis2_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output2_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[16]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_JPT2_%s.txt",ah),
              quote=F,row.names=F)
}

#Warning messages:
#1: In f2_from_precomp(my_f2_dir) :
#  Some f2-statistic estimates are negative across blocks. This is probably caused by too many missing or rare SNPs in populations with low sample size, which makes the f2 bias correction unreliable. Consider running 'f2_from_precomp' with 'afprod = TRUE'.
#2: In f2_from_precomp(my_f2_dir) :
#  Some f2-statistic estimates are negative across blocks. This is probably caused by too many missing or rare SNPs in populations with low sample size, which makes the f2 bias correction unreliable. Consider running 'f2_from_precomp' with 'afprod = TRUE'.
#3: In f2_from_precomp(my_f2_dir) :
#  Some f2-statistic estimates are negative across blocks. This is probably caused by too many missing or rare SNPs in populations with low sample size, which makes the f2 bias correction unreliable. Consider running 'f2_from_precomp' with 'afprod = TRUE'.

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[27]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_Jomon_%s.txt",ah),
              quote=F,row.names=F)
}

for(ah in c("altai","chagyrskaya","denisova","vindija")){
  #prefix = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\Rename\\j_f3_analysis2_%s",ah)
  my_f2_dir = sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\output2_%s",ah)
  #extract_f2(prefix, my_f2_dir)
  f2_blocks = f2_from_precomp(my_f2_dir)
  dim(f2_blocks)
  lista <- read.table("G:\\hmiwa\\m_20211215\\05_jomonf3\\Geno\\lista2.txt")$V1
  (pop1 = as.character(lista[1]))
  (pop2 = as.character(lista[27]))
  (pop3 = as.character(lista[-1]))
  dat.f3=f3(f2_blocks,pop1,pop2,pop3)
  write.table(dat.f3,sprintf("G:\\hmiwa\\m_20211215\\05_jomonf3\\Results\\f3_Jomon2_%s.txt",ah),
              quote=F,row.names=F)
}
