<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="./pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册！</title>
</head>
<body style = "background:url(../img/bg-register.png); background-size: 100%;">
	<form action="register" method = "post" class = "registerForm" >
		<table >
			<caption class = "title">&emsp;&emsp;&emsp;笔记本管理系统注册&emsp;<a href = "../index.jsp" class = "title">登录</a></caption>
			<tr>
				<td>
					<label for="user-type">类型:</label>
				</td>
				<td>
					<select name="register.userType" id="user-type" required="required">
				    <option disabled="disabled" selected>--请选择--</option>
				    <option value="1">销售员</option>
				    <option value="2">采购员</option>
				    <option value="3">管理员</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user-type">店面:</label>
				</td>
				<td>
					<select name="register.storeID" class="userType" required="required">
				    <option disabled="disabled" selected >--请选择--</option>
				    
				</select>
				</td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td><input type="text" name = "register.userName" class = "registerusername"/></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name=  "register.userPwd" class = "registerPwd"/></td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td><input type="password" class = "registerrepwd"/></td>
			</tr>
			<tr class = "btn">
				<td colspan = "2"><p><input type="submit" value = "注册" class = "registerBtn"/>&emsp;<input type="reset" value = "重置" /></p></td>
			</tr>
		</table>
	</form>
	<%@ include file="./footer.jsp"%>
	<script>
	$.ajax({
		url: "../storeID",
		dataType:"json", 
		type:"get" ,
		success:function (data){
			computers = data;
			console.log(data);
			for(i; i < data.length; i++) {
				var op = $("<option value = '"+data[i].storeID + "'></option>").text(data[i].storeID);
				$(".userType").append(op);
			}
		}
	})
	</script>
</body>
</html>