<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎注册！</title>
</head>
<body style = "background:url(img/bg-register.png); background-size: 100%;">
	<form action="register" method = "get" class = "registerForm" >
		<table >
			<caption class = "title">欢迎注册vip会员</caption>
			<tr>
				<td>用户名:</td>
				<td><input type="text" name = "register.username" class = "registerusername"/></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name=  "register.pwd" class = "registerPwd"/></td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td><input type="password" class = "registerrepwd"/></td>
			</tr>
			<tr>
				<td>昵称:</td>
				<td><input type="text" name = "register.aliasname" class = "registeraliasname"/></td>
			</tr>
			<tr>
				<td><s:radio name="register.sex" list="#{1 : '男', 0 : '女'}" label ="性别"/></td>
			</tr>
			<tr>
				<td>email:</td>
				<td><input type="email" name = "register.email" class = "registeremail" /></td>
			</tr>
			<tr class = "btn">
				<td colspan = "2"><p><input type="submit" value = "Register" class = "registerBtn"/>&emsp;<input type="reset" value = "Reset" /></p></td>
			</tr>
		</table>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>