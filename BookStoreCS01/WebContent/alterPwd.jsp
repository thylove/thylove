<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
</head>
<body>
	<form action="modifyPwd" method = "POST" class = "modifyPwd">
		密&emsp;&emsp;码：<input type="password" name = "alterPwd" class = "alterPwd" placeholder="请输入新的密码"/> <br />确认密码：<input type="password" class = "repwd" placeholder="请输入确认密码" /> <br />
		<input type="hidden" value = '<s:property value = "uid"/>' name = "uid" />
		<br />
		<p class = "modifyBtnt"><input type="submit" value = "Submit" class = "repwdbtn" />&emsp;&emsp; <input type="reset" value = "Reset" /></p>
	</form>
	<%@ include file = "footer.jsp" %>
</body>
</html>