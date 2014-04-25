<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生工作管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=basePath%>css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/college/tanchu.css">
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/arrow.css" rel="stylesheet" type="text/css" />

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.demo {
	border: solid 1px #D5D5D5;
	border-collapse: collapse;
	width: 100%;
}

.demo td {
	border: 1px solid #D5D5D5;
	font-size: 12px;
	padding: 7px 5px;
}

.demo th {
	background-color: #EEE;
	border-right: 1px solid #D5D5D5;
	font-size: 13.5px;
	line-height: 120%;
	font-weight: bold;
	padding: 8px 5px;
	text-align: left;
}
</style>
<script src="<%=basePath%>js/jquery-1.10.2.js"></script>
<script src="<%=basePath%>js/jquery.chromatable.js"></script>
<script src="<%=basePath%>js/college/college.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#tableID").chromatable({
			width : "100%",

			scrolling : "yes"
		});

	});
</script>
</head>

<body>
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
										<td width="2%"><img src="<%=basePath%>/images/ico07.gif"
											width="20" height="18" />
										</td>
										<td width="70%">学院： <select name="学院">
												<option>软件学院</option>
												<option>马克思主义学院（政治学院）</option>
										</select> 专业： <select name="专业">
												<option>请选择</option>
												<option>软件工程</option>
												<option>数字媒体</option>
												<option>软件英语</option>
										</select> 班级： <select name="班级">
												<option>请选择</option>
												<option>1101</option>
												<option>1102</option>
												<option>1103</option>
												<option>1104</option>
										</select> <input name="textfield" type="text" size="16"
											value="请输入学号或者姓名" /> <input name="Submit4" type="button"
											class="right-button02" value="查 询" /> 排序 <select name="排序">
												<option>学号升序</option>
												<option>学号降序</option>
										</select>
										</td>
										<td width="15%" align="center"
											style="position:relative;left:-80px">
											<div class="suckerdiv">
												<ul id="suckertree1">
													<li><a href="#">信息管理</a>
														<ul>
															<li><a href="#">编辑</a>
																<ul>
																	<li><a onclick="edit()" href="#">修改</a>
																	</li>
																	<li><a onclick="edit()" href="#">删除</a>
																	</li>
																</ul>
															</li>
															<li><a href="#">录入</a>
																<ul>
																	<li><a href="#" onclick="manually()">手动录入</a>
																	</li>
																	<li><a href="#">导入</a>
																	</li>
																</ul>
															</li>
															<li><a
																href="<%=basePath%>files/college/dept_advanceInfo/dept_advanceInfo_proportion.jsp">分配比例</a>
															</li>
														</ul>
													</li>
												</ul>
											</div>
										</td>
										<td width="6%" align="center"><a href="#"
											onclick="sousuo()"> <input name="Submit3" type="button"
												class="right-button07" value="高级搜索"
												onclick="popup('#advancedDiv', '#advancedSearchDiv', '#CloseadvancedSearch')" />
										</a>
										</td>

										</td>
										<td width="6%" align="center"><a href="#"
											onclick="sousuo()"> <input name="Submit4" type="button"
												class="right-button07" value="导出" /> </a>
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
					<div id="allbasicMsg" style="display: block">
						<table id="subtree1" style="DISPLAY: " width="100%" border="0"
							cellspacing="0" cellpadding="0">
							<tr>
								<td class="CPanel">
									<div id="liulanbiao" style="margin-left: 10px">
										<table width="99%" border="0" cellpadding="0" cellspacing="0"
											class="CContent">
											<tr>
												<th class="tablestyle_title">当前位置：评优评先页面<span
													style="position:relative;left:950px"><a
														href="dept_advanceInfo/dept_advanceInfo_verify.html"><font
															color="red">待审核信息</font> </a>(3)</span>
												</th>
												</th>
											</tr>
											<tr>
												<td class="CPanel" align="center">
													<table width="96%" border="0" align="center"
														cellpadding="0" cellspacing="0">

														<tr>
															<td height="40" class="font42">
																<table width="100%" border="0" cellpadding="4"
																	cellspacing="1" bgcolor="#464646" class="demo"
																	id="tableID">
																	<thead>
																		<tr class="CTitle">
																			<td height="22" colspan="12" align="center"
																				style="font-size: 16px">评优评先信息表</td>
																		</tr>
																		<tr bgcolor="#EEEEEE" align="center">
																			<th width="2%"><center>
																					<input type="checkbox" />
																				</center></th>
																			<th width="3%">
																				<center>学号</center>
																			</th>
																			<th width="3%">
																				<center>姓名</center>
																			</th>
																			<th width="3%">
																				<center>性别</center>
																			</th>
																			<th width="4%">
																				<center>专业</center>
																			</th>
																			<th width="5%">
																				<center>班级</center>
																			</th>
																			<th width="8%">
																				<center>先进项目</center>
																			</th>
																			<th width="5%">
																				<center>获奖时间</center>
																			</th>
																			<th width="7%">
																				<center>级别</center>
																			</th>
																			<th width="7%">
																				<center>审核状态</center>
																			</th>
																			<th width="3%">
																				<center>备注</center>
																			</th>
																		</tr>

																	</thead>
																	<tr bgcolor="#FFFFFF" align="center">

																		<td><input type="checkbox" /></td>
																		<td><a href="#"
																			onclick="popup('#stuPastAdvInfoDiv', '#StuPastAdvInfoDiv', '#ClosePastAdvInfo')">20101428</a>
																		</td>
																		<td>陈鹏</td>
																		<td>男</td>
																		<td>软件开发</td>
																		<td>软件1001</td>
																		<td>优秀三好学生</td>
																		<td>2011-04-20</td>
																		<td>国家级</td>
																		<td>通过</td>
																		<td>无</td>

																	</tr>
																</table>
															</td>
														</tr>
													</table>
													<table width="95%" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="6"><img src="<%=basePath %>images/spacer.gif"
																width="1" height="1" />
															</td>
														</tr>
														<tr>
															<td height="33">
																<table width="100%" border="0" align="center"
																	cellpadding="0" cellspacing="0" class="right-font08">
																	<tr>
																		<td width="50%">共 <span class="right-text09">5</span>
																			页 | 第 <span class="right-text09">1</span> 页</td>
																		<td width="49%" align="right">[ <a href="#"
																			class="right-font08">首页</a> | <a href="#"
																			class="right-font08">上一页</a> | <a href="#"
																			class="right-font08">下一页</a> | <a href="#"
																			class="right-font08">末页</a>] 转至：</td>
																		<td width="1%">
																			<table width="20" border="0" cellspacing="0"
																				cellpadding="0">
																				<tr>
																					<td width="1%"><input name="textfield3"
																						type="text" class="right-textfield03" size="1" />
																					</td>
																					<td width="87%"><input name="Submit23222"
																						type="submit" class="right-button06" value=" " />
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
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div id="StuPastAdvInfoDiv" style="display: none">
		<h2>
			评优评先<a href="#" id="ClosePastAdvInfo">关闭</a>
		</h2>
		<div class="form">
			<table width="100%" border="0" cellpadding="4" cellspacing="1"
				bgcolor="#464646" class="demo" id="pastAdvInfoTab">
				<thead>
					<tr class="CTitle">
						<td height="22" colspan="10" align="center"
							style="font-size: 16px">学生曾获荣誉信息表</td>
					</tr>

					<tr bgcolor="#FFFFFF" align="center">
						<th width='15%' name='projectName'>先进项目类型</th>
						<th width='15%' name='projectName'>级别</th>
						<th width='15%' name='projectName'>时间</th>
						<th width='20%' name='projectName'>备注</th>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%' name='projectName'>优秀三好学生</td>
						<td width='15%' name='projectName'>校级</td>
						<td width='15%' name='projectName'>2011-5-30</td>
						<td width='20%' name='projectName'>无</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%' name='projectName'>优秀学生干部</td>
						<td width='15%' name='projectName'>校级</td>
						<td width='15%' name='projectName'>2012-4-23</td>
						<td width='20%' name='projectName'>无</td>
					</tr>
			</table>
		</div>
	</div>


	<div id="advancedSearchDiv" style="display: none">
		<h2>
			高级查询选项<a href="#" id="CloseadvancedSearch">关闭</a>
		</h2>
		<div class="form">
			<table width="50%" border="0" cellpadding="4" cellspacing="1"
				bgcolor="#464646" class="demo" id="advancedSearchTab">
				<thead>

					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%'>性别</td>
						<td width='35%' name='sex'><input name="sex" type="radio"
							value="sex" checked />男 <input name="sex" type="radio"
							value="sex" />女</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%' name='projectName'>先进项目</td>
						<td width='35%'><select name="awardTitle">
								<option>优秀三好学生</option>
								<option>最佳三好学生</option>
								<option>优秀学生干部</option>
								<option>最佳学生干部</option>
								<option>优秀团员</option>
								<option>优秀团干部</option>
								<option>最佳学生干部</option>
						</select>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%'>级别</td>
						<td width='35%'><select name="awardLevel">
								<option>院级</option>
								<option>校级</option>
								<option>厅级</option>
								<option>省级</option>
								<option>国家级</option>
						</select>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td width='15%'>审核状态</td>
						<td width='35%'><select name="checkState">
								<option>未提交</option>
								<option>通过</option>
								<option>院级审核中</option>
								<option>校级审核中</option>
								<option>院级未通过</option>
								<option>校级未通过</option>
						</select>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<!--使用juquery的时间插件-->
						<td width='15%'>获奖时间</td>
						<td width='35%'><select name="awardTerm">
								<option>2011-2012</option>
								<option>2012-2013</option>
						</select>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" align="center">
						<td colspan="2"><input type="button" value="查询" /></td>
					</tr>
			</table>
		</div>
	</div>
</body>
</html>
