-- ★ <셤 연습문제>
--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000;
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7788;
--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE (SAL*12+NVL(COMM, 0)) >= 24000 ORDER BY SAL DESC;
--4.	EMP 테이블에서 hiredate가 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 
--ename,job,hiredate을 출력하는 SELECT 문장을 작성 (단 hiredate 순으로 출력)
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01'ORDER BY HIREDATE ASC;
--5.	EMP 테이블에서 deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * FROM EMP WHERE DEPTNO IN (10, 20) ORDER BY ENAME ASC;
--6.	EMP 테이블에서 sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME "employee", SAL "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN (10, 30);
--7.	EMP 테이블에서 hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * FROM EMP WHERE HIREDATE LIKE '82/%';
--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME, SAL FROM EMP WHERE ENAME BETWEEN 'C' AND 'Q'ORDER BY ENAME ASC;
--9.	EMP 테이블에서 comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > SAL+SAL/10;
--10.	EMP 테이블에서 job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB = 'ANALYST' AND SAL NOT IN (1000, 3000, 5000);
--11.	EMP 테이블에서 ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%'AND DEPTNO = 30 OR MGR = 7782;
--12.	사원 테이블에서 입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE LIKE '81/%';
--13.	사원 테이블에서 입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE LIKE '81/%' AND JOB = 'SALESMAN';
--14.	사원 테이블의 사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP ORDER BY SAL DESC, HIREDATE;
--15.	사원 테이블에서 사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '__N%';
--16.	사원 테이블에서연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, SAL*12 "연봉" FROM EMP WHERE SAL*12 >= 35000;
