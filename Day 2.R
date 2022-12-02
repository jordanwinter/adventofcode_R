#Part 1

rps <- readLines("rockpapscis.txt")

wordvals <- c(A = "rock", B = "paper", C = "scissors", X = "rock", Y = "paper", Z = "scissors")

ABC <- c("rock", "paper", "scissors")
XYZ <- c("rock", "paper", "scissors")


elfchoice <- wordvals[substr(rps,1,1)]
mychoice <- wordvals[substr(rps,3,3)]

wintielossmatrix <- matrix(c("tie", "loss", "win",
                             "win", "tie", "loss",
                             "loss", "win", "tie"), ncol = 3, byrow = T, dimnames = list(c("rock", "paper", "scissors"),
                                                                                         c("rock", "paper", "scissors")))
scores <- c(win = 6, tie = 3, loss = 0, rock = 1, paper = 2, scissors = 3)

sum(scores[wintielossmatrix[cbind(mychoice, elfchoice)]]) + sum(scores[mychoice])

#Part 2

rps <- readLines("rockpapscis.txt")

dict <- c(A = "rock", B = "paper", C = "scissors",
          X = "loss", Y = "tie", Z = "win")

elfchoice <- dict[substr(rps, 1, 1)]
mychoice <- dict[substr(rps, 3, 3)]

newmat <- matrix(
  c("scissors", "rock", "paper",
    "paper", "scissors", "rock",
    "rock", "paper", "scissors"),
  byrow = TRUE, ncol = 3,
  dimnames = list(c("loss", "win", "tie"),
                  c("rock", "paper", "scissors"))
)

scores <- c(win = 6, tie = 3, loss = 0, rock = 1, paper = 2, scissors = 3)

sum(scores[newmat[cbind(mychoice, elfchoice)]]) + sum(scores[mychoice])

