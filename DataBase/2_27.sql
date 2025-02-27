-- limit offset
select * from book limit 3 offset 2;
select * from book limit 3, 2; -- offset 생략 주의!
-- schema, table 대소문자 구분 ( 생성시 옵션에 따라 구성 ) binary(name) = 'ABC'

-- subquery
select max(price) from book;  -- 가장 비싼 금액(35000)
select bookname from book where price = 35000;  -- 위에서 구한 결과가 다른 쿼리에 사용

select bookname from book where price = ( select max(price) from book );

-- subquery 결과의 구분
select max(price) from book; -- 단일행, 단일열
select bookid, bookname from book; -- 다중행, 다중열
select bookid from book; -- 다중행, 단일열
select bookid, bookname from book where bookid = 3;  -- 단일행, 다중열

select bookname from book where price = ( select price  from book );
-- Error Code: 1242. Subquery returns more than 1 row	0.016 sec
select bookname from book where price in ( select price  from book );  -- subquery  의 결과가 다중행일 경우 in
select bookname from book where price in ( 7000, 8000, 9000 );

-- Error Code: 1241. Operand should contain 1 column(s)	0.000 sec
select bookname from book where price in ( select bookid, price  from book );
select bookname from book where price in ( select price  from book );  -- price 만 in 비교
select bookname from book where (bookid, price) in ( select bookid, price  from book ); -- bookid, price 함께 비교

-- subquery 사용 위치에 따른 구분
-- select (subquery) : scalar subquery    ( select  된 row 건건 별로 subquery 를 수행 ) 무조건 단일행
-- from (subquery)   : inline-view subquery ( 가상의 테이블 ) 모든 단일다중 다 가능
-- where (subquery) : nested subquery ( 사용되는 조건에 맞게 케바케 )

select name  from customer where custid in ( select custid from orders );   -- sub : 10 건 
select name  from customer where custid in ( select distinct custid from orders ); -- sub : 4 건

-- subquery 를 join 으로 바꾼다면?
select customer.name from customer, orders where customer.custid = orders.custid;  -- 10 건
select distinct customer.name from customer, orders where customer.custid = orders.custid;  -- 4 건
 -- 위 join 은 여러 건의 카티젼 프로덕트를 만든 다음 다시 distinct 로 줄인다

-- 실행계획 (execution plan)
-- 어렵다. 이유
-- 1. 동일 데이터에 대한 동일 쿼리의 비용이 DB 마다 다 다르다.
-- 2. 동일 테이블에 데이터 건수가 변경이 되면 비용이 달라진다.
-- 3. 좋은 (비싼 ) DBMS  는  실행계획을 만드는 나름대로의 비책(?) 이 있다.

-- 어떤 쿼리를 작성할 때, 조인 또는 서브쿼리로 할 건지 판단해야 하고 이때 실행계획을 기본으로 선택
-- 조인이 더 빠르다. 서브쿼리가 더 빠르다.  선입견 갖지 말자.
-- 조인으로 작성된 쿼리는 DBMS 가 실행 계획을 작성할 때, 능동적으로 개입
-- 서브쿼리로 작성된 쿼리는 DBMS 가 실행 계획을 작성할 때, 능동적으로 개입하기 어렵다. <- 쿼리 자체가 순서가 정해져 있기 때문

select bookid from book where publisher = '대한미디어';
select custid from orders where bookid in ( select bookid from book where publisher = '대한미디어');
select name from customer where custid in ( 
		select custid from orders where bookid in (
			select bookid from book where publisher = '대한미디어')
		);


-- correlated subquery
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
-- 모든 도서 중에 해당 도서의 출판사로부터 발행된 도서의 평균가격보다 큰 가격의 도서를 구하시오.
-- 서브쿼리에 현재 따지는 도서의 출판사가 전달되어서 서브쿼리에서 해당 출판사에서 발행된 도서의 평균가를 구해야 된다.
-- 서브쿼리가 본 쿼리와 독립적으로 구분되지 않고, 연결되어 있다.
select b1.bookname, b1.publisher
  from book b1
 where b1.price > ( select avg(b2.price) from book b2 where b2.publisher = b1.publisher );
  
-- subquery with 연산자
-- = (select....)
-- in (selelct...)
-- > all (select...) : 왼쪽의 항목이 오른쪽 값 전부 만족
-- > some(any) (select...) :  왼쪽의 항목이 오른쪽 값 중 하나라도 만족하면 만족

-- p234
select orderid, saleprice  from orders where saleprice <= ( select avg(saleprice) from orders );

-- 각 고개의 평균 주문금액보다 큰.....
-- 고객마다 평균금액이 다 다르다. 
--   -> 각각의 주문 건에 대해서 서브쿼리에 custid 가 전달되고  서브쿼리에서 그 custid 별 평균금액이 계산되어야 한다.
select o1.orderid, o1.custid, o1.saleprice 
  from orders o1 
where o1.saleprice > ( select avg(o2.saleprice) from orders o2 where o1.custid = o2.custid );
  
select *
  from orders
 where saleprice > ( select max(saleprice) from orders where custid = 3 ); -- max 로 최고금액
 
