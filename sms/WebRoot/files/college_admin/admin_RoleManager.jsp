<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@  taglib prefix="s" uri="/struts-tags" %>
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
	
		<script src="<%=basePath%>/js/jquery-1.10.2.js"></script>
		<script src="<%=basePath%>/js/admin/jquery.cookie.js"></script>
		<script src="<%=basePath%>/js/admin/jquery.treeview.js"></script>
		<script src="<%=basePath%>/js/date.js"></script>
		<script src="<%=basePath%>/js/testSearch.js"></script>
	
		<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/arrow.css" rel="stylesheet" type="text/css" />

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

</head>
  
<body>	
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30">
					
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="<%=basePath%>/images/nav04.gif">

									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="21">
												<img src="<%=basePath%>/images/ico07.gif" width="20" height="18" />
											</td>
										  	<td width="538">
										  	
										  	<form action="RoleManager/role!searchRole" method="post" id="searchForm"> 
										  	<b>请输入角色名称：</b> 	
												<input name="searchRole" type="text"/>											
												<input name="select" type="submit" class="right-button02" value="查询" />
												
												&nbsp;&nbsp;	
											
											<b>排序:</b>
												<select name="sort">
													<option>
														角色编号 
													</option>
													<option>
														创建时间
													</option>
												</select>
												</form>
											</td>
											<td width="77" align="left">
												<div class="suckerdiv">
													<ul id="suckertree1">
														<li>
															<a href="#">角色管理</a>
															<ul>
															 	<li>
																	<a href="">编辑</a>
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
																			<a  href="RoleManager/rolePurview!PurviewDisplay">手动录入</a>
																		</li>
																	</ul>
																</li>
															</ul>

														</li>
													</ul>
												</div>
											</td>
											 
											<td width="77" align="center">
												<a href="#" onclick=""> <input name="Submit4" type="button" class="right-button07" value="导出" /> </a>
											 
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
																		  	<td><input type="checkbox" name="delid" />全选</td>
																			<td>角色编号</td>
																			<td>角色名称</td>
																			<td>创建时间</td>
																			<td>角色描述</td>
																		 </tr>
		
<!--迭代开始-->																										
															<s:iterator value="roleInfoList" id="roleInfoList" >																																		
																		<tr bgcolor="#FFFFFF">
																			<td><input type="checkbox" name="delid2" /></td>
																			<td><s:property value="#roleInfoList.roleNo"></s:property>		</td>
																			<td><a href="Purview/purview!showPurviewByCondition?roleNo=<s:property value="#roleInfoList.roleNo"></s:property>&roleName=<s:property value="#roleInfoList.roleName"></s:property>"><s:property value="#roleInfoList.roleName"></s:property></a></td>
																			<td><s:property value="#roleInfoList.createTime"></s:property></td>
																			<td><s:property value="#roleInfoList.roleDescription"></s:property></td>
																		</tr>	
															</s:iterator>
<!--  -->																			
																		
																				
																		</table>
																</td>
															</tr>
														</table>
														<table width="95%" border="0" align="center"
															cellpadding="0" cellspacing="0">
															<tr>
																<td height="6">
																	<img src="<%=basePath%>/images/spacer.gif" width="1" height="1" />
																</td>
															</tr>
															<tr>
																<td height="33">
																	<table width="100%" border="0" align="center"
																		cellpadding="0" cellspacing="0" class="right-font08">
																		<tr>
																			<td width="50%">
																				共<span class="right-text09">${pageNum}</span> 页 |
																			   第<span class="right-text09">${currentPage}</span> 页
																			</td>
																			<td width="49%" align="right">
																				[																		
																				<a href="<%=basePath%>/RoleManager/role!roleExecute?currentPage=1" class="right-font08">首页</a> |	
																				<a href="<%=basePath%>/RoleManager/role!roleExecute?currentPage=${currentPage-1}" class="right-font08">上一页</a> |																																						
																				<a href="<%=basePath%>/RoleManager/role!roleExecute?currentPage=${currentPage+1}" class="right-font08">下一页</a> |
																				<a href="<%=basePath%>/RoleManager/role!roleExecute?currentPage=${pageNum}" class="right-font08">末页</a>
																				] 
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
	</body>
</html>
