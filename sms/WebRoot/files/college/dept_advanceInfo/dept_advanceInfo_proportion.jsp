<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'dept_advanceInfo_proportion.jsp' starting page</title>

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
<link href="<%=basePath%>css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
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
<!--只读形式-->
.readonly{
border:none; 
background-color:inherit;
width:50px;
}
</style>
</head>
<script src="<%=basePath%>js/jquery-1.10.2.js"></script>
<script src="<%=basePath%>js/jquery.chromatable.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#modifyMyBasicInfoBtn').click(function(){ 
				 edit('editProportion');
				 $(this).parents('#PropItemInfo') // For each element, pick the ancestor that's a form tag.
					   .find(':input') // Find all the input elements under those.
					   .each(function(i) {
						$(this).prop("readonly",false);
						$(this).removeClass("readonly");
		});
				
	});
		
		$("#tableID").chromatable({
			width : "100%",
			scrolling : "yes"
		});

	});
</script>
<script src="<%=basePath%>js/college/college.js"></script>

<body>
	<form name="fom" id="fom" method="post" action="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="62" background="<%=basePath%>images/nav04.gif">

								<table width="98%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="21"><img src="<%=basePath%>images/ico07.gif"
											width="20" height="18" /></td>
										<td width="538">学院： <select name="学院">
												<option>软件学院</option>
										</select></td>
										<td width="77" align="center"
											style="position:relative;left:-100px">
											<div class="suckerdiv">
												<ul id="suckertree1">
													<li><a href="#">分配</a>
														<ul>
															<li><a
																onclick="popup('#advProportion', '#AdvProportion', '#btnCloseAdvProportion')">先进项目比例</a>
															</li>
														</ul></li>
												</ul>
											</div></td>
										<td width="77" align="center"><a href="#"
											onclick="sousuo()"> <input name="Submit3" type="button"
												class="right-button07" value="高级搜索" /> </a></td>
										<td width="77" align="center"><a href="#"
											onclick="sousuo()"> <input name="Submit4" type="button"
												class="right-button07" value="导出" /> </a></td>
									</tr>
								</table></td>
						</tr>
					</table></td>
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
												<th class="tablestyle_title">当前位置：<a
													href="../dept_advanceInfo.html">评优评先页面</a>--->分配比例 <span
													style="position:relative;right:-650px"> <font
														size="2" color="red">先进项目类型</font> <select
														style="font-size:8px">
															<option>请选择</option>
															<option>优秀三好学生</option>
															<option>优秀学生干部</option>
															<option>最佳三好学生</option>
															<option>最佳学生干部</option>
															<option>优秀团员</option>
															<option>优秀团干部</option>
													</select> </span> <span style="position:relative;right:-650px"> <font
														size="2" color="red">性质</font> <select
														style="font-size:8px">
															<option>请选择</option>
															<option>院级</option>
															<option>校级</option>
															<option>省级</option>
													</select> </span></th>
											</tr>
											<tr id="allbasicMsg">

												<td class="CPanel" align="center">
													<table width="96%" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td height="40" class="font42">
																<table width="100%" border="0" cellpadding="4"
																	cellspacing="1" bgcolor="#464646" class="demo"
																	id="tableID">
																	<tr class="CTitle">
																		<td height="22" colspan="18" align="center"
																			style="font-size: 16px">XXX分配表（<font color="red">总人数：25</font>）
																		</td>
																	</tr>
																	<tr bgcolor="#EEEEEE" align="center">
																		<td width="40%"><b>年级</b></td>
																		<td><B>比例</B>
																		</td>
																		<td width="40%"><b>分配人数</b></td>
																		<td width="15%"><B>调整</B></td>
																	</tr>
																	<tr bgcolor="#DDDDDD" align="center">
																		<td><a 
																				onclick="popup('#advNum', '#AdvNum', '#btnCloseAdvNum')">大一</a>
																		</td>
																		<td>25%</td>
																		<td>5</td>
																		<td><img src="<%=basePath%>images/turnUp1.jpg"
																			style="width:10px;height:10px;" onclick="alert('up')">
																			<img src="<%=basePath%>images/turnDown1.jpg"
																			style="width:10px;height:10px;"
																			onclick="alert('down')"></td>
																	</tr>
																	<tr bgcolor="#EEEEEE" align="center">
																		<td><a onclick="">大二</a>
																		</td>
																		<td>25%</td>
																		<td>5</td>
																		<td><img src="<%=basePath%>images/turnUp1.jpg"
																			style="width:10px;height:10px;" onclick="alert('up')">
																			<img src="<%=basePath%>images/turnDown1.jpg"
																			style="width:10px;height:10px;"
																			onclick="alert('down')"></td>
																	</tr>
																	<tr bgcolor="#DDDDDD" align="center">
																		<td><a onclick="">大三</a>
																		</td>
																		<td>25%</td>
																		<td>5</td>
																		<td><img src="<%=basePath%>images/turnUp1.jpg"
																			style="width:10px;height:10px;" onclick="alert('up')">
																			<img src="<%=basePath%>images/turnDown1.jpg"
																			style="width:10px;height:10px;"
																			onclick="alert('down')"></td>
																	</tr>
																	<tr bgcolor="#EEEEEE" align="center">
																		<td><a onclick="">大四</a>
																		</td>
																		<td>25%</td>
																		<td>5</td>
																		<td><img src="<%=basePath%>images/turnUp1.jpg"
																			style="width:10px;height:10px;" onclick="alert('up')">
																			<img src="<%=basePath%>images/turnDown1.jpg"
																			style="width:10px;height:10px;"
																			onclick="alert('down')"></td>
																	</tr>
																	<tr bgcolor="#DDDDDD" align="center">
																		<td><b>汇总</b>
																		</td>
																		<td>100%</td>
																		<td>25</td>
																		<td></td>
																	</tr>
																</table>
													</table></td>
											</tr>
										</table>


										<table width="95%" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="6"><img src="<%=basePath%>images/spacer.gif"
													width="1" height="1" /></td>
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
																			type="text" class="right-textfield03" size="1" /></td>
																		<td width="87%"><input name="Submit23222"
																			type="submit" class="right-button06" value=" " /></td>
																	</tr>
																</table></td>
														</tr>
													</table></td>
											</tr>
										</table>
								</td>
							</tr>
						</table>
					</div></td>
			</tr>
		</table>

		</div>
		</td>
		</tr>
		</table>
		</div>
		<td><br></td>
		</tr>
		</table>
	</form>

	<div id="AdvNum" style="display: none">
		<h2>
			XXX先进项目<a id="btnCloseAdvNum">关闭</a>
		</h2>
		<div class="form">

			<table width="100%" border="0" cellpadding="4" cellspacing="1"
				bgcolor="#464646" class="demo" id="tableID">
				<tr class="CTitle">
					<td height="22" colspan="12" align="center" style="font-size: 16px">
						XXXX</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<th width='20%' name='advanceProjectNo'>
						<center>专业</center></th>
					<th width='20%' name='advanceProjectType'>
						<center>班级</center></th>
					<th width='25%' name='level'><span align="center"
						style="position:relative;left:80px;"> 级别<select
							style="font-size:6px;position:relative;left:10px;">
								<option>院级</option>
								<option>校级</option>
								<option>省级</option>
						</select> </span></th>
					<th width='10%' name='time'>
						<center>人数</center></th>
					<th width='20%' name='oprate'>
						<center>操作</center></th>
				</tr>
				<tr bgcolor="#EEEEEE">
					<td>
						<center>软件工程</center></td>
					<td>
						<center>1201</center></td>
					<td>
						<center>院级</center></td>
					<td>
						<center>2</center></td>
					<td align="center"><img src="<%=basePath %>images/turnUp1.jpg"
						style="width:10px;height:10px;" onclick="alert('up')"> <img
						src="<%=basePath %>images/turnDown1.jpg"
						style="width:10px;height:10px;" onclick="alert('down')"></td>
				</tr>
				<tr bgcolor="#EEEEEE">
					<td>
						<center>数字媒体</center></td>
					<td>
						<center>1202</center></td>
					<td>
						<center>院级</center></td>
					<td>
						<center>2</center></td>
					<td align="center"><img src="<%=basePath %>images/turnUp1.jpg"
						style="width:10px;height:10px;" onclick="alert('up')"> <img
						src="<%=basePath %>images/turnDown1.jpg"
						style="width:10px;height:10px;" onclick="alert('down')"></td>
				</tr>
				<tr bgcolor="#EEEEEE">
					<td>
						<center>软件+英语</center></td>
					<td>
						<center>1203</center></td>
					<td>
						<center>院级</center></td>
					<td>
						<center>1</center></td>
					<td align="center"><img src="<%=basePath %>images/turnUp1.jpg"
						style="width:10px;height:10px;" onclick="alert('up')"> <img
						src="<%=basePath %>images/turnDown1.jpg"
						style="width:10px;height:10px;" onclick="alert('down')"></td>
				</tr>
				<tr bgcolor="#EEEEEE">
					<td colspan="2">
						<center>汇总</center></td>
					<td>
						<center>院级</center></td>
					<td>
						<center>5</center></td>
					<td></td>
				</tr>
			</table>

			<div id="editScore" style="display: none">
				<div align="center">
					<input type='button' value='保存' id="saveProjectPro"
						onclick="save('editScore')" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type='button' value='取消' onclick="cancel()" />
				</div>
			</div>
		</div>
	</div>


	<div id="AdvProportion" style="display: none">
		<h2>
			先进项目比例<a id="btnCloseAdvProportion">关闭</a>
		</h2>
		
		<div class="form">
		  <form action="" method="post" id="PropItemInfo">	
			<table width="100%" border="0" cellpadding="4" cellspacing="1"
				bgcolor="#464646" class="demo" id="tableID">
				<thead>
					<tr class="CTitle">
						<td height="22" colspan="12" align="center"
							style="font-size: 16px">先进项目比例表</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<th width='10%' name='advanceProjectType'>
							<center>先进项目</center></th>
						<th width='10%' name='level'>
							<center>级别</center></th>
						<th width='10%' name='time'>
							<center>分配人数</center></th>
						<th width='10%' name='time'>
							<center>分配比例</center></th>
						<th width='10%' name='time'>
							<center>分配时间</center></th>
						<th width='10%' name='time'>
							<center>开始时间</center></th>
						<th width='10%' name='time'>
							<center>截止时间</center></th>
						<th width='10%' name='time'>
							<center>操作</center></th>
					</tr>
					<tr bgcolor="#EEEEEE">
						<td>
							<center>
								<select style="font-size:8px">
									<option>请选择先进项目</option>
									<option>优秀三好学生</option>
									<option>优秀学生干部</option>
									<option>最佳三好学生</option>
									<option>最佳学生干部</option>
									<option>优秀团员</option>
									<option>优秀团干部</option>
								</select>
							</center></td>
						<td>
							<center>
								<select style="font-size:8px">
									<option>院级</option>
									<option>校级</option>
									<option>省级</option>
									<option>国家级</option>
								</select>
							</center></td>
						<td>
							<input type="text" name="empID" value="21233333" size="40" maxlength="1000"  readonly="readonly"  class="readonly" style="width:80px"/>
						</td>
						<td>
							<input type="text" name="empID" value="21233333" size="40" maxlength="1000"  readonly="readonly"  class="readonly" style="width:80px"/>
						</td>
						<td>
							<input type="text" name="empID" value="21233333" size="40" maxlength="1000"  readonly="readonly"  class="readonly" style="width:80px"/>
						</td>
						<td>
							<input type="text" name="empID" value="21233333" size="40" maxlength="1000"  readonly="readonly"  class="readonly" style="width:80px"/>
						</td>
						<td>
							<input type="text" name="empID" value="21233333" size="40" maxlength="1000"  readonly="readonly"  class="readonly" style="width:80px"/>
						</td>
						<td>
							<center>
								<input type='button' value='修改' id="modifyMyBasicInfoBtn" />
							</center></td>
					</tr>
			</table>
			<div id="editProportion" style="display:none">
				<div align="center">
					<input type='submit' value='保存' id="saveProjectPro"
						onclick="save('editProportion')" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type='reset' value='取消' onclick="cancel()" />
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>
