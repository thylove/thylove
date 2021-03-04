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
	<% 
		String userName = null;
		Cookie [] cookies = null;
		cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				if(cookie.getName().equals("userName")){
					userName = URLDecoder.decode(cookie.getValue(),"utf-8");
				}
			}
		}
	%>
	
	<span class="title">登录</span>
	<br>
	<div class="content" id = "cont">
		<form action="alterPwd" method = "post">
			用户名：<input type="text" name="alterPwdLogin.username" class="l" value="<%=userName==null ? "": userName%>"> <br>
			密&emsp;码：<input type="password" name="alterPwdLogin.pwd" class="l" value = "123456"><br>	
			<div class="c">
				<span>验证码：</span>
				<input type ="text" class="check shu" >
				<canvas id="myCanvas">
					Your browser does not support the HTML5 canvas tag.
				</canvas>
			</div>
			<p class="error">
				<% 
					String erro = (String)session.getAttribute("uaperror");
					if(erro != null)
						out.println(erro);
				%>
			</p>
			<input type="button" value="login"  class="btn">
		</form>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>