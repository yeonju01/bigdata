-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT ENAME FROM EMP WHERE ENAME LIKE '%I%';
SELECT  EMPNO, ENAME, SAL FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%I%')
    ORDER BY EMPNO;
-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS';
SELECT ENAME, JOB, SAL FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�
SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
SELECT ENAME, SAL 
    FROM EMP
    WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
-- 17. SALES�μ� ����� �̸�, ����
SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES';
SELECT ENAME, JOB FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);
SELECT * FROM EMP
    WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ����
SELECT ENAME, JOB FROM EMP
    WHERE DEPTNO = 10 
    AND JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);
-- 20.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'FORD')
    AND SAL IN (SELECT SAL FROM EMP WHERE ENAME = 'FORD');
    
-- 21. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT ENAME, JOB, DEPTNO, SAL FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'JONES')
    OR SAL >= ALL(SELECT SAL FROM EMP WHERE ENAME = 'FORD')
    ORDER BY JOB, SAL DESC;
-- 22. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�
SELECT ENAME, JOB, SAL FROM EMP
    WHERE SAL = (SELECT SAL FROM EMP WHERE ENAME = 'WARD')
    OR SAL = (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT');
-- 23. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT JOB 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND LOC = 'CHICAGO';
SELECT ENAME, JOB FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D
                WHERE E.DEPTNO = D.DEPTNO 
                AND LOC = 'CHICAGO');
-- 24. �μ����� ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL > ALL(SELECT ROUND(AVG(SAL)) FROM EMP E, DEPT D 
                   WHERE E.DEPTNO = D.DEPTNO GROUP BY DNAME);
-- 25. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL < ALL(SELECT ROUND(AVG(SAL)) FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO GROUP BY DNAME);
-- 26. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP MANAGER
    WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR)
    ORDER BY DEPTNO;
-- 27.  ���� ����� ���, �̸�, ����, �μ���ȣ
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP MANAGER
    WHERE NOT EXISTS(SELECT *FROM EMP WHERE MANAGER.EMPNO = MGR);














