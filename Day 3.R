#Part 1

library(tidyverse)

idksack <- read.csv("idkman.csv", header = F)

#make character row count

idksack <- idksack %>% mutate(nchar(idksack$V1))

colnames(idksack)[2] = "charcount"

#substring the fronthalf

idksack <- idksack %>% mutate(substr(idksack$V1, start = 1, stop = idksack$charcount /2))

colnames(idksack)[3] = "Front"

#substring the backhalf

idksack <- idksack %>% mutate(substr(idksack$V1, start = idksack$charcount /2 + 1, stop = idksack$charcount))

colnames(idksack)[4] = "Back"

#get only matches

library(qualV)

plz <- as.data.frame(sapply(seq_along(idksack$Front), function(i)
  paste(LCS(strsplit(idksack$Front[i], '')[[1]], strsplit(idksack$Back[i], '')[[1]])$LCS,
        collapse = "")))

colnames(plz)[1] = "VAL"

plzdrop <- as.data.frame(substr(plz$VAL, 0, 1))

colnames(plzdrop)[1] = "VAL"

letterscores <- c(letters,LETTERS)

huh <- as.data.frame(match(plzdrop$VAL, letterscores))

sum(huh$`match(plzdrop$VAL, letterscores)`, na.rm =T)

#answer 7746

#Part 2 I want to die

sack <- as.data.frame(readLines("rucksack.txt"))

colnames(sack)[1] = "ElfVal"

#divide into groups of 3

splitsack <- as.data.frame(split(sack$ElfVal,1:100))

fuckme <- c("aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk", "ll","mm","nn","nn","oo","pp","qq","rr","ss","tt","uu","vv","ww","xx","yy","zz")
fuckmeagain <- c("AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN","NN","OO","PP","QQ","RR","SS","TT","UU","VV","WW","XX","YY","ZZ")
fuckmethrice <- c("AAA","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III","JJJ","KKK","LLL","MMM","NNN","OOO","PPP","QQQ","RRR","SSS","TTT","UUU","VVV","WWW","XXX","YYY","ZZZ")
fuckmelast <- c("aaa","bbb","ccc","ddd","eee","fff","ggg","hhh","iii","jjj","kkk", "lll","mmm","nnn","ooo","ppp","qqq","rrr","sss","ttt","uuu","vvv","www","xxx","yyy","zzz")

ploop <- str_split(splitsack, "")
unique(ploop)
