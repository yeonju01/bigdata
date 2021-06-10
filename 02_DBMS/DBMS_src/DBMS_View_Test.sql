<�� ��������>
-- 1. �μ���� ������� ����ϴ� �뵵�� ��, DNAME_ENAME_VU �� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW DNAME_ENAME_VU
    AS SELECT DNAME, ENAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
SELECT * FROM DNAME_ENAME_VU;

-- 2. ������ ���ӻ������ ����ϴ� �뵵�� ��,  WORKER_MANAGER_VU�� �ۼ��Ͻÿ�
SELECT W.ENAME, M.ENAME FROM EMP W, EMP M WHERE M.EMPNO = W.MGR;
CREATE OR REPLACE VIEW WORKER_MANAGER_VU
    AS SELECT W.ENAME WORKER, M.ENAME  MANAGER
    FROM EMP W, EMP M WHERE M.EMPNO = W.MGR;
SELECT * FROM WORKER_MANAGER_VU;

-- 3. �μ��� �޿��հ� ����� ����Ͻÿ�(�μ���ȣ, �޿��հ�, ���). ? ģ������
SELECT DEPTNO, SUM(SAL) SUMSAL FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUMSAL, ROWNUM RANK FROM(SELECT DEPTNO, SUM(SAL) SUMSAL FROM EMP GROUP BY DEPTNO); 
-- 3-1. �μ��� �޿��հ� ����� 2~3���� �μ���ȣ, �޿��հ�, ����� ����Ͻÿ�.
SELECT DEPTNO, SUMSAL, RANK
    FROM(SELECT DEPTNO, SUMSAL, ROWNUM RANK FROM(SELECT DEPTNO, SUM(SAL) SUMSAL FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC))
    WHERE RANK BETWEEN 2 AND 3;
    
-- 4. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� ������ �����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;
-- 5. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� 5���� ����Ͻÿ�
SELECT ENAME FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC)
    WHERE ROWNUM <= 5;
-- 6. ��� ���̺��� ���, �����, �Ի����� �ֽź��� ������ ������ 6��°�� ���� ������� 10��° ������� ���
SELECT ROWNUM, RN, ENAME
    FROM(SELECT ROWNUM RN, ENAME FROM(SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC))
    WHERE RN BETWEEN 6 AND 10;
    
    
    
