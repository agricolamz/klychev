library(tidyverse)
library(tesseract)
library(magick)
rus <- tesseract("rus")

# ocr files ---------------------------------------------------------------
pdf <- image_read(path = paste0("/home/agricolamz/books/languages/Eurasia/Caucasian/Abkhaz-Adyge/Abaza/Клычев Р. Н. (1995) Словарь сочетаемости локальных превербов с сффиксоидами и глаго.djvu"), density = 150)
t <- ocr(pdf, engine = rus)
t2 <- paste(t[8:347], collapse = "\n")

test <- str_replace_all(t2, "\n\n", "BREACK")
test <- str_replace_all(test, "\n", " ")
test <- str_replace_all(test, "BREACK", "\n")
tibble(text = unlist(str_split(str_replace_all(test, "BREACK", "\n"), "\n"))) %>% 
  write_csv("/home/agricolamz/work/databases/klychev/klychev_ocr.csv")

# then manually correct