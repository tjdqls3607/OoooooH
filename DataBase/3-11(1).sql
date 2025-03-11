-- hr 스키마
-- 집계 처리 
-- 1. partition by
-- 전체 사원 리스트
select * from employees;
-- 전체 사원의 평균 급여
select avg(salary) from employees; -- 1 row ( 6461.682243 )
-- 부서별 평균 급여
select department_id, avg(salary) from employees group by department_id; -- null 포함 부서수만큼 row 
-- 전체 사원의 리스트를 뽑되, 컬럼은 employee_id, department_id, 부서별 평균 급여
-- #1 inline-view ( null )
select e.employee_id, e.department_id, das.avg_salary
  from employees e,
          ( select department_id, avg(salary) avg_salary from employees group by department_id ) das
 where e.department_id = das.department_id;
 
 -- #2 scalar
 select e.employee_id, e.department_id,
           ( select avg(ee.salary) from employees ee where ee.department_id = e.department_id) avg_salary
  from employees e;
 
 -- #3 partition by
 select employee_id, department_id, avg(salary) over ( partition by department_id ) avg_salary
   from employees;
-- partition by department_id, job_id   
 select employee_id, department_id, job_id, avg(salary) over ( partition by department_id, job_id ) avg_salary
   from employees
   order by department_id, job_id;
-- 2. group_concat()
-- row => column concat
select first_name from employees limit 5; -- 5개의 row 로 출력
-- comma 가 default 구분자
select group_concat(e.first_name) from (select first_name from employees limit 5) e; -- Steven,Neena,Lex,Alexander,Bruce
select group_concat(e.first_name separator '|') from (select first_name from employees limit 5) e; -- Steven|,Neena|,Lex|,Alexander|,Bruce|
-- 3. rollup
-- 소계
select job_id, sum(salary) from employees group by job_id;
select job_id, sum(salary) from employees group by job_id with rollup;
select department_id, job_id, sum(salary) from employees group by department_id, job_id;
select department_id, job_id, sum(salary) from employees group by department_id, job_id with rollup;