# flightsDF 데이터프레임에 대해 작성 제출
# 1. origin이 JFK이고 month가 5월인 모든 행을 resul에 얻는다
resul <- subset(flightDF, subset = c(origin=='JFK' & month==5))
# 방법(2) 데이터테이블사용
resul <- flights[origin=='JFK' & month==5]
resul

# 2. 처음 두 행을 resul에 얻는다
resul <- head(flightDF, 2)
# 방법(2) 데이터테이블사용
resul <- flights[1:2]
resul

# 3. origin으로 오름차순, dest로 내림차순으로 정렬하여 출력(order사용)
flightDF[order(flightDF$origin),]
flightDF[order(flightDF$dest, decreasing = T),]
library(dplyr)
flightDF[order(flightDF$origin, desc(flightDF$dest)),]
# 방법(2) 데이터테이블사용
flights[order(flights$origin, -flights$dest)]
flights[order(origin, -dest)]

# 4. arr_delay열만 출력
flightDF[,7] #벡터
flightDF[,'arr_delay', drop=F] #데이터프레임
# 방법(2) 데이터테이블사용
flights[,arr_delay] #벡터
flights[, .(arr_delay)] #데이터프레임(데이터테이블)형태로 출력
flights[, c('arr_delay')] #데이터프레임
flights[, c(arr_delay)] #벡터
flights[, list(arr_delay)] #데이터프레임

# 5. year열부터 dep_time열까지 출력
colnames(flightDF)
flightDF[,1:4]
subset(flightDF, select=1:4)
# 방법(2) 데이터테이블사용
flights[, year:dep_time]
subset(flights, select=c(year:dep_time))

# 6. year열과 dep_time열 출력
flightDF[,c('year','dep_time')]
# 방법(2) 데이터테이블사용
flights[,c(year,dep_time)] #행렬로 출력
flights[,list(year,dep_time)] #데이터프레임
flights[, .(년도=year, 실제출발=dep_time)] #추천(출력시 header(변수) 변경가능)

# 7. arr_delay열과 dep_delay열을 출력하되 열이름을 delay_arr과 delay_dep로 변경
head(flightDF[,c('arr_delay','dep_delay')])
library(dplyr)
rename(flightDF, c(delay_arr=arr_delay, delay_dep=dep_delay))
# 방법(2) 데이터테이블사용
flights[, .(delay_arr=arr_delay, delay_dep=dep_delay)]

# 8. 지연시간(arr_delay, dep_delay모두 0미만인 비행이 몇 번인지 출력
NROW(flightDF[flightDF$arr_delay<0 & flightDF$dep_delay<0,])
NROW(subset(flightDF, subset = c(arr_delay<0 & dep_delay<0)))
# 방법(2) 데이터테이블사용
flights[arr_delay<0 & dep_delay<0, .(cnt=.N)] # .N : 갯수
flights[, sum(arr_delay<0 & dep_delay<0)]

# 8-1 지연시간의 합이 0미만인 비행이 몇 번인지 출력
NROW(flightDF[flightDF$arr_delay+flightDF$dep_delay<0,])
NROW(subset(flightDF, subset = c(arr_delay+dep_delay<0)))
# 방법(2) 데이터테이블사용
flights[arr_delay+dep_delay<0, .(.N)]
flights[arr_delay+dep_delay<0, .N]

# 9. 6월에 출발 공항이 JFK인 모든 항공편의 도착지연 및 출발지연 시간의 평균을 계산
arr <- subset(flightDF, subset=(month==6 & origin=='JFK'), select=c(arr_delay, dep_delay))
str(arr)
arr.avg <- apply(arr, 2, mean)
arr.avg
# 방법(2) 데이터테이블사용
flights[origin=='JFK' & month==6, .(mean(arr_delay), mean(dep_delay))]

# 10. 9번의 결과에 title에 mean_arr, mean_dep로 출력
names(arr.avg) <- c('mean_arr','mean_dep')
arr.avg
# 방법(2) 데이터테이블사용
flights[origin=='JFK' & month==6, .(mean_arr = mean(arr_delay), mean_dep = mean(dep_delay))]

