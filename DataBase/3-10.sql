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

-- 고립수준
-- 한 트랜잭션은 읽기, 다른 트랜잭션을 쓰기를 진행
-- 읽는 트랜잭션이 쓰는 트랜잭션의 변화를 어떻게 대응할 것인가 하는 정책에 따라 다른 결과를 보여준다.
-- set transaction isolation level ___ ;
-- ___ 에 올 수 있는 경우
-- read uncommited : 쓰기 트랜잭션의 변화가 commit 되지 않아도 읽는다. 
--   <= 읽기 트랜잭션에서 commit 되지 않은 데이터를 읽은 후 쓰기 트랜잭션에서 rollback 하면 
--        잘못된 데이터를 읽게 된다. ( dirty read )
-- read commited : 쓰기 트랜잭션의 변화가 commit 되어야만 읽는다.
--   <= 읽기 트랜잭션에서 이전에 commit 된 데이터를 읽은 후 쓰기 트랜잭션에서 변경 commit 하면 
--        이전에 읽은 데이터와 달라진다. ( non - repeatable read )
--   <= 읽기 트랜잭션에서 이전에 commit 된 데이터들을 읽은 후 ( 복수개가 될 수 있는) 쓰기 트랜잭션에서 등록 commit 하면 
--        이전에 읽은 데이터들과 달라진다. ( phantom read )
-- repeatable read
--   <= 읽기 트랜잭션에서 이전에 commit 된 데이터를 읽은 후 쓰기 트랜잭션에서 변경 commit 해도
--        이전에 읽은 데이터는 동일하게 읽는다 ( X )
CREATE TABLE Users
( id INTEGER,
  name  VARCHAR(20),
  age   INTEGER);
INSERT INTO Users VALUES (1, 'HONG GILDONG', 30);
select * from users;
set transaction isolation level read uncommitted;
start transaction;
select * from users where id = 1; -- 최초 30
-- 쓰기 트랜잭션 uncommitted 된 21
select * from users where id = 1; -- 쓰기 트랜잭션 uncommitted 된 21 ( dirty read )
select * from users where id = 1; -- 최초 30 쓰기 트랜잭션에서  rollback
commit;
set transaction isolation level read committed;
start transaction;
select * from users where id = 1; -- 최초 30
-- 쓰기 트랜잭션 committed 된 21
select * from users where id = 1; -- 쓰기 트랜잭션 uncommitted 된 21 ( non-repeatable read )( dirty-read 는 X)
select * from users where id = 1; -- 최초 30 쓰기 트랜잭션에서  rollback
commit;
set transaction isolation level read committed;
start transaction;
select * from users where age between 10 and 30;  -- 최초 30
-- 쓰기 트랜잭션 21 추가
select * from users where age between 10 and 30;  -- 최초 30 과 쓰기 트랜잭션에서 추가된 21 이 함께 보인다. (phamtom read)
commit;
set transaction isolation level repeatable read;
start transaction;
select * from users where age between 10 and 30;  -- 최초 30
-- 쓰기 트랜잭션 21 추가
select * from users where age between 10 and 30;  -- 최초 30 만 보인다. ( phamtom read X )
commit;

