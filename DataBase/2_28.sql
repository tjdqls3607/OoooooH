-- 내장함수
select abs(-78), abs(78) from dual;
select @@sql_safe_updates;

select custid, round(sum(saleprice)/count(*),-2) from orders group by custid;
 
-- 한글 utf-8(3byte) , utf-16(4byte), euc-kr(2byte)
-- '축구의 역사' : 한글 5개 + space 1개 (5x3+1) = 16
select bookname, length(bnookname), char_length(bookname) from book where bookid in (1, 10);