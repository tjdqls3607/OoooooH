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
