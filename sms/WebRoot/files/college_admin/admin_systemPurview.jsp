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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 
	<script src="<%=basePath%>/js/admin/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>/js/admin/jquery.cookie.js"></script>
	<script src="<%=basePath%>/js/admin/jquery.treeview.js"></script>
	<script src="<%=basePath%>/js/admin/lyx.js"></script>
	<script src="<%=basePath%>/js/testSearch.js"></script>
	<script src="<%=basePath%>/js/date.js"></script>
	
	<link href="<%=basePath%>/css/admin/jquery.treeview.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>/css/admin/screen.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>/css/admin/file.css" rel="stylesheet" type="text/css" />
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

function getChecked(roleNo){

	var array = new Array();

	$("input:checkbox:checked").each(function(){
		
		array.push($(this).siblings("input:hidden").val());
	
		window.location.href="Purview/updateRolePurview!renewPurview?array="+array+"&roleNo="+roleNo;
	
	});

}

</script>

 </head>
  
  <body >
		<form name="fom" id="fom" method="post" action="">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="<%=basePath%>/images/nav04.gif">

									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
										  <td width="250">											  
											  <strong>角色名称:</strong><font color="red"><s:property value="#parameters['roleName']"/></font>&nbsp;&nbsp;
										  </td>
										  
										  <td width="77" align="left">
												<div class="suckerdiv">
													<ul id="suckertree1">
														<li>
															<a href="#">权限管理</a>
															<ul>
															 	<li>
																	<a href="javascript:alert('已进入编辑状态');">编辑</a>
																</li>
															</ul>

														</li>
													</ul>
												</div>
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
			<!--显示权限树状图-->
						<div id=""  >

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<div id="lurubiao" style="margin-left: 10px">
											<table width="99%" border="0" cellpadding="0" cellspacing="0"
												class="CContent">
												<tr>
													<th class="tablestyle_title">
														 当前位置： <a href="#" style="color:red;">角色管理</a>&gt;&gt; <a href="./admin_jobManager.html" style="color:red">查看角色信息</a>&gt;&gt; <a style="color:red;" href="./admin_rolePurview.html">角色权限管理</a> 
													</th>
												</tr>
												<tr>
													<td class="CPanel">
														
										               <!--添加权限的表格-->
										               		<table width="100%" border="0" cellpadding="4"	cellspacing="1" bgcolor="#464646" class="newfont03">
																		<tr class="CTitle">
																			<td height="22" colspan="13" align="center"
																				style="font-size: 16px" width="100%">
																				权限列表
																			</td>
																		</tr>
																		<tr bgcolor="#FFFFFF">																		
																				<td  height="60"  width="100%">
																				
<!--  ----------- ----------- -----------权限界面开始---------- ------------------- -->																						
		<ul id="test">	
				<s:iterator value="purviewList" id="purviewParent" >	
					<s:if test='#purviewParent.pid==1' >	
						<li>
							<input type="checkbox" name="purview" 
							<s:iterator value="checkList" id="checkLists" >
								<s:property value="%{#purviewParent.id == #checkLists.id ? 'checked' : ''}"/>
							</s:iterator>	
							/>
							<input type="hidden" name="field＿name" value="<s:property value="#purviewParent.id"/>">
							<span class="folder">	
								<s:property value="#purviewParent.purviewName"></s:property>						
							</span>	
						
									<ul>
										<s:iterator value="purviewList" id="purviewChild">	
												<s:if test="#purviewParent.id==#purviewChild.pid">							
													<li>													
														<input type="checkbox" name="purview" 
																<s:iterator value="checkList" id="checkLists" >
																	<s:property value="%{#purviewChild.id == #checkLists.id ? 'checked' : ''}"/>
																</s:iterator>
														/>
														<input type="hidden" name="field＿name" value="<s:property value="#purviewChild.id"/>">
														<span class="file">	
															<s:property value="#purviewChild.purviewName"></s:property>						
														</span>	
													</li>
												</s:if>							
										</s:iterator>
									</ul>
									
								</li>	
							</s:if>		
				</s:iterator>
		</ul>	
<!--  ----------- ----------- -----------权限界面结束---------- ------------------- -->		
		
																				</td>
																		</tr>
										               		</table>
													
															<tr>
																<td colspan="2" align="center" height="30px">
																	<input type="button" name="submitPurview" value="提交"
																		class="button" onclick="getChecked(<s:property value="#parameters['roleNo']"/>)" />
																    <input type="button" name="cancel" value="取消"
																		class="button" onclick="" />
																	<input type="button" name="return" value="返回"
																		class="button" onclick="window.history.go(-1);"/>
																</td>
															</tr>
																													
														</table>
							                        </div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
					
		</form>
	</body>
</html>

