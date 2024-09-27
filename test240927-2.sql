select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

-- 1. 영어영문학과(학과코드 `002`) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오.
-- ( 단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
select
	STUDENT_NO 학번,
    STUDENT_NAME 이름,
    ENTRANCE_DATE 입학년도
from
	tb_student 
where
	DEPARTMENT_NO = '002'
order by
	ENTRANCE_DATE;
    
-- 2.춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 두 명 있다고 한다. 
-- 그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. 
select
	PROFESSOR_NAME,
    PROFESSOR_SSN
from
	tb_professor
where
	LENGTH(PROFESSOR_NAME) != 9;

-- 3.춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 
-- 단 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오. 
-- (단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 ‘만’으로 계산한다.)
select
	PROFESSOR_NAME 이름,
    FLOOR(DATEDIFF(CURDATE(), STR_TO_DATE(CONCAT('19', SUBSTRING(PROFESSOR_SSN, 1, 6)), '%Y%m%d')) / 365) 나이
from
    tb_professor
where
	substring(PROFESSOR_SSN,8,1) = 1
order by
	PROFESSOR_SSN desc;
    
-- 4.교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오. 출력 헤더는’이름’ 이 찍히도록 핚다. (성이 2 자인 경우는 교수는 없다고 가정하시오)
select
	SUBSTRING(PROFESSOR_NAME,2) 이름
from
	tb_professor;

-- 5.춘 기술대학교의 재수생 입학자를 구하려고 한다. 
-- 어떻게 찾아낼 것인가? 이때, 만 19살이 되는 해에 입학하면 재수를 하지 않은 것으로 간주한다.






