mpg <- as.data.frame(ggplot2::mpg)
mpg

df_raw <- data.frame(var1 =c(1,2,1), var2 = c(2,3,2))
df_raw

df_new <- df_raw

df_new

df_new <- rename(df_new, v2 = var2)
df_new



#df 만들고 조건문으로 등급 나누어 그래프그리기
df_raw$var_sum <- df_raw$var1 + df_raw$var2
df_raw$var_mean <- df_raw$var_sum / 2
df_raw

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail") 
head(mpg,20)
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))


mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 25, "B",
                           ifelse(mpg$total >=20, "C", "D" )))
                    
table(mpg$grade)
library(ggplot2)
qplot(mpg$test)
qplot(mpg$grade)




# 조건에 맞는 데이터만 추출하기

library(dplyr)
exam <- read.csv("C:/Users/user/20202_programming/datas/Data/csv_exam.csv")
exam

exam.c1 = exam %>% filter(class ==1)
exam %>% filter(class ==1 & math >= 50)
exam %>% filter(english >=90 | math >= 90)
exam %>% filter(class %in% c(1,3,5))


exam %>% select(math)
exam %>% select(-math)
exam %>% select(class, math, english)
exam %>% select(-c(math, english))


exam %>% 
  filter(class ==1 ) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head()



exam %>%    
  arrange(math)  #기본값은 오름차수

exam %>%    
  arrange(desc(math))

exam %>%
  arrange(class, desc(math))

exam %>%mutate(total = math+english+science,
               mean=(math+english+science)/3) %>%
  head

exam %>%
  mutate(test=ifelse(science>=60,"pass","fail")) %>% 
  head

exam %>% 
  group_by(class) %>% 
  summarise(mean_mean = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math=sum(math),
            median_math = median(math),
            n=n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_city = mean(cty)) %>% 
  head(10)

mpg

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == 'suv') %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange((desc(mean_tot))) %>% 
    head(5)


#데이터 합치기
test1 <- data.frame(id = c(1,2,3,4,5),
                     midterm = c(60,80,70,90,85))

test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))

total <- left_join(test1, test2, by = "id")


#데이터 정제
#결측치 표기 대문자 NA

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA)) 
df 

is.na(df)

table(is.na(df))

df_nomiss2 <- na.omit(df)
df_nomiss2

df
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출


exam <- read.csv("C:/Users/user/20202_programming/datas/Data/csv_exam.csv")

exam[c(3,8,15), "math"] <- NA
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm =T))

exam$math <- ifelse(is.na(exam$math), 55, exam$math)  #결측치를 평균으로 때려넣자!!
table(is.na(exam$math))

mean(exam$math)


#이상한 데이터 찾기. 정상범위 벗어나느 것
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
  #이상치를 벗어난 값은 max값으로 변환시키기

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() 


#qplot() : 전처리 단계 데이터 확인용 문법 간단, 기능 단순
#ggplot() : 최종 보고용. 색, 크기, 폰트 등 세부 조작 가능 


df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) 

df_mpg 

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()
ggplot(data = mpg,aes(x=drv)) + geom_bar()
ggplot(data = mpg,aes(x=hwy)) + geom_bar()

economics
ggplot(data=economics, aes(x=date, y=unemploy))+geom_line()



library(foreign)
raw_welfare <- read.spss(file= "C:/Users/user/20202_programming/datas/Data/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
welfare <-raw_welfare

head(welfare)
tail(welfare)
dim(welfare)

str(welfare)
summary(welfare)


welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)


#성별에 따른 월급 차이 
class(welfare$sex)
table(welfare$sex)

table(is.na(welfare$sex))

welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

qplot(welfare$sex)

class(welfare$income)
summary(welfare$income)

qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000)

table(is.na(welfare$income))
welfare$income <- ifelse(welfare$income %in% c(0,9999),
                         NA, welfare$income)
table(is.na(welfare$income))

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income)) 

sex_income

ggplot(data = sex_income, aes(x=sex,y=mean_income))+
  geom_col





#googlemap ggmap
if(!require(ggmap)){
  install.packages("ggmap")
  library(ggmap)
}

register_google("googlemap사이트에서 만든 key값 입력해주면 됨.")
gg_daegu <- get_googlemap("동대구역", maptype="roadmap", zoom=13)
ggmap(gg_daegu)



