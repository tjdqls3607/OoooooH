set autocommit = 0;
select @@autocommit;

-- 여러 insert, update, delete 같은 DB에 변화를 주는 query를 여러 개 수행
-- 단 query들 전체가 하나의 작업 단위 (transaction)로 처리

-- customer truncate; (truncate 는 rollback할 수 없다.)
select * from customer;
start transaction;

insert into customer values(1, '홍길동');
insert into customer values(2, '이길동');
insert into customer values(3, '삼길동');

commit; -- transaction 완료
rollback; -- transaction 취소