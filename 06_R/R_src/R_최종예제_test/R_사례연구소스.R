####################################
##### 11장. 최종예제(사례연구) #####
####################################

# 1번. ‘한국복지패널데이터’(SPSS, koweps_hpc10_2015_beta5.sav)를 로드한 후 필요한 데이터 변수만을 select하여 변
# 수명을 변경하시오. 단 필요한 필드로 성별은 gender, 태어난 연도는 birth, 혼인상태는 marriage, 종교는 
# religion, 월평균임금은 income, 직업코드는 code_job, 지역코드는 code_region로 필드명을 변경한다.
#### 0. 패키지 설치 및 로드하기 ####
install.packages("foreign")
library(foreign) # SPSS 파일 불러오기
library(dplyr) # 전처리
library(doBy) # 전처리
library(ggplot2) # 시각화
library(readxl) # 엑셀파일 불러오기(code_job의 데이터)
rm(list=ls(all.names = TRUE))

#### 1. 데이터 불러와 원하는 필드만 추출 ####
# (1) SPSS파일을 데이터 프레임으로 
raw_Welfare <- read.spss(file = 'D:/bigData/Download/sharedBigdata/Koweps/Koweps_hpc10_2015_beta1.sav', to.data.frame=TRUE) # 이 파라미터가 없으면 list형태로 받아옴
dim(raw_Welfare)
View(raw_Welfare)

raw_welfare <- read.spss('D:/bigData/Download/sharedBigdata/Koweps/Koweps_hpc10_2015_beta6.sav', to.data.frame=TRUE, reencode='utf-8')
dim(raw_welfare)
View(raw_welfare)

# (2) 필요한 필드만 select
welfare <- raw_welfare[, c('h10_g3','h10_g4','h10_g10','h10_g11','h10_eco9','p1002_8aq1','h10_reg7')]
dim(welfare)
head(welfare)

# (3) 변수명 변경
welfare <- rename(welfare, gender=h10_g3, birth=h10_g4, marriage=h10_g10, 
                  religion=h10_g11, code_job=h10_eco9, income=p1002_8aq1, code_region=h10_reg7)
head(welfare)
table(is.na(welfare)) # 전체 데이터의 결측치 확인
colSums(is.na(welfare)) # 열별 결측치 확인


# 2번. 1번 문제의 결과인 data.frame변수를 이용하여 성별에 따른 월급 차이가 있는지를 분석하시오.
#### 2. 성별에 따른 월급 차이 분석 ####
# (1) gender필드에 이상이 있는지 확인, 이상치 처리
table(welfare$gender, useNA='ifany') #이상치 없음
# (2) gender필드 결측치 확인
table(is.na(welfare$gender)) #결측치 없음
# (3) gender가 1이면 'male'로 2면 'female'로 변경. factor로 변경
welfare$gender <- ifelse(welfare$gender==1, "male","female")
table(welfare$gender)
welfare$gender <- factor(welfare$gender, levels=c('male','female'))
# (4) 성별 비율 도표와 그래프 시각화
gender.ratio <- welfare %>% 
  group_by(gender) %>% 
  summarise(ratio = n()/nrow(welfare)*100)
gender.ratio
pie(gender.ratio$ratio, 
    labels=paste(gender.ratio$gender,round(gender.ratio$ratio, 1),'%'),
    clockwise = T, col=c('skyblue','pink'))  

ggplot(gender.ratio, aes(x=gender, y=ratio, fill=gender)) +
  #geom_col() +
  geom_bar(stat='identity') +
  scale_x_discrete(limits=c('female','male')) + #축의 순서 지정
  scale_fill_discrete(limits=c('female','male')) + #범례 순서 지정
  theme(legend.position = c(.7,.8), #범례 위치 지정
        legend.title = element_text(face=3, color='red')) #범례 이탤릭체 빨간글씨

ggplot(gender.ratio, aes(x="", y=ratio, fill=gender)) +
  geom_col() +
  coord_polar("y")

# (5) income의 최소값, 1~3사분위수, 최대값, 결측치
summary(welfare$income)
boxplot(welfare$income)
ggplot(welfare, aes(y=income)) +
  geom_boxplot()
ggplot(welfare, aes(income)) +
  geom_histogram() + # 연속적인 자료 income을 계급으로 나누어 계급별 빈도그래프 생성
  coord_cartesian(xlim = c(0,1200))

