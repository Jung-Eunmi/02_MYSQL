use chundb;

-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.
select
	STUDENT_NAME as '학생 이름',
	STUDENT_ADDRESS 주소지
from
	tb_student
order by
	STUDENT_NAME;

-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
SELECT 
    STUDENT_NAME, 
    STUDENT_SSN
FROM 
    tb_student
WHERE 
    ABSENCE_YN = 'Y'
ORDER BY 
    CASE 
        WHEN substring(STUDENT_SSN, 8, 1) IN ('3', '4') THEN concat('20', substring(STUDENT_SSN, 1, 6))  -- 2000년대 출생자
        WHEN substring(STUDENT_SSN, 8, 1) IN ('1', '2') THEN concat('19', substring(STUDENT_SSN, 1, 6))  -- 1900년대 출생자
    END desc;
    
-- 3. 주소지가 강원도나 경기도인 학생들 중 2020년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 
-- 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.
select
	STUDENT_NAME 학생이름,
    STUDENT_NO 학번,
    STUDENT_ADDRESS '거주지 주소'
from
	tb_student
where
	STUDENT_ADDRESS like '강원%'
    or
    STUDENT_ADDRESS like '경기%'
    and
    ENTRANCE_DATE like '202%' 
order by
	STUDENT_NAME;
    
-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. 
-- (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
select
	p.PROFESSOR_NAME,
    p.PROFESSOR_SSN
from
	tb_professor p
    join
    tb_department d
    on
    p.DEPARTMENT_NO = d.DEPARTMENT_NO
where
	d.DEPARTMENT_NAME like '법학%'
order by
	p.PROFESSOR_SSN;
    
-- 5번 2022 년 2학기에 C3118100 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.
select
	STUDENT_NO,
    POINT
from
	tb_grade
where
	TERM_NO like '202202'
    and
    CLASS_NO like 'C3118100'
order by
	POINT desc,
    STUDENT_NO asc;

-- 6번 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오.
select
	s.STUDENT_NO,
    s.STUDENT_NAME,
    d.DEPARTMENT_NAME
from
	tb_student s
    join
    tb_department d
    on
    s.DEPARTMENT_NO = d.DEPARTMENT_NO
order by
	STUDENT_NAME;

-- 7번 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오.
select	
    c.CLASS_NAME,
	d.DEPARTMENT_NAME
from
	tb_class c
	join
    tb_department d
    on
    c.DEPARTMENT_NO = d.DEPARTMENT_NO
order by
	d.DEPARTMENT_NAME,
    c.CLASS_NAME;

-- 8번 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오
SELECT DISTINCT
    c.CLASS_NAME, 
    p.PROFESSOR_NAME
FROM
    tb_class c
JOIN
    tb_professor p
ON
    c.DEPARTMENT_NO = p.DEPARTMENT_NO
ORDER BY
    c.CLASS_NAME;
    
    
    
select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

	