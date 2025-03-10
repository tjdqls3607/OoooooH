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



-- 복잡하고 긴 transaction 작업 수행 가정 (5 - 6시간 걸리는 작업)
-- 개발계 서버에서 코드 작성
-- A, B, C 는 완성, D 개발중... A,B,C는 이미 완성 되었으므로 
-- D가 문제있을 경우, A,B,C는 완성된 상태로 rollback 하고 싶다. <= savepoint
select * from customer;
start transaction;

-- A 테이블 변화
-- B 테이블 조회, 결과값에 따라 다르게 처리 (PL-SQL)
-- C 테이블 변화(insert)
-- D 테이블 변화 (upadate)
-- E 테이블 조회
-- ....
-- 홍길동, 이길동 insert를 위 A,B,C로 가정, 삼길동 insert를 D 가정
insert into customer values(1, '홍길동');
insert into customer values(2, '이길동');

savepoint s1;

insert into customer values(3, '삼길동');

commit; -- transaction 완료
rollback to s1; -- transaction 취소