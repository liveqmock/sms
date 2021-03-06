drop Database StuManSys;

create Database StuManSys;
use StuManSys;

##学生登录信息表
create table stu_info 
(
	studentNo char(8) not null primary key,
	stuPassword varchar(12) not null
); 
##学生基本信息表
create table stu_basic_info
(
	studentNo char(8) not null primary key,
	stuName varchar(18) not null,
	sex int not null,
	stuClass varchar(30) not null,
	stuMajor varchar(30) not null,
	stuCollege varchar(30) not null,
	address varchar(60) not null,
	constraint FK_stuBasicInfo_stuInfo foreign key(studentNo) references stu_info(studentNo) on delete cascade
);
##学院表
create table dep_info
(
	departNo char(4) not null primary key,
	departName varchar(36) not null,
	depNumber int not null,
	freNumber int not null,
	sopNumber int not null,
	junNumber int not null,
	senNumber int not null
	
);
##班级表
create table class_info
(
	classNo char(14) primary key,
	departNo char(4) not null,
	className varchar(45) not null,
	girlNumber tinyint not null,
	classNumber int not null
);
##学生班级奖学金表
create table stu_class_grant
(
	studentNo char(8) not null,
	rank char(6) not null,
	term char(6) not null,
	primary key(studentNo,term)
);
##评优评先项目表
create table adv_item
(
	advNo int not null auto_increment primary key,
	advanceActivity varchar(60) not null,
	createTime date not null,
	advLevel varchar(30) not null,
	remarks varchar(150) default '无',
	advState tinyint default 0
)ENGINE = MyISAM;
create index adv_item_level_index on adv_item(advLevel);
##学生评优评先记录表
create table stu_adv_info
(
	awardNo int not null auto_increment primary key,
	studentNo char(8) not null,
	advanceActivity varchar(60) not null,
	advLevel varchar(30) not null,
	advTime char(6) not null,
	examState varchar(30) not null,
	remarks varchar(150) not null,
	constraint FK_stuAdvInfo_stuBasicInfo foreign key(studentNo) references stu_basic_info(studentNo)
);
create index adv_info_stuNo_index on stu_adv_info (studentNo);
create index adv_info_state_index on stu_adv_info (advanceActivity,advTime);
##奖助学项目表
create table grant_item 
(
	grantNo int auto_increment primary key,
	activityName varchar(30) not null,
	createTime date not null,
	grantProperty varchar(30) not null,
	grantMoney int not null,
	remarks varchar(150) default '无',
	grantState tinyint default 0
)ENGINE = MyISAM;
create index grant_item_index on grant_item(grantProperty,grantMoney);
##学生奖助学记录表
create table stu_grant_info 
(
	awardNo int not null auto_increment primary key,
	studentNo char(8) not null,
	activityName varchar(30) not null,
	grantProperty varchar(30) not null,
	grantMoney int not null,
	grantTime char(6) not null,
	examState varchar(30) not null,
	remarks varchar(150) not null,
	constraint FK_stuGrantInfo_stuBasicInfo foreign key(studentNo) references stu_basic_info(studentNo)
);
create index grant_info_stuNo_index on stu_grant_info (studentNo);
create index grant_info_state_index on stu_grant_info (activityName,grantTime);
##贫困建档项目表
create table des_item
(
	povertyId int auto_increment primary key,
	desLevel varchar(12) not null,
	desState tinyint default 0
)ENGINE = MyISAM;

