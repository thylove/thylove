<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="../common/priv.jsp" %>
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
			<div class = "showComputer" style="overflow:auto;" >
				<table border = "1" >
					<caption>
						库存展示
					</caption>
					<thead>
						<s:iterator >
							
						</s:iterator>
						<tr>
							<th>序号</th>
							<th>商品图</th>
							<th>商品名</th>
							<th>商品型号</th>
							<th>入库时间</th>
							<th>价格</th>
							<th>店面编号</th>
							<th>库存量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pros" status="index">
							<s:if test="#index.odd == true">
								<tr align = "center" style="background-color:#cccccc">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td class = "proImg"><img src="${pageContext.request.contextPath}/img/<s:property value = "proImg" />" alt="" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td width = "110" class = "storageTime" title = "<s:property value = "storageTime" />"><s:property value = "storageTime" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "storeID" />号店	</td>
									<td><s:property value = "proNum" /></td>
									<td><span><a href="deleteComputer?proID=<s:property value = "proID" />">删除</a>/<a href="alterComputer?proID=<s:property value = "proID" />">修改</a></span></td>
								</tr>
							</s:if>
							<s:else>
								<tr align = "center">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td class = "proImg"><img src="${pageContext.request.contextPath}/img/<s:property value = "proImg" />" alt="" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td width = "110" class = "storageTime" title = "<s:property value = "storageTime" />"><s:property value = "storageTime" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "storeID" />号店</td>
									<td><s:property value = "proNum" /></td>
									<td><span><a href="deleteComputer?proID=<s:property value = "proID" />">删除</a>/<a href="alterComputer?proID=<s:property value = "proID" />">修改</a></span></td>
								</tr>
							</s:else>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>