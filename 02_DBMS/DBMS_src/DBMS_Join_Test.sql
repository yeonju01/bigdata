-- �� �������� PART1
--1. �̸�, ���ӻ��
SELECT W.ENAME WORKER, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
--2. �̸�, �޿�, ����, ���ӻ��
SELECT W.ENAME WORKER, W.SAL, W.JOB, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
SELECT W.ENAME WORKER, W.SAL, W.JOB, NVL(M.ENAME, '����') MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
--4. �̸�, �޿�, �μ���, ���ӻ���
SELECT W.ENAME WORKER, W.SAL, D.DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.MGR = M.EMPNO AND
    D.DEPTNO = W.DEPTNO;
--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT W.ENAME WORKER, W.SAL, D.DEPTNO, D.DNAME, D.LOC, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.MGR = M.EMPNO(+) AND
    D.DEPTNO = W.DEPTNO;
--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT W.ENAME, W.SAL, S.GRADE, D.DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D, SALGRADE S
    WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.MGR = M.EMPNO AND W.SAL >= 2000;
--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT W.ENAME, W.SAL, S.GRADE, D.DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D, SALGRADE S
    WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.MGR = M.EMPNO(+);
--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT W.ENAME, W.SAL, S.GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0)*12) ANNUAL_SAL,  M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D, SALGRADE S
    WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.MGR = M.EMPNO;
--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME, W.SAL, S.GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0)*12) ANNUAL_SAL,  M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D, SALGRADE S
    WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.MGR = M.EMPNO
    ORDER BY D.DNAME, W.SAL DESC;
    
    
-- �� �� �������� PART2
--1.EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, D.DEPTNO, D.DNAME
    FROM EMP, DEPT D;
--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT ENAME, JOB, SAL, D.DNAME
    FROM EMP, DEPT D WHERE D.LOC = 'NEW YORK';
--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, D.DNAME, D.LOC
    FROM EMP, DEPT D WHERE NOT COMM IS NULL;
--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, D.DNAME, D.LOC
    FROM EMP, DEPT D WHERE ENAME LIKE '%L%L%';
--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, D.DEPTNO, D.DNAME
    FROM EMP, DEPT D 
    ORDER BY ENAME;
--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, D.DNAME
    FROM EMP, DEPT D 
    WHERE SAL >= 2000
    ORDER BY SAL DESC;
--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
    -- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, D.DNAME
    FROM EMP, DEPT D 
    WHERE SAL >= 2500 AND JOB = 'MANAGER'
    ORDER BY EMPNO;
--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, DEPT D, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT  W.ENAME, NVL(M.ENAME, '����') MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT  W.ENAME, NVL(M.ENAME, '����') MANAGER, NVL(MM.ENAME, '����') MANAGER2
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO AND M.MGR = MM.EMPNO;
--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT  W.ENAME, NVL(M.ENAME, '����') MANAGER, NVL(MM.ENAME, '����') MANAGER2
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO(+) AND M.MGR = MM.EMPNO(+);
    
    
    
    
    