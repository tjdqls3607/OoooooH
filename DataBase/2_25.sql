select *  from book; -- 모든 컬럼을 만든 순서대로
select price, bookname, bookid, publisher from book; -- 모든 컬럼을 순서를 다르게
select bookname, price from book; -- 일부 컬럼
select publisher from book; -- 모든 출판사 ( 중복 포함 )
select distinct publisher from book; -- 모든 출판사 ( 중복 제거 )
-- where
select * from book where price =7000; -- 모든 row 중 where 조건에 맞는 row 만 추출
select * from book where price >20000; -- 모든 row 중 where 조건에 맞는 row 만 추출
select * from book where price !=7000; -- 모든 row 중 where 조건에 맞는 row 만 추출 ( <>, != : 다른 조건 )
select * from book where bookid between 5 and 7;
select * from book where price between 10000 and 20000; -- 경계선 포함
select * from book where price >= 10000 and price <= 20000; -- 경계선 포함
select *
  from book
 where publisher = '굿스포츠' or  publisher = '대한미디어';
 
select *
  from book
 where publisher in (  '굿스포츠' ,'대한미디어' );  -- publisher 가 in 다음의 집합에 포함되는 것 추출 (권장)
 
select *
  from book
 where publisher not in (  '굿스포츠' ,'대한미디어' );  -- publisher 가 in 다음의 집합에 포함되지 않는 것 추출 (권장)
 
select *
  from book
 where publisher != '굿스포츠' and publisher != '대한미디어'; 
 
-- like
select * from book where bookname like '축구의 역사';  -- wildcard 가 없으므로 = 과 동일한 비교
select * from book where bookname like '%축구%';  -- 비교 컬럼에 축구 두 글자가 포함되면 된다.
select * from book where bookname like '골프%';  -- 비교 컬럼에 축구 두 글자가 포함되어야 하고 반드시 골프로 시작.
select * from book where bookname like '%기술';  -- 비교 컬럼에 축구 두 글자가 포함되어야 하고 반드시 기술로 종료.
-- 복합 조건
select * from book where bookname like '%축구%' and price >= 20000;
select * from book where price <=10000 or price >=  30000;  -- 복합 조건이 3개 이상이면서 and 와 or 가 섞여 있는 경우 가독성을 위해서라도 () 를 활용
-- order by 항상 맨 마지막에 수행되도록 query 작성 ( 결과물을 만드는 중간에 order by 포함되면 성능 하락의 원인이 된다. )
select * from book order by bookname; -- asc, desc (생략하면 asc)
select * from book order by bookname desc; -- 내림차순
select * from book order by price desc;
select * from book order by price desc, bookname desc;