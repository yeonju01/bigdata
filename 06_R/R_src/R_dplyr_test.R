############################################
############## 혼자해보기 (1) ##############
############################################
# Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4
# 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지
# 알아보세요.
names(mpg)

mpg %>% 
  filter(displ<=4) %>% 
  summarise(mean_4=mean(hwy))
mpg %>% 
  filter(displ>=5) %>% 
  summarise(mean_5=mean(hwy))
mpg %>% 
  mutate(group=ifelse(displ<=4, "배기량4이하", ifelse(displ>=5, "배기량5이상", NA))) %>% 
  group_by(group) %>% 
  summarise(mean_total=mean(hwy)) %>% 
  filter(!is.na(group))

# 방법(2) - apply계열 함수 이용 : tapply, by, summaryBy(doBy), aggregate
df <- mpg
df$group <- ifelse(df$displ<=4, "배기량4이하", ifelse(df$displ>=5, "배기량5이상", NA))
table(df$group, useNA = "ifany") # useNA = "ifany"추가시 결측치까지 빈도
head(df)
tapply(df$hwy, df$group, mean)
by(df$hwy, df$group, mean) # 다수개 열일때는 mean은 안되고 summary, sum 등 됨
summaryBy(hwy~group, df, FUN=mean) # 다수개 열과 다수개 함수 가능(NA까지)
aggregate(df$hwy, by=list(df$group), mean) 

# Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota"
# 중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지
# 알아보세요.
mpg %>% 
  filter(manufacturer %in% c('audi','toyota')) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_toyota=mean(cty))

# 방법(2) 
df <- mpg[mpg$manufacturer %in% c("audi", "toyota"),]
head(df)
tapply(df$cty, df$manufacturer, mean)
by(df$cty, df$manufacturer, mean) # 다수개 열 가능
summaryBy(cty~manufacturer, df, FUN=c(mean)) # 다수개 열과 다수개 함수
aggregate(df$cty, by=list(df$manufacturer), mean) #다수개열 가능

# Q3. "chevrolet"
# , "ford", 
# "honda" 자동차의 고속도로 연비 평균을 알아보려고
# 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
mpg %>% 
  group_by(manufacturer) %>%
  filter(manufacturer=='chevrolet' | manufacturer=='ford' | manufacturer=='honda') %>% 
  mutate(tot_hwy = mean(hwy)) %>% 
  summarise(tot = mean(tot_hwy))

cars <- mpg %>% 
  group_by(manufacturer) %>%
  filter(manufacturer=='chevrolet' | manufacturer=='ford' | manufacturer=='honda') %>% 
  summarise(tot = mean(hwy))
cars %>% 
  summarise(hwy_mean=mean(tot))

############################################
############## 혼자해보기 (2) ##############
############################################
# Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에
# 활용하려고 합니다. mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해
# 새로운 데이터를 만드세요. 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어
# 있는지 확인하세요.
head(mpg)
data <- mpg %>% 
  select(class, cty)
head(data)

# 방법(2)
df <- mpg[,c('class', 'cty')]
df <- subset(mpg, select = c('class', 'cty'))

# Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를
# 이용해서 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤
# 자동차의 cty(도시 연비)가 더 높은지 알아보세요.
data %>% 
  filter(class %in% c('suv','compact')) %>% 
  group_by(class) %>%
  summarise(suv_cty = mean(cty))

# 방법(2)
df <- df[df$class %in% c('suv','compact') ,]

tapply(df$cty, df$class, mean) # 결과가 벡터 형태
by(df$cty, df$class, mean)     # 결과가 list 형태
summaryBy(cty~class, df, FUN=mean) # 결과가 데이터프레임 형태
aggregate(df$cty, by=list(df$class), mean) # 결과가 데이터 프레임 형태

# Q3. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지
# 알아보려고 합니다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의
# 데이터를 출력하세요
mpg %>%
  filter(manufacturer=='audi') %>% 
  arrange(desc(hwy)) %>% 
  head(5)

# 방법(2)
head(orderBy(~-hwy, mpg[mpg$manufacturer=='audi',]),5)

df<- mpg[mpg$manufacturer=='audi',]
head(orderBy(~-hwy, df),5)

head(df1[order(df$hwy, decreasing = T),],5)

mpg[order(mpg[mpg$manufacturer=='audi',]$hwy, decreasing = T)[1:5],]
mpg[order(df$hwy, decreasing = T)[1:5],]

# cf."audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다
mpg %>% 
  filter(manufacturer=='audi') %>% 
  group_by(model) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(-mean_hwy)

#(2)방법
df <- subset(mpg, manufacturer=='audi')
sort(round(tapply(df$hwy, df$model, mean),1), decreasing = T) # tapple이용
sort(round(by(df$hwy, df$model, mean),1), decreasing = T)    # by이용
orderBy(~-hwy.mean, summaryBy(hwy~model, data=df))         # summaryBy이용
result <- aggregate(df$hwy, by=list(df$model), mean)    # aggregate 이용
result[order(-result$x),]

############################################
############## 혼자해보기 (3) ##############
############################################
# Q1. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를
# 추가하세요.
mpg2 <- mpg
head(mpg2)  
mpg2 <- mpg2 %>% mutate(tot = cty+hwy)

# Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가세요.
mpg2 <- mpg2 %>% mutate(tot_avg = tot/2)

# Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
mpg2 %>% 
  arrange(desc(tot_avg)) %>% 
  head(3)

