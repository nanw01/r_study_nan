install.packages("caTools")
library(caTools)
library(readxl)
german_credit_card <- read_excel("~/Documents/Hult/Data Science R - DAT-5302 - FMSBA1/Thomas Kurnicki/Basic data/german credit card.xls")

german_credit_card$good_bad <- gsub("bad", "0", german_credit_card$good_bad)
german_credit_card$good_bad <- gsub("good", "1", german_credit_card$good_bad)
german_credit_card$good_bad <- as.numeric(german_credit_card$good_bad)

zzz <- sample(1:nrow(german_credit_card), size = 0.6 * nrow(german_credit_card))
aaa <- german_credit_card[zzz, ]
bbb <- german_credit_card[-zzz, ]

my_mod_0 <- glm(good_bad ~ history + purpose + amount, data = german_credit_card, family = "binomial")

predict(my_mod_0,bbb,type="response")


my_mod_1 <- glm(good_bad ~ duration + history + purpose + amount, data = german_credit_card, family = "binomial")
my_mod_2 <- glm(good_bad ~ duration + history + purpose + amount, data = german_credit_card, family = "binomial")


summary(my_mod)
