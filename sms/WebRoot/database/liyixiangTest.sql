select count(*) from teacher_role tr,role_info r 
		where tr.roleNo = r.roleNo and tr.teacherNo = '4321' and r.roleName like '%校级工作人员%' ; 


--delete
delete from role_purview;

--select
select * from tec_basic_info;
select * from purview_info;
select * from role_info;
select * from teacher_purview;
select * from teacher_role;
select * from role_purview;
select * from dep_info;
select * from dep_teacher;

--select test
select * from role_info where roleName like '%管理员';

--insert 
--测试发现 default约束是指插入固定字段时而不插入有default约束的字段，该
--字段才会默认，插入null时该字段就是null
--tec_basic_info
insert into tec_basic_info values('1234','jack',0,null,'江西',null,'离职',null,'2011-1-1',now(),'本科','已通过','无');
##将jack组
 
insert into tec_basic_info(teacherNo,teacherName,sex,nation,hometown,political,teacherTitle,titleTime,worktime,eduBackground,remarks) values('5678','cat',1,null,'江西',null,null,'2011-1-1',now(),'本科','无');
insert into tec_basic_info values('8765','arron',1,null,'江西',null,'在职',null,'2011-1-1',now(),'本科','已通过','无');
insert into tec_basic_info values('4321','tom',0,null,'江西',null,'在职',null,'2011-1-1',now(),'本科','已通过','无');
insert into tec_basic_info values('0000','admin',0,null,'江西',null,'在职',null,'2011-1-1',now(),'本科','已通过','无');
select * from role_info;
--role_info
insert into role_info values(null,'校级管理员',now(),'校级管理员角色,默认所有系统权限');
insert into role_info values(null,'学生',now(),'学生角色，固定权限');
insert into role_info values(null,'班主任',now(),'班主任角色');
insert into role_info values(null,'院级工作人员',now(),'院级工作人员角色');
insert into role_info values(null,'校级工作人员',now(),'校级工作人员角色');
insert into role_info values(null,'院级管理员',now(),'院级管理员角色');
insert into role_info values(null,'活动负责人',now(),'活动管理中的特殊角色');


--purview_info
insert into purview_info values(1,null,'功能模块','null');
insert into purview_info values(2,1,'学生基本信息模块','/studentInfo.jsp');
insert into purview_info values(3,1,'教师基本信息模块','/teacherInfo.jsp');
insert into purview_info values(4,1,'学生参与活动模块','/stuActivity.jsp');
insert into purview_info values(5,1,'活动管理信息模块','/ActivityManage.jsp');
insert into purview_info values(6,1,'班级奖学金信息模块','/classAward.jsp');
insert into purview_info values(7,1,'个人简历模块','/personInfo.jsp');
insert into purview_info values(8,1,'评优评先信息模块','/awardInfo.jsp');
insert into purview_info values(9,1,'奖助学金信息模块','/grantInfo.jsp');
insert into purview_info values(10,1,'贫困生建档模块','/activityInfo.jsp');
insert into purview_info values(11,1,'医保信息模块','/activityInfo.jsp');
insert into purview_info values(12,1,'角色管理','/roleManager.jsp');
insert into purview_info values(13,1,'分配权限管理','/allocationPurview.jsp');
insert into purview_info values(14,1,'分配角色管理','/allocationRole.jsp');
insert into purview_info values(15,1,'院系班级专业管理','/collegeClass.jsp');