# 11. JFK 공항의 6월 운항 횟수
NROW(flightDF[flightDF$origin=='JFK' & flightDF$month==6,])
NROW(subset(flightDF, subset = (month==6 & origin=='JFK')))
NROW(subset(flightDF, month==6 & origin=='JFK'))
# 방법(2) 데이터테이블사용
flights[origin=='JFK' & month==6, .N]

# 12. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 출력
subset(flightDF, subset = (month==6 & origin=='JFK'), select = c(arr_delay,dep_delay))
# 방법(2) 데이터테이블사용
flights[origin=='JFK' & month==6, .(arr_delay,dep_delay)] #추천
flights[origin=='JFK' & month==6, list(arr_delay,dep_delay)]
flights[origin=='JFK' & month==6, c('arr_delay','dep_delay')]

# 13. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 제외한 모든 열 출력
subset(flightDF, subset = (month==6 & origin=='JFK'), select = -c(5,7))
subset(flightDF, subset = (month==6 & origin=='JFK'), select = -c(arr_delay,dep_delay)) #불가
# 방법(2) 데이터테이블사용
flights[origin=='JFK' & month==6, -c('arr_delay','dep_delay')]

# 14. 출발 공항(origin)별 비행 수 출력 (JFK 81483 LGA 84433 EWR 87400)
table(flightDF$origin)
NROW(subset(flightDF, flightDF$origin=='JFK'))
NROW(subset(flightDF, flightDF$origin=='LGA'))
NROW(subset(flightDF, flightDF$origin=='EWR'))
# 방법(2) 데이터테이블사용
flights[, .(.N), by=.(origin)]
flights[, .N, by=origin]

# 15. 항공사코드(carrier)가 AA에 대해 출발공항별 비행횟수 계산
NROW(subset(flightDF, subset = (carrier=='AA' & flightDF$origin=='JFK')))
NROW(subset(flightDF, subset = (carrier=='AA' & flightDF$origin=='LGA')))
NROW(subset(flightDF, subset = (carrier=='AA' & flightDF$origin=='EWR')))
# 방법(2) 데이터테이블사용
flights[carrier=='AA', .N, by=origin]

# 16. origin, dest별로 비행횟수 출력
head(flightDF)
table(flightDF$origin, flightDF$dest)
tapply(flightDF$origin, flightDF$origin, length)
tapply(flightDF$dest, flightDF$dest, length)
# 방법(2) 데이터테이블사용
flights[, .(.N), by=.(origin,dest)]

# 17. 항공사코드(carrier)가 AA에 대해 origin, dest별로 비행횟수 출력
temp <- flightDF[flightDF$carrier=='AA',]
table(temp$origin, temp$dest)
# 방법(2) 데이터테이블사용
flights[carrier=='AA', .(.N), by=.(origin, dest)]

# 18. 항공사 코드가 AA에 대해, origin, dest, 월별 평균arr_delay, 평균 dep_delay 출력
library(doBy)
temp <- flightDF[flightDF$carrier=='AA',]
summaryBy(arr_delay+dep_delay~origin+dest+month, data=temp, FUN=mean)
aggregate(temp[,c('arr_delay','dep_delay')], 
          by=list(temp$origin,temp$dest, temp$month),
          FUN=mean)
# 방법(2) 데이터테이블사용
flights[carrier=='AA', .(mean_arr=mean(arr_delay), mean_dep=mean(dep_delay)), by=.(origin, dest)]

# 19. dep_delay>0가 참이거나 거짓, arr_delay>0가 참이거나 거짓인 각각의 비행횟수
table(flightDF$dep_delay>0, flightDF$arr_delay>0)
# 방법(2) 데이터테이블사용
flights[, .(.N), by=.(dep_delay>0, arr_delay>0)]

# 20. Origin==“JFK”에 대해 월별 최대 출발 지연 시간 출력(month로 정렬)
jfk <- subset(flightDF, subset = (flightDF$origin=='JFK'))
result <- aggregate(jfk$dep_delay, by=list(jfk$month), max)
result[order(result$Group.1),]
result <- summaryBy(dep_delay ~ month, data=temp, FUN=max)
result[order(result$month),]
# 지연시간순 정렬
sort(tapply(temp$dep_delay, temp$month, max))
# 방법(2) 데이터테이블사용
flights[origin=='JFK', .(max=max(dep_delay)), by=.(month)]
