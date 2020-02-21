print("hello")
5+8
3 + (4 * 5)
a <- 10
2^3

# 폰트로 D2 coding 사용
# 주석은 ctrl+shift+c

library(ggplot2)


log(10) + 5
sqrt(25)
max(5,3,2)

x <- c(1,2,3)
y <- c("a", "b", "c")  #하나의 백터 안에 다른 type이 있으면 하나의 type으로 변함 ex)죄다 str으로
z <- c(TRUE, TRUE,FALSE)

v1 <- 50:90
v1

v2 <- c(1,2,5, 50 : 90)
v2

v3 <-seq(1,101,3)
v3

v4 <- seq(0.1,1.0,0.1)
v4

v5 <-rep(1,time=5)
v5

v6 <- rep(1:5, time=3)
v6

v7 <- rep(c(1,5,9), times=3)
v7


score <- c(90,85,70)
names(score) <- c("John","Tom","Jane")

score[1]

d<-c(1,4,3,7,8)
d[c(1,3,5)]
d[1:3]
d[seq(1,5,2)]
d[-2]  #2번째꺼 빼고
d[-c(3:5)]  


GNP <- c(2090, 2450,960)
names(GNP) <- c("Korea", "Japan", "Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea", "Nepal")]



v1 <- c(1,5,7,8,9)
v1
v1[2] <- 3
v1
v1[c(1,5)] <- c(10,20)
v1


d <- c(1,4,3,7,8)
2*d
d-5
d*3


x<-c(1,3,5)
y<-c(2,4,6)

z <- x+y
z

sum(z)
mean(z)
median(z)


sort(x=d, decreasing = FALSE)


a <- c(1,2,3,4,5,6,7,8,9)
a>5

a==5

ds<-c(90,85,70,84)



#변수 이름에 .이 들어갈 수 있ㄷ.
#list는 python의 dict와 비슷한 구조
ds <- c(90,85,70,84)
my.info <- list(name='Tome', age=60, status =TRUE, score =ds)
my.info
my.info[[1]]
my.info$age
my.info$score



bt <-c("A","B","B","O","AB","A")
bt.new <-factor(bt)
bt
bt.new
bt.new[5]

levels(bt.new)

as.integer(bt.new)

bt.new[7] <- 'B'

bt.new


#매트릭스는 같은 자료형만,
#데이터프레임은 다른 자료형도 다룰수있다.

z<-matrix(1:20, nrow = 4, ncol = 5)
z

z2<-matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z2

x <- 1:4 
y <- 5:8
m1 <- cbind(x,y)
m1

m2 <- rbind(x,y)
m2

score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),nrow=4, ncol=3)  
rownames(score) <- c('A','B','C','D')
colnames(score) <- c('English','Math','Science')
score


city <-c("Seoul", "Tokyo", "Washington")
rank  <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info


iris
head(iris)
head(iris,2)

dim(iris)

str(iris)

iris[,5]
unique(iris[,5])
#빈도수 셀때는 table이용
table(iris[,"Species"])

colSums(iris[,-5])  #열별합계
colMeans(iris[,-5]) #열별평균

z <- matrix(1:20, nrow = 4, ncol = 5)
z
t(z)



#일부 추출하기
IR.1 <-subset(iris, Species == "setosa")
IR.1기
IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width >4)
IR.2
IR.2[, c(2,4)]


#매트릭스와 데이터프라임 연ㅅ
a<-matrix(1:20,4,5)
b<-matrix(21:40,4,5)
a
b
a*2+3*b


#매트릭스와 데이터 프라임 변환
st <- data.frame(state.x77)
head(st)
class(st)

iris.m <- as.matrix(iris[,1:4])


#파일 가져오기  & 쓰기
setwd("C:/Users/user/2020_programmingcamp/R/datas/Data")
air <- read.csv("airquality.csv", header = T)
head(air)

my.iris <- subset(iris, Species = 'Setosa')
write.csv(my.iris, "my_iris.csv", row.names = F) #row.names = F 행번호 붙이지 말라는 의미 


#조건문
job.type <- 'A'
if(job.type == 'B'){
  bonus <- 200
}else{
    bonus <-100
    }
print(bonus)

score <-85
if(score > 90){
  grade <- 'A'
} else if(score > 80){
  grade <-'b'
}else if(score >70){
  gradE <-'C'
} else{grade <- 'F'}
print(grade)

a<-10
b<-20
c<-ifelse(a>b,a,b)  #ifelse문 사망연산자라고도 불ㄹ
print(c)
#ifelse에서  else는 반드시 if문의 코드블록이 끝나는 부분에 있는 }와 같은 줄에 작성해야 함 


#반복문
for(i in 1:5){
  print('*')
}

dan=7
for(i in 1:9){
  cat(dan, "*", i,"=",dan*i, '\n') #print는 하나만 출려가능, 여러개 출력하려면 cat을 사용해야함.
}

norrow <- nrow(iris)
mylabel <- c()
for(i in 1:norrow){
  if (iris$Petal.Length[i] <= 1.6) {
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1){
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)

hap <- 0
i<-1
while(i <= 100){
  hap <- hap + i
  i <-i+i
}
hap
  


#apply() 반복작업의 대상이 매트릭스나 데이터프레임의 행이나 열이라면
apply(iris[,1:4],1, mean) #row 방향으로 함수적용
apply(iris[,1:4],2, mean) #col 방향으로 함수적용



#사용자 정의 함수

#기본 틀
#함수명 <- function(매개변수목록){
#실행할 명령문
#return(함수 실행결고)
#}

mymax <- function(x,y){
  num.max <-x
  if(y >x){
    num.max <-y
  }
  return(num.max)
}

mymax(10,15)


#조건에 맞는 데이터 위치 찾기
score <- c(10,20,30,40,50,60,70)
which(score == 20)
which(score >= 35)
max(score)
which.max(score)


#도수분포표작서
favorite <- c('WINTER','SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL','SUMMER','SPRING','SPRING')
favorite
table(favorite)
table(favorite)/length(favorite)

ds <- table(favorite)
ds
barplot(ds, main = 'favorite season')
pie(ds, main = 'favorite season', col= colors)