# Q4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어
# 출력하세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>% 
  mutate(tot=cty+hwy,
         tot_avg=tot/2) %>% 
  arrange(desc(tot_avg)) %>% 
  head(3)

# (2) 방법
mpg$avg <- (mpg$cty+mpg$hwy)/2
head(orderBy(~-avg, mpg),3)
head(mpg[order(mpg$avg, decreasing = T),],3)

############################################
############## 혼자해보기 (4) ##############
############################################
# Q1. mpg 데이터의 class는 "suv"
# , "compact" 등 자동차를 특징에 따라
# 일곱 종류로 분류한 변수입니다. 어떤 차종의 연비가 높은지 비교해보려고 합니다. 
# class별 cty 평균을 구해보세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))

# Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤
# 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로
# 정렬해 출력하세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

# (2) 방법
sort(tapply(mpg$cty, mpg$class, mean), decreasing = T)
sort(by(mpg$cty, mpg$class, mean), decreasing = T)
orderBy(~-cty.mean, summaryBy(cty~class, mpg))
orderBy(~-x, aggregate(mpg$cty, by=list(mpg$class), mean))
result <- aggregate(mpg$cty, by=list(mpg$class), mean)
result[order(result$x, decreasing = T),]

# Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. 
# hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# (2) 방법
sort(tapply(mpg$hwy, mpg$manufacturer, mean), decreasing = T)[1:3]
sort(by(mpg$hwy, mpg$manufacturer, mean), decreasing = T)[1:3]
orderBy(~-hwy.mean, summaryBy(hwy~manufacturer, mpg, FUN=mean))[1:3,]
result <-aggregate(mpg$hwy, by=list(mpg$manufacturer), mean)
result # result가 data.frame형태
head(result[order(result$x, decreasing = T),] , 3)
result[order(result$x, decreasing = T),][1:3,]
result[order(-result$x),][1:3,]
head(orderBy(~-x, result), 3)

# Q4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고
# 합니다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요
mpg %>% 
  filter (class=='compact') %>% 
  group_by(manufacturer) %>% 
  summarise(cnt = n()) %>% 
  arrange(desc(cnt))

# (2) 방법
sort(table(mpg[mpg$class=='compact',]$manufacturer), decreasing = T)
# (3) 방법
df <- mpg[mpg$class=='compact',]
df <- subset(mpg, mpg$class=='compact')
df <- subset(mpg, class=='compact')
df
sort(table(df$manufacturer), decreasing = T)

############################################
############## 혼자해보기 (5) ##############
############################################
mpg$fl
dim(mpg)
fuel <- data.frame(fl=c('c','d','e','p','r'), 
                   kind=c('CNG','diesel','ethanol E85','premium','regular'),
                   price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22))
fuel

# Q1. mpg 데이터에는 연료 종류를 나타낸 fl 변수는 있지만 연료
# 가격을 나타낸 변수는 없습니다. 위에서 만든 fuel 데이터를 이용해서
# mpg 데이터에 price_fl(연료 가격) 변수를 추가하세요.
# (1)방법
(mpg <- left_join(mpg, fuel[,c('fl','price_fl')], by='fl'))

# (2)방법
data(mpg, package="ggplot2")
(mpg <- merge(mpg, fuel[,c('fl','price_fl')], by='fl'))

# Q2. 연료 가격 변수가 잘 추가됐는지 확인하기 위해서 model, fl, 
# price_fl 변수를 추출해 앞부분 5행을 출력해 보세요
mpg %>% 
  select('model','fl','price_fl')%>% 
  head(5)
mpg[1:5, c('model','fl','price_fl')]
subset(mpg, select=c('model','fl','price_fl'))[1:5,]
head(subset(mpg, select=c('model','fl','price_fl')),5)

# Q3. mpg에 kind 변수도 추가
fuel
mpg <- left_join(mpg, fuel[,c('fl','kind')], by='fl')
mpg

# (2)방법 : apply이용하여 kind변수 추가
data(mpg, package="ggplot2") # 다시 mpg가져옴
fuel[fuel$fl=='p','kind']

flTokind <- function(fl){
  kind <- fuel[fuel$fl==fl, 'kind']
  return(kind)
}
flTokind('c')
mpg$kind <- apply(mpg[, 'fl', drop=FALSE], 1, flTokind)
mpg

############################################
############## 혼자해보기 (6) ##############
############################################
data(mpg, package = "ggplot2")
mpg[c(10, 14, 58, 93), "drv"] <- "k" # drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42) # cty 이상치 할당

# Q1. drv에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 다음
# 이상치가 사라졌는지 확인하세요. 결측 처리 할 때는 %in% 기호를
# 활용하세요.
sum(is.na(mpg$drv))
mpg <- mpg %>% 
  mutate(drv = ifelse(mpg$drv %in% c('k'), NA, mpg$drv))
colSums(is.na(mpg))

# Q2. 상자 그림을 이용해서 cty에 이상치가 있는지 확인하세요. 상자
# 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시
# 상자 그림을 만들어 이상치가 사라졌는지 확인하세요.
result <- boxplot(mpg$cty)$stats
mpg$cty[mpg$cty>result[5]]
mpg$cty[mpg$cty<result[1]]

mpg <- mpg %>% 
  mutate(
    cty = ifelse(mpg$cty<result[1] | mpg$cty>result[5], NA, mpg$cty)
  )
colSums(is.na(mpg))
sum(is.na(mpg$cty))

# Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 이상
# 치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보세요. 하나
# 의 dplyr 구문으로 만들어야 합니다.
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty))
  
  