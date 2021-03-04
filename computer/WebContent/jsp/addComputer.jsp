<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/priv.jsp" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>采购入库</title>
<jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div class="main">
		<jsp:include page="../common/common.jsp"></jsp:include>
		<div class="main-right">
			<form action="addComputer" method="post" class = "addcomputer" enctype="multipart/form-data">
				<input type="hidden" name = "product.proStatus" value = "1" />
				<input type="hidden" name = "product.storeID" value = "<%=session.getAttribute("storeID") %>" />
				<table style="border-collapse: collapse;">
					<caption>笔记本的入库</caption>
					<tbody>
						<tr>
							<td>商品名:</td>
							<td><input type="text" name = "product.proName" /></td>
						</tr>
						<tr>
							<td>商品型号:</td>
							<td><input type="text" name = "product.proModel" /></td>
						</tr>
						<tr>
							<td>商品数量:</td>
							<td><input type="number" name = "product.proNum" /></td>
						</tr>
						<tr>
							<td>商品价格:</td>
							<td><input name = "product.proPrice"/></td>
						</tr>
						<tr>
							<td>商品图片:</td>
							<td><input type="file" name = "proImg" class = "img"/></td>
						</tr>
						<tr>
							<td colspan = "2" class = "btn">
								<p><input type="submit" value = "添加" /><input type = "reset" value = "重置"></input></p>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>