-- 전체 개설강의 조회: getAllSubject
SELECT *
  FROM subject;
  
-- 개별 과목 조회
SELECT * FROM subject
WHERE sub_name='비행술' AND substr('수 19,20,21', 1,1)='수';

--
CREATE or REPLACE VIEW CartView AS 
					SELECT  DISTINCT (sub.sub_code),
							stu.stu_id,
							sub.sub_name,
							sub.professor,
							sub.daytime,
							sub.grade,
							lec.reg_num,
							sub.limit_num
	   				FROM subject sub, student stu, lecture lec
	   				WHERE sub.sub_code = lec.sub_code
	   				AND ;
	   				--and stu.stu_id = lec.stu_id;
	   			
SELECT distinct (reg_num) FROM lecture WHERE sub_code=524840;


--lecture table에 수강신청 완료 flag 추가
ALTER TABLE lecture 
	add(success number(1) default 0); 
