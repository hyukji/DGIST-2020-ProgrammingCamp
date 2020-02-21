#day 2
#로또 만들기

i<-1
while(i<=5){
  lotto <- sort(sample(1:45,6))
  if(sum(lotto) >= 100 & sum(lotto) <= 170){
    cat(lotto,'합=',sum(lotto), '\n')
    i<-i+1
  }
}

dist <- cars[,2]
boxplot(dist, main="자동차 제동거리")

mtcars

test_mtcars <- mtcars
str(test_mtcars)
    
wt<-mtcars$wt    #중량 자료
mpg <-mtcars$mpg #연비자료

plot(wt,mpg,main="중량-연비 그래프",
     xlab="중량", 
     ylab="연비(MPG)", 
     col="red",
     pch=19)  #점의 종류

vars<- c("mpg", "disp", "drat", "wt")
target<- mtcars[, vars]
head(target)
pairs(target, main="Multi Plots")



#산점도 계ㅅ
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species)
point
color <- c("red", "green","blue")
plot(iris.2,
     main="Iris plot",
     pch=c(point),
     col=color[point])


#상관계수의 계사
beers<-c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers, bal)
tbl

plot(bal~beers, data=tbl)
res <- lm(bal~beers,data=tbl)
abline(res)
cor(beers, bal)

cor(iris[,1:4])


#모듈 다운받기
if(!require(mlbench)){
  install.packages("mlbench")
  library(mlbench)
}


data("BostonHousing")
myds <- BostonHousing[,c('crim','rm','dis','tax','medv')]

grp <- c()
for(i in 1:nrow(myds)){
  if(myds$medv[i] >= 25.0){
    grp[i] <- "H"
  }else if(myds$medv[i] <= 17.0){
    grp[i] <- "L"
  } else{
    grp[i] <- "M"
  }
}
str(grp)
grp <- factor(grp)
grp <- factor(grp, levels=c("H","M","L"))

myds <- data.frame(myds, grp)

str(myds)
head(myds)
table(myds$grp)

par(mfrow=c(2,3))

for (i in 1:5){
  hist(myds[,i], main =colnames(myds)[i], col='yellow')
}


for (i in 1:5){
  boxplot(myds[,i], main =colnames(myds)[i], col='yellow')
}

par(mfrow=c(1,1))
boxplot(myds$crim~myds$grp, main ="1인당 범죄율")
boxplot(myds$rm~myds$grp, main ="방의 갯수")

pairs(myds[,-6])

library(ggplot2)
x <- c("a", "a", "b", "c")
qplot(x)
data(mpg)
mpg

qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)    
qplot(data=mpg, x=drv, y=hwy, geom='line')    
qplot(data=mpg, x=drv, y=hwy, geom='boxplot', color=drv)    


#data가 적을때는 백터두개 합쳐서 dataframe 만들수잇따.
english <- c(90,80,60,70)
english
math <-c(50,60,100,20)
df_midterm <- data.frame(english, math)
df_midterm
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english =c(90,80,60,70),
                                    math = c(50,60,100,20),
                                    class1=c(1,1,2,2))


#excel에서 자료 가지고 오기/

if(!require(readxl)){    #1. 메모리에 올라가고 True를 리터
  install.packages("readxl")
  library(readxl)
}


library(readxl)
df_exam <- read_excel("C:/Users/user/2020_programmingcamp/R/datas/Data/excel_exam.xlsx")
df_exam

#tibble == data.frame 거의 


mean(df_exam$english)
mean(df_exam$science)

df_exam_novar <- read_excel("C:/Users/user/2020_programmingcamp/R/datas/Data/excel_exam_novar.xlsx", col_names =F)
df_exam_novar

colnames(df_exam_novar) <- c("학번", "반", "영어", "수학", "과학")
df_exam_novar

df_exam_sheet <- read_excel("C:/Users/user/2020_programmingcamp/R/datas/Data/excel_exam_sheet.xlsx", sheet=3) #excel 파일중 3번째 sheet
df_exam_sheet

df_csv_exam <- read.csv("C:/Users/user/2020_programmingcamp/R/datas/Data/csv_exam.csv")
df_csv_exam

df_csv_utf8 <-read.csv("C:/Users/user/2020_programmingcamp/R/datas/Data/csv_exam_utf8.csv", fileEncoding = "UTF-8")
str(df_csv_utf8)

df_csv_utf8 <-read.csv("C:/Users/user/2020_programmingcamp/R/datas/Data/csv_exam_utf8.csv", fileEncoding = "UTF-8", stringsAsFactors = F)
str(df_csv_utf8)



#크롤링

#read_html: HTML읽기
#html_node 태그 하나 읽기
#html_nodes : 태그 여러개 읽기
#html_table : <table></table> 을 dataframe으로 얻을 수 잇다
#html_text 태그안의 내용을 가지고 온다.

if(!require(rvest)){
  install.packages("rvest")
  library(rvest)
}

#로또 사이트 크롤ㄹ

url0 = "https://www.dhlottery.co.kr/common.do?method=main"
html0 <- read_html(url0, encoding = "EUR-KR")
lottoDrwNo <- html_node(html0, '#lottoDrwNo')

hoi <- html_text(lottoDrwNo)
cat(hoi, "회","\n")
spans <- html_nodes(html0, "#numView > span")
lotto <- html_text(spans[2:7])
cat("당첨번호 =",lotto,"\n")
bonus <-html_text(spans[9])
cat("보너스 번호=", bonus,"\n")


cat(hoi, "회","\n")
cat("당첨번호 =",lotto,"\n")
cat("보너스 번호=", bonus,"\n")

#리디북스 월간베스트 크롤링
if(!require(dplyr)){ 
  #dplyr는 파이프 라는 걸 제공.
  install.packages("dplyr")
  library(dplyr)
}
if(!require(stringr)){ 
  install.packages("stringr")
  library(stringr)
}

url1= "https://ridibooks.com/bestsellers/general?order=monthly"
html1 <- read_html(url1, encoding = "UTF-8")
res <- html_nodes(html1, ".title_text.js_highlight_helper")
contents <- html_text(res)
contents <- gsub("\n","",contents)
contents <- gsub(" ", "", contents)

contents[2:11]


#리디북스 베스트셀러 정보 얻기(dplyr활용)
url2 = "https://ridibooks.com/bestsellers/general?order=monthly"
contents <-read_html(url2, encoding = "UTF-8") %>%
  html_nodes(".title_text.js_highlight_helper") %>%
  html_text()
contents <- gsub("\n","",contents)
contents <- gsub(" ", "", contents)

contents[2:11]



#위키피디아  인구순_나라 목록 <table> 크롤링

url1 = "https://ko.wikipedia.org/wiki/" #그냥 복붙해도 상관 없는데 그냥 보기 편하라고.
query1 <- "인구순_나라_목록"
query2 <- URLencode(iconv(query3, to = "UTF-8"))

url2 <- paste0(url1, query2)

df_table <- read_html(url2) %>% 
  html_node("#mw-content-text > div > table") %>% 
  html_table()
str(df_table)

#rdata로 저장하고 불러오기

df_midterm <- data.frame(english =c(90,80,60,70),
                         math = c(50,60,100,20),
                         class1=c(1,1,2,2))

write.csv(df_midterm, file = "df_midterm.csv", row.names = F)

save(df_midterm, file = "df_midterm.rda")
rm(df_midterm) #메모리에서 지우기
df_midterm #위에서 지워서 에러남.

if(!require(writexl)){
  install.packages("writexl")
  library(writexl)
}

write_xlsx(df_midterm, "df_midterm.xlsx")
load("df_midterm.rda")
df_midterm

