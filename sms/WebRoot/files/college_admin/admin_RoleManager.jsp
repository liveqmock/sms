<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_RoleManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>学生工作管理系统</title>
	
		<link href="./css/css.css" rel="stylesheet" type="text/css" />
		<link href="./css/style.css" rel="stylesheet" type="text/css" />
		<link href="./css/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="./css/arrow.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript">

var menuids = [ "suckertree1" ];

function buildsubmenus() {
	for ( var i = 0; i < menuids.length; i++) {
		var ultags = document.getElementById(menuids[i]).getElementsByTagName("ul");
		for ( var t = 0; t < ultags.length; t++) {
			ultags[t].parentNode.getElementsByTagName("a")[0].className = "subfolderstyle";
			ultags[t].parentNode.onmouseover = function() {
				this.getElementsByTagName("ul")[0].style.display = "block";
			};
			ultags[t].parentNode.onmouseout = function() {
				this.getElementsByTagName("ul")[0].style.display = "none";
			};
		}
	}
}

if (window.addEventListener)
	window.addEventListener("load", buildsubmenus, false);
else if (window.attachEvent)
	window.attachEvent("onload", buildsubmenus);
	
function sousuo() {
	window
			.open(
					"gaojisousuo.htm",
					"",
					"depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function selectAll() {
	var obj = document.fom.elements;
	for ( var i = 0; i < obj.length; i++) {
		if (obj[i].name == "delid") {
			obj[i].checked = true;
		}
	}
}

function unselectAll() {
	var obj = document.fom.elements;
	for ( var i = 0; i < obj.length; i++) {
		if (obj[i].name == "delid") {
			if (obj[i].checked == true)
				obj[i].checked = false;
			else
				obj[i].checked = true;
		}
	}
}

function link() {
	document.getElementById("fom").action = "addrenwu.htm";
	document.getElementById("fom").submit();
}
</script>
<script src="./js/date.js"></script>
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/testSearch.js"></script>
<script src="./js/jquery-ui-1.8.21.custom.min.js"></script>

</head>
  
  <body>
  
		<form name="fom"  method="post" action="">
		
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30">
					
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="./images/nav04.gif">

									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="21">
												<img src="./images/ico07.gif" width="20" height="18" />
											</td>
										  	<td width="538">
												<b>角色：</b>
												<select name="job" size="1">
													<option selected="selected">
														全部
													</option>
													<option>
														院级管理员
													</option>
													<option>
														校级工作人员
													</option>
													<option>
														学生
													</option>
 
												</select>
												
												<input name="Submit4" type="button" class="right-button02"
													value="查 询" />
													
													<b>排序:</b>
												<select name="排序">
													<option>
														创建时间 
													</option>
													<option>
														角色名称
													</option>
												</select>
											</td>
											<td width="77" align="left">
												<div class="suckerdiv">
													<ul id="suckertree1">
														<li>
															<a href="#">角色管理</a>
															<ul>
															 	<li>
																	<a href="javascript:alert('已进入编辑状态');">编辑</a>
																</li>
																<li>
																	<a href="#">删除</a>
																</li>
																<li>
																	<a href="#">录入</a>
																	<ul>
																		<li>
																			<a href="#">导入</a>
																		</li>
																		<li>
																			<a  href="files/college_admin/admin_addRole.jsp">手动录入</a>
																		</li>
																	</ul>
																</li>
															</ul>

														</li>
													</ul>
												</div>
											</td>
											 
											<td width="77" align="center">
												<a href="#" onclick="sousuo()"> <input name="Submit4"
														type="button" class="right-button07" value="导出" /> </a>
											 
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						
							<table id="subtree1" style="DISPLAY: " width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td class="CPanel">
										<div id="liulanbiao" style="margin-left: 10px">
											<table width="99%" border="0" cellpadding="0" cellspacing="0"
												class="CContent">
												<tr>
													<th class="tablestyle_title">
														当前位置： <a href="#" style="color:red;">角色管理</a> &gt;&gt; <a style="color:red;" href="#">查看角色信息</a> 
													</th>
												</tr>
												<tr>
													<td class="CPanel">
														<table width="100%" border="0" align="center"
															cellpadding="0" cellspacing="0">

															<tr>
																<td height="40" class="font42">
																	<table width="100%" border="0" cellpadding="4"
																		cellspacing="1" bgcolor="#464646" class="newfont03">
																		<tr class="CTitle">
																			<td height="22" colspan="13" align="center"
																				style="font-size: 16px">
																				角色信息表</td>
																		</tr>
																		<tr bgcolor="#EEEEEE">
																		  <td ><input type="checkbox" name="delid" />全选</td>
																			<td >角色编号</td>
																			<td >角色名称</td>
																			<td >创建时间</td>
																			<td>角色描述</td>
																		 </tr>
																		 <tr bgcolor="#FFFFFF">
																			<td><input type="checkbox" name="delid2" /></td>
																			<td>0323</td>
																			<td><a href="purview!showPurview">学生</a></td>
																			<td>2013-3-4</td>
																			<td>所有学生的权限</td>
																		</tr>
																		<tr bgcolor="#FFFFFF">
																			<td><input type="checkbox" name="delid2" /></td>
																			<td>0325</td>
																			<td><a href="files/college_admin/admin_rolePurview.jsp">班主任</a></td>
																			<td>2013-3-2</td>
																			<td>所有班主任的权限</td>
																		</tr>	
																		<tr bgcolor="#FFFFFF">
																			<td><input type="checkbox" name="delid2" /></td>
																			<td>0327</td>
																			<td><a href="rolePurview!showRolePurview?roleNo=4">校级工作人员</a></td>
																			<td>2013-3-5</td>
																			<td>所有校级管理员的权限</td>
																		</tr>	
																		<tr bgcolor="#FFFFFF">
																			<td><input type="checkbox" name="delid2" /></td>
																			<td>0328</td>
																			<td><a href="files/college_admin/admin_rolePurview.jsp">院级工作人员</a></td>
																			<td>2013-3-8</td>
																			<td>所有院级工作人员的权限</td>
																		</tr>			
																		</table>
																</td>
															</tr>
														</table>
														<table width="95%" border="0" align="center"
															cellpadding="0" cellspacing="0">
															<tr>
																<td height="6">
																	<img src="./images/spacer.gif" width="1" height="1" />
																</td>
															</tr>
															<tr>
																<td height="33">
																	<table width="100%" border="0" align="center"
																		cellpadding="0" cellspacing="0" class="right-font08">
																		<tr>
																			<td width="50%">
																				共
																				<span class="right-text09">5</span> 页 | 第
																				<span class="right-text09">1</span> 页
																			</td>
																			<td width="49%" align="right">
																				[
																				<a href="#" class="right-font08">首页</a> |
																				<a href="#" class="right-font08">上一页</a> |
																				<a href="#" class="right-font08">下一页</a> |
																				<a href="#" class="right-font08">末页</a>] 转至：
																			</td>
																			<td width="1%">
																				<table width="20" border="0" cellspacing="0"
																					cellpadding="0">
																					<tr>
																						<td width="1%">
																							<input name="textfield3" type="text"
																								class="right-textfield03" size="1" />
																						</td>
																						<td width="87%">
																							<input name="Submit23222" type="submit"
																								class="right-button06" value=" " />
																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>

													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
				</tr>
			</table>
		</form>
	</body>
</html>
