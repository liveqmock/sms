<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="./css/css.css" rel="stylesheet" type="text/css" />
 <script language=Javascript> 
  function time(){
    //
    t_div = document.getElementById('showtime');
   var now=new Date();
    //
   t_div.innerHTML = "当前时间:"+now.getFullYear()
    +"年"+(now.getMonth()+1)+"月"+now.getDate()
    +"日"+now.getHours()+"时"+now.getMinutes()
    +"分"+now.getSeconds()+"秒";
    //
   setTimeout(time,1000);
  }
</script>

  </head>
  
<body onload="time()">

<!-- top顶部页面 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="59" background="<%=basePath%>/images/top.gif">
    
    	<!-- top顶部左侧图片（学工管理系统） -->
    	<table width="99%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="2%"><img src="<%=basePath%>/images/logo.jpg" width="557" height="59" /></td>
	        <td width="64%" align="right" style="font-size:12px;vertical-align:bottom;"><div id="showtime"></div></td>
	      </tr>
    	</table>
    	
    </td>
  </tr>
</table>
</body>
</html>
