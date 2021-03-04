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
			<form action="saleRe" method = "get">
				<span class = "hiddenSpan"></span>
				<input type="hidden" name = "salesRecord.userID" value = "<%=session.getAttribute("userID").toString() %>" />
				<input type="hidden" name = "salesRecord.userName" value = "<%=session.getAttribute("userName").toString() %>" />
				<input type="hidden" class = "priceRS" name = "salesRecord.proPrice" />
				<input type="hidden"  name = "salesRecord.storeID" value = "<%=session.getAttribute("storeID") %>" />
				<div class = "ld">
					<table>
						<caption>销售出库</caption>
						<tr>
							<td>商品名：</td>
							<td>
								<select name="salesRecord.proName" id="" class = "place">
									<option value="" >--请选择--</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>商品型号：</td>
							<td>
								<select name="salesRecord.proModel" id="" class = "place2">
									<option value="" >--请选择--</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>入库时间：</td>
							<td><input type="text" class = "strTime" disabled="disabled" /></td>
						</tr>
						<tr>
							<td>价格：</td>
							<td><input type="text" class = "price" disabled="disabled" /></td>
						</tr>
						<tr>
							<td>剩余量：</td>
							<td><input type="text" class = "proNum" disabled="disabled" /></td>
						</tr>
						<tr>
							<td>商品图：</td>
							<td><div class = "proimg" ><img src="" alt="" /></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value = "出库"/></td>
						</tr>
					</table>
				</div>	
			</form>
		</div>
	</div>
	<script>
		var arr = new Array();
		var computers;
		var index = 0;
		$.ajax({
			url: "../saleProduct1?storeID=" + $(".storeID").val(),
			dataType:"json", 
			type:"get" ,
			success:function (data){
				computers = data;
				
				for(i = 0; i < data.length; i ++) {
					if(arr.indexOf(data[i].proName) == -1) {
						arr[index] = data[i].proName;
						var op = $("<option value = '"+arr[index]+"' onclick = optinClic("+arr[index]+")></option>").text(arr[index]);
						$(".place").append(op);
						index ++;
					}
				}
			}
		})
		$(".place").on("change",function(){
			$(".place2").empty();
			$(".hiddenSpan").empty();
			for(i = 0; i < computers.length; i ++) {
				if($("option:selected",this).val() == computers[i].proName) {
					var op = $("<option value = '"+computers[i].proModel+"' onclick = optinClic("+computers[i].proModel+")></option>").text(computers[i].proModel);
					$(".place2").append(op);
				}
			}
			$(".proimg img").css('display', 'inline-block')
			for(i = 0; i < computers.length; i ++) {
				if($("option:selected",$(".place2")).val() == computers[i].proModel) {
					var opinput = $("<input type = 'hidden' name = 'salesRecord.proID' value = '"+computers[i].proID+"'>")
					$(".hiddenSpan").append(opinput);
					$(".proimg img").attr("src", "${pageContext.request.contextPath}/img/" + computers[i].proImg);
					$(".strTime").val(computers[i].storageTime)
					$(".price").val("￥" + computers[i].proPrice + "元")
					$(".priceRS").val(computers[i].proPrice)
					$(".proNum").val(computers[i].proNum)
				}
			}
		}); 
		$(".place2").on("change",function(){
			$(".hiddenSpan").empty();
			$(".proimg img").css('display', 'inline-block')
			for(i = 0; i < computers.length; i ++) {
				if($("option:selected",this).val() == computers[i].proModel) {
					var opinput = $("<input type = 'hidden' name = 'salesRecord.proID' value = '"+computers[i].proID+"'>")
					$(".hiddenSpan").append(opinput);
					$(".proimg img").attr("src", "${pageContext.request.contextPath}/img/" + computers[i].proImg);
					$(".strTime").val(computers[i].storageTime)
					$(".price").val("￥" + computers[i].proPrice + "元")
					$(".priceRS").val(computers[i].proPrice)
					$(".proNum").val(computers[i].proNum)
				}
			}
		}); 
		
	</script>
</body>
</html>
