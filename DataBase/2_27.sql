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
-- Error Code: 1242. Subquery returns more than 1 row   0.016 sec
select bookname from book where price in ( select price  from book );  -- subquery  의 결과가 다중행일 경우 in
select bookname from book where price in ( 7000, 8000, 9000 );
-- Error Code: 1241. Operand should contain 1 column(s) 0.000 sec
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