<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<script language="javascript" type="text/javascript">
		function checkForm() {
				var usertype = document.getElementById("select").value;
				//alert(usertype);
				if(usertype == 1) {
					window.location.href = "#";
				} else if(usertype == 2) {
					window.location.href = "index_tutor.html";
				} else if(usertype == 3) {
					window.location.href = "index_college.html";
				} else if(usertype == 4) {
					window.location.href = "index_school.html";
				} else if(usertype == 5) {
					window.location.href = "files/college_admin/index_admin.html";
				}else if(usertype== 6 ){
				    window.location.href="files/schollManager/admin_index.html";
				}else if(usertype==7){
					window.location.href = "index_admin.html"
				} 
				//return true;
			}
	</script>

<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><img src="images/top03.gif" width="776" height="147" /></td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="images/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
          
        </table></td>
        <td><img src="images/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
    <td>
    
    
   <form action="login" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top"><br /></td><td width="31%" height="35" class="login-text02">用户名：<br /></td>
        <td width="69%"><input name="username" type="text" size="30" /></td>
      </tr>
      <tr>
        <td valign="top"><br /></td><td height="35" class="login-text02">密　码：<br /></td>
        <td><input name="textfield2" type="password" size="30" /></td>
      </tr>
      <tr>
        <td valign="top"><br /></td><td height="35">&nbsp;</td>
        <td><input name="Submit2" type="submit" class="right-button01" value="确认登陆" onClick="checkForm()" /> 
          <input name="Submit232" type="reset" class="right-button02" value="重 置" /></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>
