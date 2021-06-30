## 데이터 프레임의 부분 데이터 조회

student[1,1] # 1행1열

student[1,'id'] # 1행'id'열

student[1, ] # 1행 모든 열 데이터

student[, 1] # 모든 행의 1열 데이터(벡터형태로 변환)
student[, 1, drop=F] # 모든 행의 1열 데이터(데이터 프레임 형태로 반환)

student[1:3, ] # 1~3행까지의 모든 열 데이터

student[, 2:5] # 모든 행의 2,3,4,5열 데이터
student[, c(2,3,4,5)] # 모든 행의 2,3,4,5열 데이터
names(student)
student[, c("name","kor","eng","gender")] # 모든 행의 2,3,4,5열 데이터

student[-c(2,4,6), ] # 2,4,6행외의 모든 데이터
student[c(-2,-4,-6), ] # 2,4,6행외의 모든 데이터

student[1:3, -c(1,5)] # 1~3행 데이터에서 1열과 5열을 제외한 데이터
student[1:3, c(-1,-5)] # 1~3행 데이터에서 1열과 5열을 제외한 데이터
student[seq(1,3), c(-1,-5)] # 1~3행 데이터에서 1열과 5열을 제외한 데이터]

student[student$kor>=90, ] # kor점수가 90점 이상인 모든 열 데이터

student[student$kor>=90, c('name','kor')] # kor점수가 90점 이상인 사람의 이름과 kor데이터


##subset 문제

# 1. 직원이름만 (벡터형식, 데이터프레임형식)
emp$ename
emp[, 2]
emp[, 2, drop=F]
emp[, 'ename']
emp[, 'ename', drop=F]
subset(emp, select='ename', drop=T)
subset(emp, select='ename')

# 2. 직원이름, job, sal
emp[, c('ename','job','sal')]
subset(emp, select=c('ename','job','sal'))

# 3. 이름이 KING인 직원의 empno, job, hiredate, sal
subset(emp, subset=(ename=='KING'), select=c('empno','job','hiredate','sal'))
emp[emp$ename=='KING', c('empno','job','hiredate','sal')]

# 4. sal이 2000~3000사이인 직원의 ename, sal
subset(emp, subset=(sal>=2000 & sal <=3000), select=c('ename','sal'))
emp[emp$sal>=2000 & emp$sal<=3000, c('ename','sal')]