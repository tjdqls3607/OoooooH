insert into customer values(1, '홍길동');
insert into customer values(2, '이길동');
insert into customer values(3, '삼길동');
-- 위 3개의 insert 는 모두 종료후 자동 commit 됨 (현재 설정)		오늘의 워크샵 트랜잭션
select @@autocommit;	-- 1 : on, 0 : off

-- autocommit 을 off 한 상태로 insert
insert into customer values(4, '사길동');
commit;

insert into customer values(5, '오길동');
commit;

update customer set name = '육길동' where id = 5;
commit;

delete from customer where id = 5;
commit;

set autocommit = 0;

delete from customer where id = 4;

-- 동시성 제어(쓰기, 쓰기)
-- madang schema
-- Lock은 row 단위로 처리
select * from book where bookid = 3;

select @@autocommit;
set autocommit = 0;

start transaction;

update book set price = 2000 where bookid = 4;

-- 다른 세션에서 commit이 발생한 경우, 자동으로 commit 된 데이터가 바로 보이지 않고, 한번 더 commit을 수행해야 보인다.
commit;

-- 데드락 (Dead Lock)
-- 1, 2 book에 대해서 테스트	
select * from book where bookid = 3;

start transaction;

update book set price = 5000 where bookid = 3;	-- 1번 lock

update book set price = 4000 where bookid = 4;	-- 2번 lock

commit;