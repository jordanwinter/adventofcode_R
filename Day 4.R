#Part 1

library(tidyverse)

sets <- readLines("pairs.txt")

sets <- sets %>%  strsplit("[-,]") |> map(as.integer)

#make function for making pairs for range comparison

goombastomp <- function(x) {
  front <- seq(x[1], x[2])
  back <- seq(x[3], x[4])
  
  length(setdiff(front, back)) == 0 ||
  length(setdiff(back, front)) == 0
  
}
map_lgl(sets, goombastomp) %>% sum()



#part two seems similar 

library(tidyverse)

sets <- readLines("pairs.txt")

sets <- sets %>%  strsplit("[-,]") |> map(as.integer)

#make function for making pairs for range comparison

goombastomp <- function(x) {
  front <- seq(x[1], x[2])
  back <- seq(x[3], x[4])
  
  length(intersect(front, back)) > 0
  
}
map_lgl(sets, goombastomp) %>% sum()
