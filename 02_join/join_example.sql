DROP DATABASE IF EXISTS employees;
CREATE DATABASE IF NOT EXISTS employees;
USE employees;

DROP TABLE IF EXISTS departments,
employees;

CREATE TABLE employees (
  emp_no     INT             NOT NULL,
  birth_date DATE            NOT NULL,
  first_name VARCHAR(14)     NOT NULL,
  last_name  VARCHAR(16)     NOT NULL,
  gender     ENUM ('M', 'F') NOT NULL,
  hire_date  DATE            NOT NULL,
  dept_no    CHAR(4),
  PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
  dept_no   CHAR(4)     NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE KEY (dept_name)
);

CREATE TABLE table1 (
  a CHAR(4),
  n INT
);

CREATE TABLE table2 (
  b CHAR(4),
  n INT
);

INSERT INTO `table1` VALUES ('a1', 1),
  ('a2', 2),
  ('a3', 3);

INSERT INTO `table2` VALUES ('b1', 2),
  ('b2', 4),
  ('b3', 5);


INSERT INTO `employees` VALUES (10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26', 'd001'),
  (10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21', 'd002'),
  (10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28', 'd002'),
  (10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01', 'd003'),
  (10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12', 'd004'),
  (10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02', NULL),
  (10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10', NULL);

INSERT INTO `departments` VALUES
  ('d001', 'Marketing'),
  ('d002', 'Finance'),
  ('d003', 'Human Resources'),
  ('d004', 'Production'),
  ('d005', 'Development');

-- 조인 (JOIN)
-- 교차 조인 (CROSS JOIN)

# 명시적 표현법 (explicit notation)
SELECT *
FROM employees
  CROSS JOIN departments;

# 암묵적 표현법 (implicit notation)
SELECT *
FROM employees, departments;

-- 내부 조인 (INNER JOIN)

# 명시적 표현법 (explicit notation)
SELECT *
FROM employees
  INNER JOIN departments
    ON employees.dept_no = departments.dept_no;

# 암묵적 표현법 (implicit notation)
SELECT *
FROM employees, departments
WHERE employees.dept_no = departments.dept_no;

-- 비등가 조인 (NON-EQUI JOIN)

# 암묵적 표현법 (implicit notation)
SELECT *
FROM employees, departments
WHERE employees.emp_no between 10003 and 10004;

-- 자연 조인 (NATURAL JOIN)
# 명시적 표현법 (explicit notation)
SELECT *
FROM employees
  NATURAL JOIN departments;

-- 왼쪽 외부 조인 (LEFT OUTER JOIN)
# 명시적 표현법 (explicit notation)
SELECT *
FROM table1
  LEFT OUTER JOIN table2
    ON table1.n = table2.n;

# 명시적 표현법 (explicit notation)
SELECT *
FROM employees
  LEFT OUTER JOIN departments
    ON employees.dept_no = departments.dept_no;

-- 오른쪽 외부 조인 (RIGHT OUTER JOIN)
# 명시적 표현법 (explicit notation)
SELECT *
FROM table1
  RIGHT OUTER JOIN table2
    ON table1.n = table2.n;

SELECT *
FROM employees
  RIGHT OUTER JOIN departments
    ON employees.dept_no = departments.dept_no;

-- 완전 외부 조인 (FULL OUTER JOIN)
# MySql에서는 명시적인 FULL OUTER JOIN을 지원하지 않음

# 방법1 : JOIN와 UINION
# https://www.xaprb.com/blog/2006/05/26/how-to-write-full-outer-join-in-mysql/
SELECT *
FROM table1
  LEFT OUTER JOIN table2
    ON table1.n = table2.n
UNION
SELECT *
FROM table1
  RIGHT OUTER JOIN table2
    ON table1.n = table2.n;

# 방법2 : UNION ALL and exclusion join
SELECT *
FROM table1
  LEFT OUTER JOIN table2
    ON table1.n = table2.n
UNION ALL
SELECT *
FROM table1
  RIGHT OUTER JOIN table2
    ON table1.n = table2.n
WHERE table1.n IS null;


SELECT *
FROM employees
  LEFT OUTER JOIN departments
    ON employees.dept_no = departments.dept_no
UNION
SELECT *
FROM employees
  RIGHT OUTER JOIN departments
    ON employees.dept_no = departments.dept_no;

-- 셀프 조인(SELF JOIN)
# 암묵적 표현법 (implicit notation)
SELECT
  A.first_name AS EmployeeName1,
  B.first_name AS EmployeeName2,
  A.dept_no
FROM employees AS A, employees AS B
WHERE A.emp_no <> B.emp_no
      AND A.dept_no = B.dept_no;

-- 안티 조인 (ANTI JOIN)
# dept_no 2이상인 부서가 아니고 emp_no이 10002이상인 임직원은
SELECT *
FROM employees AS e
WHERE emp_no >= 10002
      AND NOT EXISTS(SELECT *
                     FROM departments AS d
                     WHERE e.dept_no = d.dept_no
                           AND d.dept_no >= 2);

# employee 테이블에서 dept_no가 null이 아닌 임직원 목록을 추출하기

# NOT EXISTS 사용
# todo: 작성중 - 정확하게 NOT IN과 NOT EXISTS의 차이점을 알아야함

# SELECT d.dept_name
# FROM departments AS d
# WHERE NOT EXISTS(SELECT *
#                  FROM employees as e
#                  WHERE e.dept_no = d.dept_no
#                        AND e.dept_no IS NULL);

# NOT IN
SELECT DISTINCT d.dept_name
FROM employees AS e, departments as d
WHERE e.dept_no = d.dept_no
      AND e.emp_no NOT IN (SELECT e.emp_no
                           FROM employees AS e
                           WHERE e.dept_no IS NULL);

-- 세미 조인 (SEMI JOIN)
# EXISTS 사용
SELECT *
FROM departments as d
WHERE EXISTS(SELECT *
             FROM employees AS e
             WHERE e.dept_no = d.dept_no
                   AND e.emp_no >= 10003);

# IN 사용
SELECT *
FROM departments as d
WHERE d.dept_no IN (SELECT e.dept_no
                    FROM employees AS e
                    WHERE e.emp_no >= 10003);