insert into purview_info values(16,5,'活动信息列表','/activityList');
insert into purview_info values(17,5,'手动录入活动信息','/addActivity');
insert into purview_info values(18,5,'编辑活动信息','/editActivity');
insert into purview_info values(19,5,'删除活动','/deleteActivity');
insert into purview_info values(20,5,'导入活动','/importActivity');
insert into purview_info values(21,5,'导出活动','/exportActivity');
insert into purview_info values(22,5,'活动启动','/startActivity');
insert into purview_info values(23,5,'高级搜索','/searchActivity');
insert into purview_info values(24,5,'排序','/sortActivity');
insert into purview_info values(25,5,'审核活动信息','/auditActivity');
insert into purview_info values(26,5,'活动学分比例信息','/ScoreActivity');
--
insert into purview_info values(27,3,'查询教师基本信息','/showTeacherInfo');
insert into purview_info values(28,3,'编辑教师基本信息','/editTeacherInfo');
insert into purview_info values(29,3,'教师基本信息排序','/sortTeacherInfo');
insert into purview_info values(30,3,'教师基本信息高级搜索','/searchTeacherInfo');
insert into purview_info values(31,3,'导入教师基本信息','/importTeacherInfo');
insert into purview_info values(32,3,'手动录入教师基本信息','/addTeacherInfo');
insert into purview_info values(33,3,'导出教师基本信息','/exportTeacherInfo');
insert into purview_info values(34,3,'审核教师基本信息','/auditTeacherInfo');
insert into purview_info values(35,3,'教师基本信息列表','/teacherInfoList');

--teacher_role

insert into teacher_role values('1234',5);
insert into teacher_role values('4321',10);
insert into teacher_role values('5678',2);
insert into teacher_role values('5678',3);
insert into teacher_role values('8765',3);
insert into teacher_role values('4321',5);
insert into teacher_role values('0000',1);



--t_teacher_purview
insert into t_teacher_purview values('1234',4);

--role_purview
insert into role_purview values(4,2);
insert into role_purview values(4,3);
insert into role_purview values(4,4);
insert into role_purview values(4,27);
insert into role_purview values(4,28);
insert into role_purview values(4,29);
insert into role_purview values(4,30);
insert into role_purview values(4,31);

insert into role_purview values(5,2);
insert into role_purview values(5,3);
insert into role_purview values(5,4);
insert into role_purview values(5,27);
insert into role_purview values(5,28);
insert into role_purview values(5,29);
insert into role_purview values(5,30);
insert into role_purview values(5,31);

insert into role_purview values(3,2);
insert into role_purview values(3,5);
insert into role_purview values(3,16);
insert into role_purview values(3,17);
insert into role_purview values(3,18);

--insert
insert into dep_info(departNo,department,departBrief,departInfo) 
	values('1105','软件学院','','');
	
insert into dep_info(departNo,department,departBrief,departInfo) 
	values('1106','计信院','','');	
	
insert into dep_teacher values('1105','1234');	
insert into dep_teacher values('1106','1234');
insert into dep_teacher values('1105','4321');
	
--delete
delete from t_teacher_purview where teacherNo in ('5678') and purviewNo in (2,3);

--
select * from dep_info;

select r.roleName from role_info r,teacher_role tr
where r.roleNo = tr.roleNo and teacherNo = '1234';
select teacherNo,teacherName,sex,political,teacherTitle,worktime 
from tec_basic_info
where 1=1 and teacherNo='1234' and teacherName='jack';

--update教师属于那个部门

--update class_info set teacherNo='1234' where  classNo='21050100200903';
--update class_info set teacherNo='1234' where  classNo='11050100200908';
--update class_info set teacherNo='5678' where  classNo='11050101201013';
     
insert into dep_teacher values('1105','1234');
##select * from tec_basic_info;
 --  insert into dep_teacher values('1105','5678');
   
   --drop 
drop table if exists teacher_purview;
drop table if exists role_purview;
drop table if exists purview_info;
drop table if exists role_info;
drop table if exists teacher_role;
drop table if exists dep_teacher;
   
delete from teacher_role where teacherNo='1234' and roleNo = 4; 
  
select p.id,p.pid,p.purviewName,p.purviewUrl
		from role_purview rp,purview_info p
		where rp.purviewNo = p.id and
		rp.roleNo = 4;
		
		select r.roleNo,r.roleName from teacher_role tr,role_info r
		where teacherNo = '1234';

		select r.roleNo,r.roleName from teacher_role tr,role_info r
		where tr.roleNo = r.roleNo and r.roleName like '%院级工作人员%' and
		teacherNo = '1234';
		
insert into tec_info values('4321','11',4,"mm",1);		
select * from tec_info;