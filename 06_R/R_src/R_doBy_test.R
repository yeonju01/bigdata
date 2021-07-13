#문. emp.csv 파일의 데이터를 받아, 부서별 급여와 상여금 비교하시오
# na.rm=TRUE 결측치를 빼고 함수를 적용
emp <- read.csv(file='inData/emp.csv', header = T)
emp
emp[, , drop=F]
str(emp)
emp$deptno <- factor(emp$deptno, levels=seq(10,40,10))
levels(emp$deptno)

summaryBy(sal+comm ~ deptno, emp, FUN=c(mean,sd))
summaryBy(sal+comm ~ deptno, emp, FUN=c(mean,sd), na.rm=TRUE)

#문. emp.csv 파일의 데이터를 받아, 부서별, job별 급여와 상여금 비교(mean,sd)하시오
str(emp)
emp$job <- as.factor(emp$job)

summaryBy(sal+comm ~ deptno+job, emp, FUN=c(mean,sd), na.rm=TRUE)

# 문1. emp데이터셋에서 월급이 적은 순으로 ename, sal 추출
orderBy(~sal, data=emp)[, c('ename','sal')]

# 문2. emp데이터셋에서 월급이 적은 순으로 5명만 ename, sal 추출 
orderBy(~sal, data=emp)[1:5, c('ename','sal')]
emp.sal <- orderBy(~sal, data=emp)[, c('ename','sal')]
head(emp.sal, 5)


## order()
# 문1. emp데이터셋에서 월급이 많은 순으로 ename, sal을 추출
order(emp$sal, decreasing = T)
emp[order(emp$sal, decreasing = T), c('ename','sal')]

# 문2. emp데이터셋에서 월급이 많은 5명의 ename, sal을 추출
emp.sal1 <- emp[order(emp$sal, decreasing = T), c('ename','sal')]
head(emp.sal1, 5)

# 문3. emp데이터셋에서 월급이 적은 5명의 ename, sal을 추출
emp.sal2 <- emp[order(emp$sal, decreasing = F), c('ename','sal')]
head(emp.sal2, 5)
