elf <- readLines("elf.txt")
elf <- as.numeric(elf)

split(elf, cumsum(is.na(elf))) |>
  vapply(sum, na.rm = T, FUN.VALUE = numeric(1)) |>
  max()

#part 2

split(elf, cumsum(is.na(elf))) |>
  vapply(sum, na.rm = T, FUN.VALUE = numeric(1)) |> sort() |> tail(3) |> sum()

