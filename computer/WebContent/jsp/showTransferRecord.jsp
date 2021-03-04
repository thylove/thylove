<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/priv.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
			<div class = "showComputer" style="overflow:auto;" >
				<table border = "1" >
					<caption>
						库存展示
					</caption>
					<thead>
						<tr>
							<th>序号</th>
							<th>调入商面</th>
							<th>商品图</th>
							<th>商品名</th>
							<th>商品型号</th>
							<th>商品价格</th>
							<th>调拨量</th>
							<th>调拨时间</th>
							<th>调出商面</th>
							<th>审核人</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="queryAllTransfer" status="index">
							<s:if test="#index.odd == true">
								<tr align = "center" style="background-color:#cccccc">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td><s:property value = "transferInID" />号店	</td>
									<td class = "proImg"><img src="${pageContext.request.contextPath}/img/<s:property value = "proImg" />" alt="" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "transferNum" />件</td>
									<td width = "110" class = "storageTime" title = "<s:property value = "storageTime" />"><s:property value = "storageTime" /></td>
									<td><s:property value = "transferOutID" />号店	</td>
									<td><s:property value = "userName" /></td>
								</tr>
							</s:if>
							<s:else>
								<tr align = "center">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td><s:property value = "transferInID" />号店	</td>
									<td class = "proImg"><img src="${pageContext.request.contextPath}/img/<s:property value = "proImg" />" alt="" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "transferNum" />件</td>
									<td width = "110" class = "storageTime" title = "<s:property value = "storageTime" />"><s:property value = "storageTime" /></td>
									<td><s:property value = "transferOutID" />号店	</td>
									<td><s:property value = "userName" /></td>
								</tr>
							</s:else>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<span></span>
		</div>
	</div>
</body>
</html>
