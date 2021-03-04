<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./jsp/pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
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
	<span class="title">欢迎登录笔记本管理仓库</span>
	
	<div class="content" id = "cont">
	
		<form action="login" method = "post">
			<div>
				<label for="user-type">类 型：</label>
			    <select name="user.userType" id="user-type">
				    <option disabled="disabled" selected>--请选择--</option>
				    <option value="1">销售员</option>
				    <option value="2">采购员</option>
				    <option value="3">管理员</option>
				</select>
				<br>
			</div>
			<div>
				<label for="username">用户名：</label>
				<input type="text" name="user.userName" id = "username" value="<%=userName==null ? "": userName%>"> <br>
			</div>
			<div>
				<label for="pwd">密&emsp;码：</label>
			<input type="password" name="user.userPwd" id = "pwd" value = "123456"><br>	
			</div>
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
			<div>
				<input type="button" value="登录"  class="btn">&emsp;&emsp;<input type="reset" value="重置"  class="btn">
			</div>
			<a href="${pageContext.request.contextPath}/jsp/register.jsp">还没有注册？</a>
		</form>
		
	</div>
	<s:actionmessage/>
	<%@ include file="./jsp/footer.jsp"%>
	<script>
		var msg=$(".actionMessage span").text();
		if(msg != "") {
			console.log("msg start: ", msg)
			alert(msg);
			$(".actionMessage span").html("");
			console.log("msg end: ", msg)
		}
	</script>
</body>
</html>