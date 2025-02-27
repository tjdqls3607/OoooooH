-- limit offet
select * from book limit 3 offset 2;	-- limit 가져오는것의 개수, offset 건너뛰는 개수
select * from book limit 3,2; -- offet 생략 주의
-- schema, table 대소문자 구분(생성시 옵션에 따라 구성) binary(name) = 'ABC'

-- subquery
select max(price) from book; -- 가장 비싼 금액
select bookname from book where price = 35000;  -- 위에서 구한 결과가 다른 쿼리에 사용

select bookname from book where price = ( select max(price) from book);