################## 총괄 연습문제 ################## 
# 1. iris 데이터를 사용하여 data.frame의 특성을 살펴봅니다.
# 1) 행과 열에 대한 다양한 참조방식을  사용하여 데이터를 조회
#     iris 데이터의 차원확인, 컬럼이름확인, 구조확인, 속성들
class(iris)
names(iris)
str(iris)
summary(iris)

# 2) 행과 열 정보를 조회
#     iris의 요약통계 정보
#     꽃받침의 길이(Sepal.Length)처음 10개 조회
summary(iris)
iris[1:10, 1, drop=F]

# 3) 부분 데이터셋 추출
# virginica종만 virginica 변수에 추출
# setosa종만 setosa 변수에 추출
virginica <- subset(iris, subset=Species=="virginica")
virginica
setosa <-  subset(iris, subset=Species=="setosa")
setosa

# 4) 추출한 부분 데이터셋(virginica와 setosa)을 다시 결합해 봅니다.
newIris <- rbind(virginica, setosa)
newIris

#2. setosa종의 꽃 받침(Sepal)의 폭과 길이부분 데이터셋을 추출
subset(iris, subset=(Species=="setosa"), select=c(Sepal.Width ,Sepal.Length))

#3. 작업내용에 따른 급여가 차등 지급됩니다.(행렬 문제)
# A작업은 시급 12000원, B작업은시급 26000원, C작업은 시급 18000원 입니다.
# 두 사람이 각 작업을 수행하는 데 있어서 실제 작업한 시간이 작업 내역에 따라 다릅니다. 갑은
# A작업을 5시간, B작업을4시간, C작업을 9시간
# 그리고 을은A작업을 7시간, B작업을3시간, C작업을 2시간 작업 했습니다.
# 갑과 을의 급여를 계산하세요

#힌트 : 행렬 두 개, 작업당 급여를 저장하는행렬, 근무자들이근무한시간
#행렬의 곱은 %*% 를이용한다.
# 계산한 갑과 을의 급여는 각각 326000원, 198000원 입니다
pay <- matrix(c(12000, 26000, 18000), ncol=3, dimnames = list(c('급여'),c('A작업','B작업','C작업')))
time <- matrix(c(c(5, 4, 9),c(7, 3, 2)), ncol=2, dimnames = list(c('A작업','B작업','C작업'),c('갑','을')))
pay
time
timePay <- pay %*% time
timePay