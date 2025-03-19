-- autocommit, sql_safe_updates
-- 필요한 환경변수의 설정 조회, 변경, 원복 처리

select @@autocommit;
select @@sql_safe_updates;	-- 키 값으로 업데이트 해야됨

set sql_safe_updates = 0;
update book set price = 10000;
set sql_safe_updates = 1;

-- 대소문자 테스트 
create table bin_table (
	 user_id varchar(5) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bi;

create table ci_table (
	 user_id varchar(5) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into bin_table values('abc');
insert into ci_table values('abc');

select * from bin_table where user_id = 'ABC'; 	-- X
select * from ci_table where user_id = 'ABC';	-- O
select * from bin_table where user_id = 'abc'; 	-- O
select * from ci_table where user_id = 'abc';	-- O

-- 대소문자를 구분하지 않도록 만든 테이블 또는 스키마에서 대소문자를 구분해야 한다면??
-- ci_table('aaa')
select * from ci_table where user_id = 'ABC'; -- O
select * from ci_table where user_id = 'abc'; -- O

select * from ci_table where binary user_id = 'ABC'; -- X
select * from ci_table where binary user_id = 'abc'; -- O
select * from ci_table where binary (user_id) = 'ABC'; -- X
select * from ci_table where binary (user_id) = 'abc'; -- O
-- 조회조건 칼럼이 index를 가진 경우 오른쪽에 함수를 사용하는 게 바람직
select * from ci_table where binary user_id = binary('ABC'); -- X
select * from ci_table where binary user_id = binary('abc'); -- O