##贫困生建档记录表
create table stu_des_info
(
	awardNo int not null auto_increment primary key,
	studentNo char(8) not null,
	economy varchar(255) not null,
	desLevel varchar(12) not null,
	term char(6) not null,
	examState varchar(30) not null,
	remarks varchar(150) not null,
	constraint FK_stuDesInfo_stuBasicInfo foreign key(studentNo) references stu_basic_info(studentNo)
);
create index des_info_stuNo_index on stu_des_info (studentNo);
create index des_info_state_index on stu_des_info (desLevel,term);
##校级工作人员分配项目比例表(term属性值获取当前时间进行判断计算在插入)
create table sch_prop_distribution 
(
	autoNo int auto_increment primary key,
	propNo int not null,
	awardNum int not null,
	proposition decimal(3,2) not null,
	allocateTime date not null,
	startTime date not null,
	endTime date not null,
	term char(6) not null
);
create index sch_prop_propNo_index on sch_prop_distribution(propNo);
create index sch_prop_term_index on sch_prop_distribution(term);
##院级工作人员分配比例表
create table col_prop_distribution
(
	autoNo int auto_increment primary key,
	departNo char(4) not null,
	propNo int not null,
	awardNum int not null,
	proposition decimal(3,2) not null,
	freProposition decimal(3,2) default 1.0,
	SopProposition decimal(3,2) default 1.0,
	junProposition decimal(3,2) default 1.0,
	senProposition decimal(3,2) default 1.0,
	allocateTime date not null,
	startTime date not null,
	endTime date not null,
	term char(6) not null,
	constraint FK_colPropDist_schPropDist_propNo foreign key(propNo) references sch_prop_distribution(propNo),
	constraint FK_colPropDist_schPropDist_departNo foreign key(departNo) references dep_info(departNo)
);
create index col_prop_join_index on col_prop_distribution(departNo,propNo);
create index col_prop_term_index on col_prop_distribution(term);
##班级分配人数表
create table cla_prop_distribution
(
	autoNo int auto_increment primary key,
	classNo char(14) not null,
	departNo char(4) not null,
	propNo int not null,
	awardNum int not null,
	term char(6) not null,
	constraint FK_claPropDist_colPropDist_propNO foreign key(propNo) references col_prop_distribution(propNo),
	constraint FK_claPropDist_colPropDist_departNo foreign key(departNo) references dep_info(departNo),
	constraint FK_claPropDist_colPropDist_classNo foreign key(classNo) references class_info(classNo)
);
create index cla_prop_join_index on cla_prop_distribution(departNo,classNo,propNo);
create index cla_prop_term_index on cla_prop_distribution(term);
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


##创建存储过程(参数：输入型参数、输出型参数)
	##获奖人数统计
		create procedure count_award_number(in modeId varchar(8),in classNo char(14),out awardProp float(3,2),out classNumber int,out awardNumber int,
											in awardTime char(6),in itemlevel varchar(30),in itemName varchar(60),in examState varchar(30))
			begin 
				if modeId = '0101' then
					select count(*) into awardNumber from stu_advInfo_View sav where sav.advTime = awardTime and sav.advLevel = itemlevel and sav.advanceActivity = itemName and sav.examState = examState;
				else if modeId = '0202' then
					select count(*) into awardNumber from stu_grantInfo_View sgv where sgv.grantTime = awardTime and sgv.grantproperty = itemlevel and sgv.activityName = itemName and sgv.examState = examState;
				else 
					select count(*) into awardNumber from stu_desInfo_View sdv where sdv.term = awardTime and sdv.desLevel = itemlevel and sdv.examState = examState;
				end if;
				end if;
				select classNumber into classNumber from class_info where classNo = classNo;
				set awardProp = awardNumber/classNumber;
			end
		
		call count_award_number('0101','32120101',@awardProp,@classNumber,@awardNumber,'201301','省级','优秀三好学生','校级已通过');
	##班级人数统计
		create procedure count_number(in id varchar(14),in _type int,out girlProp float(3,2),out totalNum int,out girlNum int)
			begin 
			if _type = '01' then
				select depNumber,girlNumber into totalNum,girlNum from dep_info where departNo = id;
			else 
				select classNumber,girlNumber into totalNum,girlNum from class_info where classNo = id;
			end if;
				set girlProp = girlNum/totalNum;
			end
		
		call count_number('32120101','02',@girlProp,@totalNUm,@girlNum);
	##比例分配模块
	  ##校级工作人员
	  	create procedure sch_prop_proc(in awardNum int) 
				begin 
					select * from stu_advInfo_View sav where sav.studentNo = stuNo;
				end	
	 	CALL  stu_adv_select_proc('20111826');
 ##创建触发器(加强约束以及规范相应的级联关系)
 	##注意:
 	##delimtier |
 	create trigger schPropDistribution after update on sch_prop_distribution 
 	for each row begin
 		declare i int;
 		declare schoolNum int;
 		declare collegeNumber int;
 		declare numOfCollege int;
 		declare depNo char(4);
 		declare proposition decimal(3,2);
 		set i = 1;
 		select count(*) into schoolNum from stu_basic_info;  
 		select count(*) into numOfCollege from dep_info;
 		
 		drop temporary table if exists depInfoTb;
 		create temporary table depInfoTb
 		(
 			autoNo int auto_increment primary key,
			departNo char(4) not null
 		);
 		
 		insert into depInfoTb select null,departNo from col_prop_distribution where propNo = new.propNo and term = new.term;
 		
 		if new.awardNum != old.awardNum then 
 			set proposition = ROUND(new.awardNum/schoolNum,2);
 			update col_prop_distribution set proposition = proposition where propNo = old.propNo and term = old.term;
 			while i<=numOfCollege do
 			select departNo into depNo from depInfoTb where autoNo = i;
 			select depNumber into collegeNumber from dep_info where departNo = depNo;
 			set collegeNumber = ROUND(collegeNumber*proposition,0);
 			update col_prop_distribution set awardNum = collegeNumber where departNo = depNo and propNo = old.propNo and term = old.term;
 			set i = i + 1;
 			end while;
 		end if;
 	end
	
	update sch_prop_distribution set awardNum = 250 where propNo = 101 and term = '201302';
	
	create trigger colPropDistribution after update on col_prop_distribution 
 	for each row begin
 		declare i int;
 		declare collegeNum int;
 		declare proposition decimal(3,2);
 		declare classNum int;
 		declare numOfClass int;
 		declare classes char(14);
 		set i = 1;
 		select depNumber into collegeNum from dep_info where departNo = old.departNo;
 		select count(*) into numOfClass from class_info where departNo = old.departNo;
 		drop temporary table if exists classInfoTb;
 		create temporary table classInfoTb
 		(
 			autoNo int auto_increment primary key,
			classNo char(14) not null
 		);
 		insert into classInfoTb select null,classNo from cla_prop_distribution where propNo = old.propNo and term = old.term;
 		if new.awardNum != old.awardNum then 
 			set proposition = ROUND(new.awardNum/collegeNum,2);
 			while i<=numOfClass do
 			select classNo into classes from classInfoTb where autoNo = i;
 			select classNumber into classNum from class_info where classNo = classes;
 			set classNum = ROUND(classNum*proposition,0);
 			update cla_prop_distribution set awardNum = classNum where classNo = classes and propNo = old.propNo and term = old.term;
 			set i = i + 1;
 			end while;
 		end if;
 	end

 	select * from col_prop_distribution;
 	update col_prop_distribution set awardNum = 1 where propNo = 101 and departNo = '3212' and term = '201302';
 	##delimtier ;
 	insert into col_prop_distribution values(null,'3212',101,2,propsition,1.0,1.0,1.0,1.0,'2014-09-08','2014-09-08','2014-09-28','201301');
 	update sch_prop_distribution set awardNum = 1 where propNo = 101;
 	
 	create trigger schPropDistribution after update on sch_prop_distribution 
 	for each row begin
 		declare i int;
 		declare schoolNum int;
 		declare collegeNum int;
 		declare numOfCol int;
 		declare propsition decimal(3,2);
 		set i = 0;
 		select count(*) into schoolNum from stu_basic_info; 
 		select count(*) into numOfCol from col_prop_distribution;
 		if new.awardNum != old.awardNum then 
 			set propsition = ROUND(awardNum/schoolNum,2);
 			update col_prop_distribution set propsition = propsition where propNo = old.propNo and term = old.term;
 		end if;
 	end
 	
	create trigger advItem_delete before delete on adv_item 
	for each row begin
		
	end 
