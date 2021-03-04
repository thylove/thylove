<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="../common/priv.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>笔记本销售仓库管理系统</title>
<jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div class="main">
		<jsp:include page="../common/common.jsp"></jsp:include>
		<div class="main-right">
			<div class="container">
				<svg viewBox = "0 0 1000 300">
					<symbol id="line-text">
						<text text-anchor="middle" x = "50%" y = "50%" dy=".4em">
							欢迎<%=session.getAttribute("userName") %>
						</text>
					</symbol>
					<use xlink:href="#line-text" class="text"></use>
					<use xlink:href="#line-text" class="text"></use>
					<use xlink:href="#line-text" class="text"></use>
					<use xlink:href="#line-text" class="text"></use>
				</svg>
			</div>
				<s:actionmessage/>
		</div>
	</div>
	<s:actionmessage/>
	<script>
		var msg=$(".actionMessage span").text();
		if(msg != "") {
			console.log("msg start: ", msg)
			alert(msg);
			msg = "";
			console.log("msg end: ", msg)
		}
		
		
	</script>
</body>
</html>
