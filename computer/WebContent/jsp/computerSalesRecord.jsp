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
			<div class = "showComputer">
				<table border = "1" >
					<caption>
						销售记录
					</caption>
					<thead>
						<tr>
							<th>序号</th>
							<th>用户编号</th>
							<th>用户名</th>
							<th>商品编号</th>
							<th>商品名</th>
							<th>商品型号</th>
							<th>销售日期</th>
							<th>销售价格</th>
							<th>点面编号</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="queryAllRecord" status="index">
							<s:if test="#index.odd == true">
								<tr align = "center" style="background-color:#cccccc">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td class = "proImg"><s:property value = "userID" /></td>
									<td><s:property value = "userName" /></td>
									<td><s:property value = "proID" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td  class = "storageTime" title = "<s:property value = "salesTime" />"><s:property value = "salesTime" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "storeID" />号店	</td>
								</tr>
							</s:if>
							<s:else>
								<tr align = "center">
									<td class ="proNo"><s:property value="#index.index+1"/></td>
									<td class = "proImg"><s:property value = "userID" /></td>
									<td><s:property value = "userName" /></td>
									<td><s:property value = "proID" /></td>
									<td><s:property value = "proName" /></td>
									<td><s:property value = "proModel" /></td>
									<td  class = "storageTime" title = "<s:property value = "salesTime" />"><s:property value = "salesTime" /></td>
									<td>￥<s:property value = "proPrice" />元</td>
									<td><s:property value = "storeID" />号店	</td>
								</tr>
							</s:else>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		var arr = new Array();
		var computers;
		var index = 0;
		$.ajax({
			url: "../salesRecordComputer",
			dataType:"json", 
			type:"get" ,
			success:function (data){
				computers = data;
				console.log(computers);
			}
		})
	</script>
</body>
</html>
