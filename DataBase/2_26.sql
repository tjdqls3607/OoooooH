-- 집계함수 (전체 row 대상)
select sum(saleprice) from orders;
select avg(saleprice) from orders;
select count(*) from orders;	-- 전체 row 수
select max(saleprice) from orders;
select min(saleprice) from orders;