# (6) income이 0인 데이터는 이상치로 정하고 결측처리
boxplot(welfare$income) $stat
b <- boxplot(welfare$income) $stat
table(welfare$income==0)
table(welfare$income<=b[1])
welfare$income <- ifelse(welfare$income<=b[1], NA, welfare$income) #결측처리
table(welfare$income<=b[1], useNA = 'ifany')
table(welfare$income>b[5], exclude = NULL) # 상위 이상치보다 큰 값이 5%정도 되어 상위 이상치는 처리하지 않음

## 결측치 처리
temp <- welfare[, c('gender','income')]
m <- tapply(temp$income, temp$gender, median, na.rm=T)
m
head(temp)
temp$income <- ifelse(is.na(temp$income), m[temp$gender], temp$income)
head(temp)

# (7) 결측치를 제외한 데이터를 이용하여 성별에 따른 월급차이 있는지 분석하시오.
summaryBy(income~gender, data=welfare, FUN=c(mean,sd), na.rm=T)
# na.omit()함수를 이용하여 결측치 제외
temp <- na.omit(welfare[, c('gender','income')])
summaryBy(income~gender, data=temp, FUN=c(mean, sd))

welfare %>% 
  group_by(gender) %>% 
  summarise(income.mean=mean(income, na.rm=T)) %>% 
  ggplot(aes(x=gender, y=income.mean, fill=gender)) +
  geom_bar(stat='identity')

ggplot(welfare, aes(x=gender, y=income)) +
  geom_point(position='jitter', col='yellow', alpha=.3) +
  geom_violin() +
  geom_boxplot(aes(col=gender), fill='lightyellow', width=.3, notch=T) +
  coord_cartesian(ylim=c(0,1000))

t.test(income~gender, data=welfare) # p-value확인 : 0.05미만으로 성별에따른 월급차이가 없다는 귀무가설을 기각한다.

### 3번. 나이와 월급의 관계 - 몇살때 월급이 가장 많은가 ###
#(1)이상치, 결측치 확인
class(welfare$birth)
table(is.na(welfare$birth), useNA = 'ifany') # 결측치 없음
boxplot(welfare$age)$stat # 이상치 없음
#(2) age필드 계산하여 추가
welfare$age <- 2015 - welfare$birth + 1 

ggplot(welfare, aes(y=age)) + 
  geom_boxplot() +
  theme(axis.text.x = element_blank())+ # x축 눈금을 없앰
  coord_cartesian(xlim=NULL)
ggplot(welfare, aes(x=age)) + # 나이분포 확인
  geom_bar()
#(3) x축을 나이, y축을 월급으로 지정하고 나이에 따른 월급의 변화가 표현되도록 막대그래프나 선 그래프로 시각화
# 나이벌 월급평균 및 표준편차 도표(income NA인 것은 제외)
age_income <- welfare %>% 
  filter(!is.na(welfare$income)) %>% 
  group_by(age) %>% 
  summarise(income.mean = mean(income),
            income.sd   = sd(income))
View(age_income)
# 나이별 월급 평균 시각화
ggplot(age_income, aes(x=age, y=income.mean)) +
  geom_col()
ggplot(age_income, aes(x=age, y=income.mean)) +
  geom_line()
#(4) 나이에 따른 월급의 차이가 있는지 관계를 분석한다
fit <- lm(income~age, data=welfare)
anova(fit) # F값이 0.05미만으로 나이에 따른 월급의 차이가 없다는 귀무가설을 기각
#(5) 몇살때 월급을 가장 많이 받는지 분석하시오. : 53세
age_income[order(age_income$income.mean), ]
head(age_income[order(age_income$income.mean), ],1)


### 4번. 1번 문제의 결과인 data.frame변수를 이용하여 연령대에 따른 월급의 차이가 있는지, 있으면 어떤 연령대가 
### 월급이 가장 많은지 분석하시오.단, 연령대는 30세 이하는 young, 31~60세는 middle, 61세 이상은 old로 분류한다.
welfare$agegrade <- ifelse(welfare$age>=61, "old", 
                           ifelse(welfare$age>=31 & welfare$age<61, "middle",
                                  ifelse(welfare$age>0 & welfare$age<31, "young",'X')))

head(welfare$agegrade)
welfare$agegrade <- factor(welfare$agegrade, levels=c('old','middle','young'))
welfare <- rbind(welfare,welfare$agegrade)

table(welfare$agegrade)
table(is.na(welfare$agegrade), useNA = 'ifany') # 결측치 없음
boxplot(welfare$agegrade)$stat # 이상치 없음

agegrade_income <- welfare %>% 
  filter(!is.na(welfare$income)) %>% 
  group_by(agegrade) %>% 
  summarise(income.mean = mean(income),
            income.sd   = sd(income))
agegrade_income[order(agegrade_income$income.mean), ]

