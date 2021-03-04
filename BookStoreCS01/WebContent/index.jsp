<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>

</head>
<body>
	<div class = "souye">
		<span><a href="register.jsp" target="_blank">注册</a></span><span><a href="login.jsp" target="_blank">登录</a></span><span><a href="alterPwdLogin.jsp" target="_blank">修改密码</a></span><span><a href="searchUser.jsp" target="_blank">用户查询</a></span>
	</div>
	<s:actionmessage/>
	
	<%@ include file="footer.jsp"%>
	<script >
		if($(".actionMessage li span").text() == "登录成功") {
			alert($(".actionMessage li span").text());	
			$(".actionMessage li span").html("0");
		} else if($(".actionMessage li span").text() == "注册成功") {
			alert($(".actionMessage li span").text());	
			$(".actionMessage li span").html("0");
		} else if($(".actionMessage li span").text() == "修改密码成功") {
			alert($(".actionMessage li span").text());	
			$(".actionMessage li span").html("0");
		} else if($(".actionMessage li span").text() == "删除成功") {
			alert($(".actionMessage li span").text());	
			$(".actionMessage li span").html("0");
		}
	</script>
	
</body>
</html>