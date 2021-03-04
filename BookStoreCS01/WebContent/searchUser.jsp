<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询用户</title>
</head>
<body>
	<form action="searchUser" method = "get" class = "searchForm">
		<input type="search" name = "keyWord" class = "searchKeyWord" placeholder="请输入用户名或昵称"/><input type="submit" value = "搜索"  class = "searchSubmit"/>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>