select *
  from orders
 where saleprice > all ( select saleprice from orders where custid = 3 ); -- all 로 최고금액 
 
 -- scala 는 select 결과 전체를 1건 1건  서브쿼리를 실행하고 그 결과를 1건 row 결과에 포함
 select o.custid, (select c.name from customer c where o.custid = c.custid ) name, sum(o.saleprice) total  
   from orders o group by o.custid;


-- orders  테이블에 name 컬럼 추가
alter table orders add bname varchar(40);  

select @@sql_safe_updates;
set sql_safe_updates = 0;

update orders set bname = ( select bookname from book where book.bookid = orders.bookid ); -- orders 전체 건에 대해 서브쿼리를 이용해 일괄처리로 도서이름을 수정한다.

-- custid 가 2 이하인 고객의 고객별 총구매금액
select c.name, sum(o.saleprice)
  from orders o,
         (select custid, name from customer where custid <= 2) c
 where o.custid = c.custid
 group by c.name;

-- workshop
-- 조별로 각자 1인이 subquery 제시 => join 변경, 반대로 join 제시 => subquery 로 변경 


-- union , union all
-- union 대상이 되는 컬럼 구성이 동일해야 한다.
-- 동일 테이블에 대한 union 사용 지양 ( 비슷한 컬럼의 구성, 비슷한 성격의 테이블 등에서 사용)
-- 전체 5건
select name from customer where address like '대한민국%'  -- 3건
union -- 중복 제거
select name from customer where custid in (select distinct custid from orders ); -- 4건

-- 전체 7건
select name from customer where address like '대한민국%'  -- 3건
union all -- 중복 제거 X
select name from customer where custid in (select distinct custid from orders ); -- 4건


-- drop : 테이블 삭제
-- delete : 테이블 삭제 X, 데이터 삭제
--    delete from orders;  <= transaction 관련 작업 동시 log 파일 생성 작업이 진행
-- trancate : 테이블 삭제 X, log  파일 생성 작업 없이 바로 완전 삭제


-- insert, update, delete
insert into book ( bookid, bookname, publisher, price ) values (11, '스포츠의학', '한솔의학..', 90000);
insert into book ( bookid, bookname, publisher, price ) values (11, '한솔의학..', 90000); -- 에러 컬럼수가 일치해야 한다.
insert into book values (13, '13', '한솔의학13..', 90000); -- 전체 컬럼에 대해서 insert 할 경우 ( 컬럼...) 생략 가능

insert into book ( bookid, bookname, publisher ) values (14, '스포츠의학14', '한솔의학14..'); -- price 생략

-- book  테이블의 publisher 를 not null 로 변경 후 
insert into book ( bookid, bookname, price ) values (15, '스포츠의학', 90000);
-- Error Code: 1364. Field 'publisher' doesn't have a default value	<= null 입력을 처리하지 못하기 때문에 default value 를 이용하려는데 그마저도 없다.

-- book 테이블의 publisher 와 price 에 default value 설정 후
insert into book ( bookid, bookname, price ) values (15, '스포츠의학', 90000); -- publisher 생략에 따라 default value 사용
insert into book ( bookid, bookname ) values (16, '스포츠의학16'); -- publisher, price 생략에 따라 default value 사용

-- pk 중복
insert into book ( bookid, bookname ) values (16, '스포츠의학16'); -- publisher, price 생략에 따라 default value 사용
-- Error Code: 1062. Duplicate entry '16' for key 'book.PRIMARY'	0.000 sec

-- 11 이후  book  데이터 삭제
delete from book where bookid >= 11;

-- book  테이블의  bookname 을 unique 
insert into book ( bookid, bookname ) values (11, '축구의 역사'); -- '축구의 역사' 동일한 bookname
-- Error Code: 1062. Duplicate entry '축구의 역사' for key 'book.bookname_UNIQUE'	0.016 sec

-- auto-increment
-- id, name 컬럼을 가진 test 테이블 생성 (id 가 pk 인데 auto increment 속성 체크)
insert into test (name) value('aaa');
insert into test (name) value('bbb');
insert into test (name) value('ccc');

-- insert select
-- minibook 테이블을 생성하는데 price 만 빼고
-- book 테이블의 create script 를 이용해서 minibook 생성
CREATE TABLE `minibook` (
  `bookid` int NOT NULL,
  `bookname` varchar(40) DEFAULT NULL,
  `publisher` varchar(40) NOT NULL DEFAULT '내 출판사',
  PRIMARY KEY (`bookid`)
) ;

insert into minibook(bookid, bookname, publisher) select bookid, bookname, publisher from book;

-- create select
create table minibook2 as select bookid, bookname, publisher from book;


-- update
update book
    set bookname = '올림픽 이야기2'
 where bookid = 9;
 
 update book
    set bookname = '올림픽 이야기3', price = price + 500
 where bookid = 9;

 update book
     set price = price + 1000
 where bookid in ( select bookid from orders where saleprice > 20000 );

-- delete
delete from book
 where bookid = 1;
 
 delete from book
 where bookid in ( select bookid from orders where saleprice <= 20000 ); 

-- truncate book
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '배구 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
