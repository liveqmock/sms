##
select * from stu_basic_info;
select * from stu_adv_info;
delete from stu_adv_info where awardNo = 30 or awardNo = 31; 
##评优评先项目信息
insert into adv_item values(400,'优秀三好学生','2011-09-02','省级',null,null);
insert into adv_item values(401,'优秀学生干部','2011-09-02','省级',null,null);
##学生评优评先记录
insert into stu_adv_Info values(null,'20111826','优秀三好学生','省级','201301','校级已通过','无');
insert into stu_adv_Info values(null,'20111827','优秀学生干部','省级','201302','校级已通过','无');
insert into stu_adv_Info values(null,'20111826','优秀共青团员','省级','201301','校级已通过','无');
insert into stu_adv_Info values(null,'20111827','优秀学生干部','省级','201302','校级已通过','无');
insert into stu_adv_Info values(null,'20111826','优秀三好学生','省级','201301','校级已通过','无');
insert into stu_adv_Info values(null,'20111827','优秀共青团员','省级','201302','校级已通过','无');
insert into stu_adv_Info values(null,'20111826','优秀共青团员','省级','201301','校级已通过','无');
insert into stu_adv_Info values(null,'20111827','优秀学生干部','省级','201302','校级已通过','无');
##奖助学项目信息
insert into grant_item values(500,'国家奖学金','2011-10-02','国家级',8000,null,null);
insert into grant_item values(501,'国家励志奖学金','2011-10-02','国家级',5000,null,null);
##学生奖助学记录
insert into stu_grant_Info values(null,'20111826','国家奖学金','国家级',8000,'201301','校级已通过','无');
insert into stu_grant_Info values(null,'20111827','国家励志奖学金','国家级',5000,'201302','校级已通过','无');
##建档信息
insert into des_item values(900,'甲等',null);
insert into des_item values(null,'乙等',null);
insert into des_item values(null,'乙等',null);
##贫困生建档信息
insert into stu_des_Info values(null,'20111826','家庭较贫困','甲等','201301','校级已通过','无');
insert into stu_des_Info values(null,'20111827','家庭特贫困','乙等','201302','校级已通过','无');
##校级工作人员分配项目信息
select * from sch_prop_distribution;
insert into sch_prop_distribution values(null,100,100,0.10,'2014-09-08','2014-09-08','2014-09-28','201301');
insert into sch_prop_distribution values(null,101,100,0.10,'2014-09-08','2014-09-08','2014-09-28','201302');
##院级工作人员分配比例表
select * from col_prop_distribution;
insert into col_prop_distribution values(null,'3212',101,2,0.60,1.0,1.0,1.0,1.0,'2014-09-08','2014-09-08','2014-09-28','201302');
##班级分配人数表
select * from cla_prop_distribution;
insert into cla_prop_distribution values(null,'32120101','3212',101,10,'201302');

##创建视图(视图的列名是唯一的，当创建视图的时候必须保证去除重复的列)
##评优评先模块-学生评优评先记录视图
create view stu_advInfo_View 
as
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sa.advanceActivity,sa.advTime,sa.advLevel,sa.examState,sa.remarks
from stu_basic_info sb inner join stu_adv_info sa on sb.studentNo = sa.studentNo order by sa.advTime,sa.studentNo;
##奖助学模块-学生奖助学记录视图
create view stu_grantInfo_View 
as
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sc.rank,sd.desLevel,sg.activityName,sg.grantProperty,sg.grantTime,sg.grantMoney,sg.examState
from stu_basic_info sb inner join stu_grant_info sg on sb.studentNo = sg.studentNo inner join stu_class_grant sc on sc.studentNo = sg.studentNo inner join stu_des_info 
sd on sg.studentNo = sd.studentNo order by sg.grantTime,sg.studentNo;
##贫困生建档模块-贫困生记录视图
create view stu_desInfo_View 
as
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sb.address,sd.economy,sd.desLevel,sd.term,sd.examState,sd.remarks
from stu_basic_info sb inner join stu_des_info sd on sb.studentNo = sd.studentNo order by sd.term,sd.studentNo;