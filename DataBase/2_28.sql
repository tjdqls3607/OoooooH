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

-- 뷰
-- 보고서 쿼리
select o.orderid, o.custid, c.name, b.bookid, b.bookname, o.saleprice, o.orderdate 
from customer c, orders o ,book b 
where c.custid = o.custid 
and b.bookid = o.bookid;

-- 뷰를 이용한 보고서
create view VOrders as
 select o.orderid, o.custid, c.name, b.bookid, b.bookname, o.saleprice, o.orderdate 
 from customer c, orders o ,book b 
 where c.custid = o.custid 
 and b.bookid = o.bookid;
 
 select * from VOrders; -- 전체
 select custid, name from vorders; -- 일부
 -- 은행, 통신 회사 인사팀, 영업팀 (전체 데이터가 필요)... 콜센터 (제한적인 데이터만 필요)
 -- 중요 데이터가 포함된 테이블 중 상담이 필요한 일부 컬럼만 콜센터가 사용하도록 한다
 -- 위 경우, 테이블을 콜센터에 직접 노출 X => 일부 컬럼으로 view 만들어서 제공
 
 -- 인덱스 
 -- 빠른검색 목적 
 -- 1. 별도의 자료구조를 생성 (정렬) 
 -- 2. 새로운 데이터가 추가되거나, 기존데이터가 변경 또는 삭제되면 재구성
 -- 3. 검색에서는 이득을 보지만, 등록, 수정, 삭제에서는 손해를 본다.
 -- 4. PK,FK 등은 자동으로 인덱스가 생성된다.
 -- 5. 거꾸로 특정 컬럼에 인덱스를 추가해도 검색이 개선되지 않고 오히려 더 느려진다. (예 : 성별 'M', 'F')
 --  분포도가 20% 이상이 되면 별로...
 -- 아래 query 실행계획 비교
select * from book where bookid = 3;
select * from book where bookname = 'abc';

select * from orders where orderid =3;
select * from orders where saleprice =3;

-- test_db 에 jdbc_big 테이블 생성
select count(*) from jdbc_big;
select * from jdbc_big;
-- 100만건 데이터를 이용해서 더 큰 테이블 생성
create table jdbc_big_2 as select * from jdbc_big;
select count(*) from jdbc_big_2;
-- jdbc_big_2 를 이용해서 jdbc_big 더 크게 insert iptp 1000,0000
insert into jdbc_big (col_2, col_3, col_4) select col_2, col_3, col_4 from jdbc_big_2;

select * from jdbc_big where col_1 = 84563;
select * from jdbc_big where col_2 = '노수주';

-- Foreign Key (FK)
-- customer, order, book 테이블에 orders 의 custid는 customer, bookid 는 book 의 key
-- orders 에 customer 의 custid 를 FK 로 지정하는 설정

