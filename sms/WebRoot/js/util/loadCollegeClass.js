var form = $("#collegeList");
var collegeSelect = $("<select name='departNo' >");
var majorSelect = $("<select name='majorNo' >");
var classSelect = $("<select name='classNo' >");
$(document).ready(function() {
	console.log("加载学院班级信息开始!");
	console.log("初始化表单");

	initForm();
	console.log("初始化监听器");
	initCollegeListener();
	initMajorListener();
	setCollegeData();

});

/**
 * 通过后台显示的数据显示下拉框,后台需要传入{college:1,major:1,class:1}和最头的data 
 * 然后在callback中添加select和　监听事件
 * @param data
 */

//获取学院信息
function setCollegeData() {
	$.getJSON("college/college!showCollege?type=depart", function(data) {
		var depInfos = data.depInfos;
		$.each(depInfos, function(index, value) {
			var departNo = value.departNo;
			var department = value.department;

			var option = $("<option value='" + departNo + "' >" + department
					+ "</option>");
			collegeSelect.append(option);
		});
	});
}
//获取专业信息
function setMajorData(value) {
	$.getJSON("college/college!showCollege?type=major&departNo="+value,function(data){
		var majors = data.majors;
		majorSelect.empty();
		var firstMajorData = $("<option value='-1'>全部</option>");
		majorSelect.append(firstMajorData);
		$.each(majors, function(index, value) {
			var major = value.major;
			var majorNo = value.majorNo;
			var option = $("<option value='" + majorNo + "' >" + major
					+ "</option>");
			majorSelect.append(option);
		});
	});
}
//初始化学院下拉框的监听事件
function initCollegeListener() {
	collegeSelect.change(function(){
		var value = $(this).val();
		if(value!=-1){
	    setMajorData(value);
	    
		}else{
			alert("请选择具体的学院");
		}
	 });
}
//初始化专业的下拉框的监听事件
function initMajorListener() {
	
	majorSelect.change(function(){
		var value = $(this).val();
		var url  = "college/college!showCollege?type=class";
		var college = collegeSelect.val();
		if(value==-1&& college==-1){
	       alert("请选择学院");
	       return ;
		}else if(value==-1&& college!=-1){
			url=url+"&departNo="+college;
		}else if(value!=-1){
			url=url+"&majorNo="+value;
		}
		
		$.getJSON(url,function(data){
			
			var classs = data.classInfos;
			classSelect.empty();
			var firstMajorData = $("<option value='-1'>全部</option>");
			classSelect.append(firstMajorData);
			$.each(classs, function(index, value) {
				var className = value.className;
				var classNo = value.classNo;
				var option = $("<option value='" + classNo + "' >" + className
						+ "</option>");
				classSelect.append(option);
			});
		});
	 });
}
//初始化表单
function initForm() {
	var firstMajor = $("<option value='-1'>无</option>");
	var firstMajorData = $("<option value='-1'>全部</option>");
	var firstClassData = $("<option value='-1'>全部</option>");
	var input = $("<input name='student' value='输入学号或者姓名' size='12'>");
	var button = $("<input type='submit' value='查询'>");
	//插入下拉框
	form.append("学院");
	collegeSelect.appendTo(form);
	form.append("方向");
	majorSelect.appendTo(form);
	form.append("班级");
	classSelect.appendTo(form);
	collegeSelect.append(firstMajor);
	majorSelect.append(firstMajorData);
	classSelect.append(firstClassData);
	input.appendTo(form);
	button.appendTo(form);
}
