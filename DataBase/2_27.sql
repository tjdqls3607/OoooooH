-- limit offet
select * from book limit 3 offset 2;	-- limit 가져오는것의 개수, offset 건너뛰는 개수
select * from book limit 3,2; -- offet 생략 주의
-- schema, table 대소문자 구분(생성시 옵션에 따라 구성) binary(name) = 'ABC'

-- subquery
select max(price) from book; -- 가장 비싼 금액
select bookname from book where price = 35000;  -- 위에서 구한 결과가 다른 쿼리에 사용

select bookname from book where price = ( select max(price) from book);

-- subquery 결과의 구분
select max(price) from book; -- 단일행, 단일열
select bookid, bookname from book; -- 다중행, 다중열
select bookid from book; -- 다중행, 단일열
select bookid, bookname from book where bookid = 3; -- 단일행, 다중열

-- Error Code: 1242. Subquery returns more than 1 row	0.000 sec
select bookname from book where price = (select price from book);
select bookname from book where price in (select price from book); -- subquery 의 결과가 다중행일 결루 in
select bookname from book where price in (7000, 8000, 9000);

-- Error Code: 1241. Operand should contain 1 column(s)	0.000 sec
select bookname from book where price in (select bookid, price from book); 
select bookname from book where price in (select price from book); -- price 만 in 비교
select bookname from book where (bookid,price) in (select bookid, price from book); -- bookid, price 함께 비교

-- subquery 사용 위치에 따른 구분
-- select (subquery) : scalar subquery (select 된 row 건건 별로 subquery를 수행) 무조건 단일행 
-- from (subquery) : inline-view (가상의 테이블) 모든 단일 다중 다 가능
-- where (subquery) : nested subquery (사용되는 조건에 맞게 케바케)

select name from customer where custid in (select custid from orders); -- sub: 10건
select name from customer where custid in (select distinct custid from orders); -- sub: 4건

-- subquery 를 join 으로 바꾼다면?
select customer.name from customer, orders where customer.custid = orders.custid; -- 10건
select distinct customer.name from customer, orders where customer.custid = orders.custid; -- 4건
-- 위 join 은 여러 건의 카티젼 프로덕트를 만든 다음 다시 distinct 로 줄인다

-- 실행 계획 (execution plan)
-- 어렵다. 이유
-- 1. 동일 데이터에 대한 동일 쿼리의 비용이 DB마다 다 다르다.
-- 2. 동일 테이블에 데이터 건수가 변경이 되면 비용이 달라진다.
-- 3. 좋은 (비싼) DBMS 는 실행계획을 만드는 나름대로의 비책(?) 이 있다.

-- 어떤 쿼리를 작성할 때, 조인 또는 서브쿼리로 할 건지 판단해야 하고 이때 실행계획을 기본으로 선택
-- 조인이 더 빠르다, 서브쿼리가 더 빠르다, 선입견 갖지 말자
-- 조인으로 작성된 쿼리는 DBMS 가 실행계획을 작성할 때, 능동적으로 개입
-- 서브쿼리로 작성된 쿼리는 DBMS 가 실행계획을 작성할 때, 능동적으로 개입하기 어렵다 <= 쿼리 자체가 순서가 정해져 있기 때문

select bookid from book where publisher='대한미디어';
select custid from orders where bookid in (select bookid from book where publisher='대한미디어');
select name from customer where custid in
	(select custid from orders where bookid in
	(select bookid from book where publisher='대한미디어')
    );
    
    
-- correlated subquery
-- 출판사 별로 출판사의 평균도서 가격 보다 비싼 도서를 구하시오
-- 모든 도서 중에 해당 도서의 출판사로부터 발행된 도서의 편균가격보다 큰 가격의 도서를 구하시오
-- 서브쿼리에 현재 따지는 도서의 출판사가 전달되어서 서브쿼리에서 해당 출판사에서 발행된 도서의 평균가를 구해야 된다.
-- 서브쿼리가 본 쿼리와 독립적으로 구분되지 않고, 연결되어 있다.
select b1.bookname, b1.publisher
from book b1
where b1.price > (select avg(b2.price) from book b2 where b2.publisher = b1.publisher);