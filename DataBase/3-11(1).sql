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





create table group_code(
    group_code char(3) not null,
    group_code_name varchar(50) not null,
    primary key(group_code)
);
create table code(
    group_code char(3) not null,
    code char(3) not null,
    code_name varchar(50) not null,
    use_yn char(1) null,
    primary key (group_code, code)
);



-- 공통코드 테이블을 2개로 분리, 그룹(대분류) 을 표현하는 테이블과 코드ㅍ 및 코드값을 포현하는 테이블 2개로 나눈 방식
create table group_code( -- 회원구분, 회원상태, .......
    group_code char(3) not null,  -- 
    group_code_name varchar(50) not null,
    primary key(group_code)
);
create table code( -- 회원구분의 일반회원, 준회원, .......
    group_code char(3) not null,
    code char(3) not null,
    code_name varchar(50) not null,
    use_yn char(1) null,
    primary key (group_code, code)
);
insert into group_code values ( '001', '회원구분');
insert into group_code values ( '002', '회원상태');
insert into group_code values ( '003', '주문상태');
-- 회원구분 공통코드
insert into code values ('001', '010', '일반회원', 'Y');
insert into code values ('001', '020', '준회원', 'Y');
-- insert into code values ('001', '001', '일반회원', 'Y');
-- 회원상태 공통코드
insert into code values ('002', '010', 'VIP', 'Y');
insert into code values ('002', '020', 'GOLD', 'Y');
insert into code values ('002', '030', 'SILVER', 'Y');


CREATE TABLE `test`.`users` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `user_clsf` CHAR(3) NULL,
  PRIMARY KEY (`user_id`));
  
  
  -- 프론트에서 회원 구분 목록 요청 ( 회원가입 시에 라디오버튼과 함게 선택할 수 있도록 하기 위해서 )
-- 공통코드가 없다면 하드코딩 ( 업무적으로 합의 )
-- 공통코드를 활용하면
select * from group_code;  -- 001 확인
select * from code where group_code = '001';
select code, code_name from code where group_code = '001' and use_yn = 'Y';
-- 위 결과를 백엔드에서는 프론트에게 내려주면 (json) 프론트는 라디오버튼 등 화면 구성 보여준다. 
-- 회원은 선택하고 프론트는 선택된 값( 이름, 이메일 등 code = 010 과 함께 )을 전송하게 되고
-- 백엔드는 users 테이블에 insert 한다. 
-- insert into users ( user_id, user_name, email, user_clsf ) values ( 100, '백길동', 'back@gildong.com', '010');
insert into users ( user_id, user_name, email, user_clsf ) values ( 100, '백길동', 'back@gildong.com', '010');
-- 프론트에서 전체 회원 목록을 필요로 한다. 이 때 회원구분코드외에 회원구분코드명까지 함께 전달한다.
select user_id, user_name, email, user_clsf,
         (select code_name from code where group_code = '001' and code = user_clsf ) user_clsf_name from users;
         
         
-- 공통코드용 function 추가
-- SET GLOBAL log_bin_trust_function_creators = 1;
SET GLOBAL log_bin_trust_function_creators = 1;

/* CREATE DEFINER=`root`@`localhost` FUNCTION `fun_code`(
	p_group_code char(3),
    p_code char(3)
) RETURNS varchar(45) CHARSET utf8mb4
BEGIN
	declare r_code_name varchar(45);
    
    select code_name 
     into r_code_name
     from code 
	where group_code = '001' 
     and code = user_clsf;
     
     
RETURN r_code_name;
END
*/

select user_id, user_name, email, user_clsf, user_state
        fun_code('001', user_clsf) user_clsf_name,
        fun_code('002', user_clsf) user_state_name 
	from users;
-- scalar sub query 는 subquery returns more than 1 row 오류가 빈번.
-- 사용자가 복수개의 취미를 가지고ㅓ 그 테이블이 (user_hobby) 일때,
-- 사용자 1명당 user_hobby 테이블에 값이 없을 수도, 1개일 수도, 복수도 일수도 있다.
-- 만약 사용자 목록을 추출하면서 사용자의 취미도 같이 추출할 경우 sub query 대신 function 으로 대체한다       
-- function 안에서 없거나 1개거나 여러개 데이터에 대한 대응 코드를 1개로 return 하는 형태로 많이 만든다.