ggplot(agegrade_income, aes(x=agegrade, y=income.mean)) +
  geom_col()

### 5번. 1번 문제의 결과인 data.frame변수를 이용하여 성별에 따른 월급의 차이는 연령대 별로 다른지 분석하시오.
table(is.na(welfare$gender), useNA = 'ifany')
table(is.na(welfare$agegrade), useNA = 'ifany')
table(is.na(welfare$income), useNA = 'ifany')

summaryBy(income~gender, data=welfare, FUN=c(mean,sd), na.rm=T)
summaryBy(income~agegrade, data=welfare, FUN=c(mean,sd), na.rm=T)

welfare %>% 
  group_by(agegrade, gender) %>% 
  summarise(income.mean=mean(income, na.rm=T)) %>% 
  ggplot(aes(x=gender, y=income.mean, fill=agegrade)) +
  geom_bar(stat='identity')

### 6번. 1번 문제의 결과인 data.frame변수를 이용하여 나이에 따른 월급 변화를 성별을 분리하여 시각화 하시오
ggplot(welfare, aes(x=age, y=income, col=gender)) +
  geom_line() + # 연속적인 자료 income을 계급으로 나누어 계급별 빈도그래프 생성
  coord_cartesian(xlim = c(10,90))
ggsave('gender_income.png')

### 7번 문제의 결과인 data.frame변수를 이용하여 직업별 월급의 차이가 나는지 분석하고,
### 만약 월급의 차이가 나면 어떤 직업이 월급이 가장 많은지 상위 10개 직업군만 시각화하시오.
fit2 <- lm(income~code_job, data = welfare)
anova(fit2) # F값 0.05미만
job_income <- welfare %>% 
  filter(!is.na(welfare$income)) %>% 
  group_by(code_job) %>% 
  summarise(income.mean = mean(income),
            income.sd   = sd(income))
View(job_income)
job10 <- head(job_income[order(-job_income$income.mean), ],10)
job10
code_welfare <- read_xlsx('D:/bigData/Download/sharedBigdata/Koweps/Koweps_Codebook.xlsx', sheet=2)
head(code_welfare)
job10 <- left_join(job10, code_welfare[, c('code_job','job')], by='code_job')
ggplot(job10, aes(x=income.mean, y=job)) +
  geom_col()
ggsave('top10.png')

### 8번. 1번 문제의 결과인 data.frame변수를 이용하여 성별로 어떤 직업이 가장 많을지 분석하시오.
welfare2 <- left_join(welfare, code_welfare[, c('code_job','job')], by='code_job')
table(subset(welfare2, subset=(gender=='female'), select=job))
table(subset(welfare2, subset=(gender=='male'), select=job))
ggplot(welfare, aes(x=gender, y=code_job)) +
  geom_boxplot()

### 9번. 1번 문제의 결과인 data.frame변수를 이용하여 종교 유무에 따른 이혼률을 분석하시오.
table(is.na(welfare$religion)) # 결측치 없음
boxplot(welfare$religion)$stat # 이상치 없음

welfare$religion <- ifelse(welfare$religion==1, "종교-유","종교-무")
table(welfare$religion)
ggplot(welfare, aes(x=religion)) +
  geom_bar()

marriage_group <- ifelse(welfare$marriage==1, "기혼",
                         ifelse(welfare$marriage==3, "이혼", NA))
ggplot(welfare, aes(x=religion, y=marriage, fill=marriage_group)) +
  geom_col(position = 'dodge')

### 10번. 1번 문제의 결과인 data.frame변수를 이용하여 지역별 연령대 비율을 분석하시오. 
### 노년층이 많은 지역은 어디인지 출력하시오. 
"1. 서울          2. 수도권(인천/경기)    3. 부산/경남/울산   4.대구/경북   
5. 대전/충남   6. 강원/충북               7.광주/전남/전북/제주도"
welfare2 <- welfare
region_group <- ifelse(welfare$code_region==1,"서울",  
                       ifelse(welfare$code_region==2, "수도권(인천/경기)",
                              ifelse(welfare$code_region==3, "부산/경남/울산",
                                     ifelse(welfare$code_region==4, "대구/경북",
                                            ifelse(welfare$code_region==5, "대전/충남",
                                                   ifelse(welfare$code_region==6, "강원/충북",
                                                          ifelse(welfare$code_region==7, "광주/전남/전북/제주도",NA)))))))

welfare2 <- cbind(welfare2, region_group)
head(welfare2)
ggplot(welfare, aes(x=region_group, y=agegrade, fill=agegrade)) +
  geom_col()
ggplot(welfare, aes(x=region_group, y=age)) +
  geom_boxplot(notch=TRUE)