-- 집계함수 (전체 row 대상)
select sum(saleprice) from orders;
select avg(saleprice) from orders;
select count(*) from orders;	-- 전체 row 수
select max(saleprice) from orders;
select min(saleprice) from orders;

-- 집계함수 (조건을 만족하는 row 대상)
select * from orders where saleprice >= 10000;
select sum(saleprice) from orders where saleprice >= 10000;
select * from orders where custid = 1;	-- 전체 row 수
select max(saleprice) from orders where custid = 1;

select * from orders where saleprice = (select max(saleprice) from orders where custid = 1 );

-- 집계함수를 한꺼번에 컬럼별로 처리
select sum(saleprice), avg(saleprice), min(saleprice), max(saleprice) from orders;
select sum(saleprice), avg(saleprice), min(custid), max(orderdate) from orders;
select sum(saleprice) as sum_price, avg(saleprice) as avg_price, min(saleprice), max(saleprice) from orders;

-- group by
-- 고객별
select custid, count(*) as '도서수량' , sum(saleprice) as '총액' from orders
group by custid;

-- 도서별
select bookid, count(*) as '도서수량' , sum(saleprice) as '총액' from orders
group by bookid;

-- 일자별
select orderdate, count(*) as '도서수량' , sum(saleprice) as '총액' from orders
group by orderdate;

-- group by  복수개
-- 일자별, 고객별
select orderdate, custid, sum(saleprice) as '총액'
from orders
group by orderdate, custid;

-- group by 시도,구군,읍면동 (계층적 구조에서는 바깥 칼럼 우선)

-- having
-- group by 로 생성된 새로운 row 에서 조건 부여
select custid, count(*) as '도서수량' from orders where saleprice >= 8000 group by custid having count(*) >= 2; -- 집계결과

select custid, count(*) as '도서수량'from orders where saleprice >= 8000 group by custid having count >= 2; -- group by 할목

select custid, count(*) as '도서수량'from orders where saleprice >= 8000 group by custid having '도서수량' >= 2; -- 집계 결과 문자열 alias 오류는 없지만 결과가 이상함 해당 문자열과 비교

select custid, count(*) as book_count from orders where saleprice >= 8000 group by custid having book_count >= 2; -- 집계 결과 문자열 아닌 alias 오류없고 결과도 정상적이다

-- group by select 컬럼 주의
select bookid, count(*) as '도서수량' from orders where saleprice >= 8000 group by custid having count(*) >= 2; -- group by 항목이 아닌 항목을 select에 사용

desc country;

-- world db
-- 1. country 테이블에서 유럽(Europe) 대륙에 속하는 모든 국가의 인구수(Population) 의 총합은?
select sum(Population) as'총합' 
from country
where Continent = 'Europe';

-- 2. conutry 테이블에서 대륙(Continent)별 건수, 최대인구수, 최소 Gnp, 최대 Gnp, 평균 기대수명을 구하시오
select Continent, count(*) cnt, max(Population), min(GNP), max(GNP), avg(LifeExpectancy)
from country
group by Continent;

-- madang DB - JOIN-
select * from customer; -- 5건
select * from orders; -- 10건
select * from customer,orders; -- 5 X 10 건

select * from customer,orders where customer.custid = orders.custid; -- 위 cartisian product 로 부터 10건 추출

select customer.custid, customer.name, orders.saleprice, orders.orderdate
 from customer,orders where customer.custid = orders.custid; -- 원하는 테이블의 컬럼을 선택
 
 -- 두 테이블에 중복되는 칼럼은 table 명을 생략X(custid)
 -- 한 테이블에만 있는 컬럼은 table 명을 생략 가능
 -- 테이블명을 모두 명시하는 것이 가독성이 좋다.
 select customer.custid, customer.name, orders.saleprice, orders.orderdate 
 from customer,orders where customer.custid = orders.custid; 

-- join경우, 테이블 alias를 사용 권장 (단, alias 를 사용헐 경우 컬럼명에도 alias 를 함께 사용)
 select c.custid, c.name, o.saleprice, o.orderdate 
 from customer c,orders o where c.custid = o.custid; 
 
 -- order by 추가
select c.custid, c.name, o.saleprice, o.orderdate 
 from customer c,orders o where c.custid = o.custid
 order by c.custid;
 
-- sum(고객 이름 <= 사실상 고객별...처리)
select c.name, sum(o.saleprice)
 from customer c, orders o where c.custid = o.custid
 group by c.name
 order by c.name;
 
-- 고객별 sum 을 구하는데 동명이인이 있으면?
-- 고객의 구분자(식별자)인 Primary Key로 group by 필요
 select c.name, sum(o.saleprice)
 from customer c, orders o where c.custid = o.custid
 group by c.custid
 order by c.name;
 
-- 실무 SQL 과 지금 SQL ???
-- 1. 하나의 SQL 에서 처리하는 테이블 수가 다르다. (보통 5개 정도)
-- 2. 테이블 당 데이터 건수가 어~~~~~~~~엄청 많다(1억건 이상.)
-- 3. 작성하는 SQL 이 훠~~~알씬 복잡하다.


-- 3개의 테이블
select * from customer; -- 5건
select * from book; -- 10건
select * from orders; -- 10건
select * from customer,book, orders; -- 5 X 10 X 10 건

select * from customer,book, orders 
 where customer.custid = orders.custid
  and book.bookid = orders.bookid;
    
-- 테이블 alias. 원하는 컬럼만
select c.name, c.address, b.bookname, o.orderdate
from customer c,book b, orders o 
 where c.custid = o.custid
  and book.bookid = orders.bookid; -- orders 기준 customer, book의 key 와 join 조건
  
-- 각 테이블 별 조건 추가
select * -- c.name, c.address, b.bookname, o.orderdate -- * 로 카티션 프로덕트를 만들고 난 후 원하는 컬럼만 선택
from customer c,book b, orders o 
 where c.custid = o.custid
  and b.bookid = o.bookid
  and c.name like '김%' -- 고객이름이 김 으로 시작(select 항목 포함)
  and o.saleprice < 10000; -- select 항목 포함 X


-- 표준 SQL JOIN (ANSI SQL JOIN)
select c.custid, c.name, o.saleprice, o.orderdate
 from customer c, orders o
 where c.custid = o.custid;
 
 --  쿼리를 ansi sql join 으로 변경
select c.custid, c.name, o.saleprice, o.orderdate
 from customer c inner join oders o on c.custid = o.ocustid;
 
 select * -- c.name, c.address, b.bookname, o.orderdate -- * 로 카티션 프로덕트를 만들고 난 후 원하는 컬럼만 선택
from customer c,book b, orders o 
 where c.custid = o.custid
  and b.bookid = o.bookid
  and c.name like '김%' -- 고객이름이 김 으로 시작(select 항목 포함)
  and o.saleprice < 10000; -- select 항목 포함 X

  -- 위 쿼리를 ansi sql join 으로 변경
  -- inner 를 생략하면 기본 join 이 inner join
select c.name, c.address, b.bookname, o.orderdate -- * 로 카티션 프로덕트를 만들고 난 후 원하는 컬럼만 선택
 from orders o inner join customer c on o.custid = c.custid
			 inner join book b on o.bookid = b.bookid
 where c.name like '김%' -- 고객이름이 김 으로 시작(select 항목 포함)
  and o.saleprice < 10000; -- select 항목 포함 X
 
 