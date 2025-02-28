-- 내장함수
select abs(-78), abs(78) from dual;
select @@sql_safe_updates;

select custid, round(sum(saleprice)/count(*),-2) from orders group by custid;
 
-- 한글 utf-8(3byte) , utf-16(4byte), euc-kr(2byte)
-- '축구의 역사' : 한글 5개 + space 1개 (5x3+1) = 16
select bookname, length(bnookname), char_length(bookname) from book where bookid in (1, 10);

-- adddate
select adddate('2025-02-28', interval 5 day);

-- sysdate
select systate();

insert into orders values (11, 3, 8, 13000, sysdate(), 'aaa');
insert into orders values (12, 3, 8, 13000, now, 'bbb');
insert into orders values (13, 3, 8, 13000, now, 'null');
-- sysdate vs now 확인하기

-- null 에 대한 입장
-- null 을 허락 X <= not null with default values
-- null 을 허락 O <= null check logic

-- null 연산
-- null 에 대한 연산 결과는 null
select price+100 from mybook;

select * from mybook;

select * from mybook where price is null;

select * from mybook where price is not null;

-- if null 오라클nvl()
select bookid, price from mybook;

select bookid, ifnull(price, 0) price from mybook;

-- case when then else

-- employee table 에서 department_id가 60, 90 인 사원의 salary 합
-- 결과가 2개의 row
select department_id, sum(salary)
 from employees
 where department_id in (60,90)
 group by department_id;

-- 1개의 row 에 2개의 컬럼으로 표현 
-- select 60부서 sum, 90부서 sum
 select sum(case when department_id = 60 then salary else 0 end)sum60, 
		sum(case when department_id = 90 then salary else 0 end)sum90
		from employees where department_id in (60,90);
       
       

CREATE TABLE customer (
 customer_id int NOT NULL,
 customer_nm varchar(45) NOT NULL,
 PRIMARY KEY (customer_id)
);
    CREATE TABLE customer_order (
      order_id int NOT NULL,
      customer_id int DEFAULT NULL,
      product_id int DEFAULT NULL,
      order_price int DEFAULT NULL,
      PRIMARY KEY (order_id)
    );
        
create table product (
  product_id int not null,
  product_nm varchar(45) not null,
  product_price int default null,
  primary key (product_id)
);
insert into customer values ('1', '홍길동');
insert into customer values ('2', '이길동');
insert into product values ('111', 'tv', '1000');
insert into product values ('222', '냉장고', '2000');
insert into customer_order values ('11', '1', '111', '1000');

select * from customer where customer_id in (select customer_id from customer_order); -- 1건
select * from customer where exists (select customer_id from customer_order); -- 2건
-- 왼쪽 서브쿼리의 customer_order 가 100건이면 오른쪽 customer 1건에 대해 왼쪽 100과 비교를 하다가 1건이라도 나오면
-- 더이상 따지지 않고 true 처리
select * from customer c where exists (select co.customer_id from customer_order co where c.customer_id = co.customer_id);

-- not exists
select * from customer where customer_id not in (select customer_id from customer_order); -- 1건
-- 왼쪽 서브쿼리의 customer_order 가 100건이면 오른쪽 customer 1건에 대해 왼쪽 100과 비교를 하다가 1건이라도 나오면
-- 더이상 따지지 않고 false 처리
select * from customer c where not exists (select co.customer_id from customer_order co where c.customer_id = co.customer_id);


create table blacklist (
  blacklist_id int not null,
  customer_id int null,
  customer_nm varchar(45) null,
  PRIMARY KEY (blacklist_id)
);
  
insert into blacklist values (1, 2, '이길동');
insert into blacklist values (2, null, '박길동'); 


-- not in not exists with null
select * from blacklist;

-- 1번은 blacklist 에 없는데 not in 계산 계산 1 !=2 && 1 != null 가 true 여야하는데 null 연산에서 false가 되면서 1번이 안나온다
select * from customer where customer_id not in (select customer_id from blactlist); -- 0건 ( 1번이 나와야 하는데 0건)
-- null 을 제외한 not in 처리 필요
select * from customer where customer_id not in (select customer_id from blacklist where customer_id is not null);

select * from customer c where not exists (select b.customer_id from blacklist b where c.customer_id = b.customer_id);

-- not in : index 이용 X, null 에대한 고려가 필요함
-- not exists : index 이용, null 에대한 고려가 필요X