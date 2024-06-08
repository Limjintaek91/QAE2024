library(readxl)
X1001 <- read_excel("C:/Users/82107/Desktop/°æÁ¦µ¥ÀÌÅÍºÐ¼®ÀÔ¹®/ÁøÂ¥ÁøÂ¥ ÃÖÁ¾°úÁ¦/1001 ¸®½ºÆ®_Å×½ºÆ®.xlsx")
str(X1001)
names(X1001) <- c("number", "title", "artist", "read count", "read", "year" )


table(X1001$artist)
X1001$artist <- as.factor(X1001$artist)


library(dplyr)
arrange <- X1001 %>%
  select(artist) %>%
  group_by(artist) %>%
  summarize(n=n()) %>%
  arrange(desc(n)) %>%
  head(1000)

library(wordcloud2)
library(RColorBrewer)
col <- brewer.pal(12, "Set3")
wordcloud2(arrange, color=col, size=0.1, fontFamily="¸¼Àº °íµñ", rotateRatio=0)
col <- c(col, rep("#8DD3c6",38))
wordcloud2(arrange, color=col, size=0.1, fontFamily="¸¼Àº °íµñ", rotateRatio=0)
col <- c(col, rep("#7DD567",50))
wordcloud2(arrange, color=col, size=0.1, fontFamily="¸¼Àº °íµñ", rotateRatio=0)
col <- c(col, rep("#3AC",900))
wordcloud2(arrange, color=col, size=0.1, fontFamily="¸¼Àº °íµñ", rotateRatio=0)


