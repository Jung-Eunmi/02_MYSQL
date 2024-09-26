-- DDL (Data Definition Language)
-- 데이터를 정의하는 언어 
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용되는 SQL 의 부분이다.

-- CREATE
-- 테이블을 생성하기 위한 구문
-- IF NOT EXISTS : 만약 존재하지 않는다면
-- 위에 구문을 적용하면 기존에 존재하는 테이블이 있더라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 표현식
-- column_name / data_type(length);
-- 						추가로 써도됨 [NOT NULL] [DEFAULT VALUE] [AUTO_INCREMENT] column_constraint;

-- tb1 테이블 생성

create table if not exists tb1 (
	pk int primary key, 
    fk int,
    col1 varchar(255),  -- 문자열 길이 지정
    check(col1 in ('Y', 'N'))
) engine=innodb;

-- engine=innodb
-- 해당하는 테이블은 innodb 라는 스토리지 엔진으로 만든다는 의미를 가지고 있다.
-- MySQL 에서 가장 많이 사용하는 엔진으로서 
-- 데이터의 무결성, 안정성, 동시성 제어를 하는 것에 적합하다.

-- 만든 테이블에 값 insert 테스트
-- insert into tb1 values (null, 10, 'Y'); pk 컬럼은 null 을 허용하지 않음 
-- insert into tb1 values (1, null, 'G'); col1 컬럼은 'Y', 'N'값 외에 허용하지 않음
insert into tb1 values (1, 10, 'Y');

select * from tb1;

-- tb2
create table if not exists tb2 (
	pk int auto_increment primary key, 
    fk int,
    col1 varchar(255),  -- 문자열 길이 지정
    check(col1 in ('Y', 'N'))
) engine=innodb;

-- 잘 못 생성한 테이블 삭제 하는 구문 drop
drop table tb2;

describe tb2;

-- auto_increment
-- insert 시에 pk 라고 하는 컬럼에 자동으로 번호를 발생시킨다.
-- 중복되지 않는 값을 발생시킨다.
insert into tb2 values (null, 10, 'Y');
insert into tb2 values (null, 20, 'Y');

select * from tb2;

-- alter
-- 테이블에 추가 / 변경 / 수정 / 삭제 하는 모든 것은 alter 명령어를 사용해서 적용할 수 있다.

-- 열 추가 -> 컬럼을 추가
alter table tb2 
add col2 int not null;

-- 열 삭제 -> 컬럼 삭제
alter table tb2
drop column col2;

-- 열 이름 변경 및 데이터 타입 변경
-- alter table 변경 할 테이블 change 기존컬럼명 바꿀컬럼명 컬럼정의(데이터타입, 제약조건);
-- tb2 의 fk 컬럼을 change_fk 로 변경, 제약조건을 not null 변경
alter table tb2
change column fk change_fk int not null;

describe tb2;








