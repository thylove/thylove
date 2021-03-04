<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/priv.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更换图片</title>
<jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div class="main">
		<jsp:include page="../common/common.jsp"></jsp:include>
		<div class="main-right">
			<form action="uploadImg"  method = "post" class="add" enctype="multipart/form-data" >
				<h3>请选择一张jpg、png、jpeg、ico图片</h3>
				<input type="hidden" name = "uid" value = "<%=request.getParameter("id") %>" />
				<input type="file"  name = "myFile" /> <br />
				<input type="submit" value = "提交" />
			</form>
		</div>
	</div>
</body>
</html>