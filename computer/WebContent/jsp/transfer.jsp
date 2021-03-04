<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="addTransfer" class= "transferIn" method="get">
				<table style = "">
					<caption>
						调拨单
					</caption>
					<tr>
						<td><em>调 出 店</em></td>
						<td colspan="2"><span class = "transferOutID"><%= session.getAttribute("storeID").toString() %></span>号店</td>
					</tr>
					<tr>
						<td rowspan="7"><em>电 脑</em></td>
						<td>商品名</td>
						<td >
							<select name="transferRecord.proName" id="" class = "place">
								<option value="" >--请选择--</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>商品型号</td>
						<td >
							<select name="transferRecord.proModel" id="" class = "place2">
								<option value="" >--请选择--</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>入库时间</td>
						<td ><input type="text" class = "strTime" disabled="disabled" /></td>
					</tr>
					<tr>
						<td>单价</td>
						<td >
							<input type="text" name = "proPrice" class = "price" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>剩余量</td>
						<td class = "proNum" >
							<input type="text" class = "proNum" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>调出量</td>
						<td ><input required="required" type="number" name = "transferRecord.transferNum" class = "transferNum" placeholder="不能大于剩余量"/></td>
					</tr>
					<tr class = "proImg">
						<td>商品图</td>
						<td ><div class = "proimg" ><img src="" alt="" /></div></td>
					</tr>
					<tr>
						<td><em>调 入 店</em></td>
						<td colspan="2">
							<select name="transferRecord.transferInID" id="" class = "storeIDs">
								<option value="" >--请选择调入店面--</option>
							</select>
						</td>
					</tr>
				</table>
				<span class = "check" >审核人： <span ><%=session.getAttribute("userName").toString() %></span></span>
				<input type="hidden" name = "transferRecord.userName" value = "<%=session.getAttribute("userName").toString() %>"/>
				<input type="hidden" name = "transferRecord.transferOutID" value = "<%= session.getAttribute("storeID").toString() %>"/>
				<input type="hidden" class = "proImg" name = "transferRecord.proImg" value = ""/>
				<input type="hidden" name = "transferRecord.proPrice" class = "priceRS" />
				<input type="hidden" name = "transferRecord.proID" class = "proID" />
				<input type="submit" />
			</form>
			
		</div>
	</div>
	<script>
	var arr = new Array();
	var arr2 = new Array();
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
					var op = $("<option value = '"+arr[index]+"'></option>").text(arr[index]);
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
				$(".proImg").val(computers[i].proImg)
				$(".price").val("￥" + computers[i].proPrice + "元")
				$(".priceRS").val(computers[i].proPrice)
				$(".proNum").val(computers[i].proNum)
				$(".proID").val(computers[i].proID)
				
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
				$(".proImg").val(computers[i].proImg)
				$(".price").val("￥" + computers[i].proPrice + "元")
				$(".priceRS").val(computers[i].proPrice)
				$(".proNum").val(computers[i].proNum)
				$(".proID").val(computers[i].proID)
			}
		}
	}); 
	$.ajax({
		url: "../storeID",
		dataType:"json", 
		type:"get" ,
		success:function (storeIDs){
			for(i = 0; i < storeIDs.length; i ++) {
				if(arr.indexOf(storeIDs[i].storeID) == -1 && storeIDs[i].storeID != $(".transferOutID").text()) {
					arr2[index] = storeIDs[i].storeID;
					var op2 = $("<option value = '"+arr2[index]+"'></option>").text(arr2[index] + "号店");
					$(".storeIDs").append(op2);
					index ++;
				}
			}
			
		}
	})
	
	
	
	</script>
</body>
</html>
