<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/priv.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
			<form action="alterComputerRs" method="post" class = "addcomputer" enctype="multipart/form-data">
				<input type="hidden" name = "alterPro.proID" value = "<s:property value = "product.proID" />" />
				<table style="border-collapse: collapse;">
					<caption>笔记本的修改</caption>
					<tbody>
						<tr>
							<td>商品名:</td>
							<td><input type="text" name = "alterPro.proName" value = "<s:property value = "product.proName" />"/></td>
						</tr>
						<tr>
							<td>商品型号:</td>
							<td><input type="text" name = "alterPro.proModel" value = "<s:property value = "product.proModel" />" /></td>
						</tr>
						<tr>
							<td>商品价格:</td>
							<td><input  name = "alterPro.proPrice" value = "<s:property value = "product.proPrice" />" /></td>
						</tr>
						<tr>
							<td>商品数量:</td>
							<td class = "alterProNum">
								<input disabled="disabled" type="number" name = "alterPro.proNum" value = "<s:property value = "product.proNum" />" />
							</td>
						</tr>
						<tr>
							<td>商品图片:</td>
							<td class = "alterComputerImg">
								<label for="proImg" >
									<img src="${pageContext.request.contextPath}/img/<s:property value = "product.proImg" />" alt="" />
								</label>
								<input type="file" class = "img" id= "proImg" />
								
							</td>
						</tr>
						<tr>
							<td colspan = "2" class = "btn">
								<p><input type="submit" value = "确定" /><input type = "reset" value = "重置"></input></p>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	 <s:debug></s:debug>
</body>
</html>