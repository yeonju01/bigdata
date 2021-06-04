SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
-- �� �� ��������
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
--2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
--3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO  FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP);
--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME  FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
    AND SAL <= (SELECT AVG(SAL) FROM EMP);
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE
    WHERE SAL >= LOSAL AND SAL <=HISAL
    AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');
--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME FROM EMP E, DEPT D, SALGRADE
    WHERE SAL >= LOSAL AND SAL <=HISAL
    AND E.DEPTNO = D.DEPTNO
    AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT')
    ORDER BY SAL DESC;
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP);
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME= 'CLARK')
    AND SAL >= (SELECT SAL FROM EMP WHERE DEPTNO = '7698');
--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP, DEPT
    WHERE E.DEPTNO = D.DEPTNO
    AND DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND ENAME= 'CLARK')
    AND SAL >= (SELECT SAL FROM EMP WHERE DEPTNO = '7698');
--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE FROM EMP
    WHERE DEPTNO = (SELECT E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND ENAME= 'BLAKE')
    AND ENAME <>'BLAKE'; 
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME  FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;
    
    
    
    
    
    
    