##select语句如下:
##评优评先
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sa.advanceActivity,sa.advTime,sa.advLevel,sa.examState,sa.remarks
from stu_basic_info sb inner join stu_adv_info sa on sb.studentNo = sa.studentNo;
##奖助学金
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sc.rank,sd.desLevel,sg.activityName,sg.grantProperty,sg.grantTime,sg.grantMoney,sg.examState
from stu_basic_info sb inner join stu_grant_info sg on sb.studentNo = sg.studentNo inner join stu_class_grant sc on sc.studentNo = sg.studentNo inner join stu_des_info 
sd on sg.studentNo = sd.studentNo order by sg.grantTime,sg.studentNo;
##贫困生建档
select sb.studentNo,sb.stuName,sb.sex,sb.stuCollege,sb.stuMajor,sb.stuClass,sb.address,sd.economy,sd.desLevel,sd.term,sd.examState,sd.remarks
from stu_basic_info sb inner join stu_des_info sd on sb.studentNo = sd.studentNo;

##测试数据
##学院信息
insert into dep_info values('3212','软件学院',2500,600,600,600,700);
insert into dep_info values('3121','外国语学院',1000,300,300,300,100);
##班级信息
select * from class_info;
insert into class_info values('32120101','3212','软件1111班',20,38);
##学生登录信息
insert into stu_info values('20111826','ruanjian11');
insert into stu_info values('20111827','ruanjian12');
##学生基本信息
insert into stu_basic_info values('20111826','赖辉强',1,'软件1111班','软件+英语','软件学院','江西南昌');
insert into stu_basic_info values('20111827','李二狗',0,'软件1101班','软件开发','软件学院','江西赣州');
##学生班级奖学金信息
insert into stu_class_grant values('20111826','一等','201301');
insert into stu_class_grant values('20111826','二等','201302');
##评优评先项目信息
insert into adv_item values(400,'优秀三好学生','2011-09-02','省级',null,null);
insert into adv_item values(401,'优秀学生干部','2011-09-02','省级',null,null);
##学生评优评先记录
insert into stu_adv_Info values(null,'20111826','优秀三好学生','省级','201301','校级已通过','无');
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

 


