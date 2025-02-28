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
