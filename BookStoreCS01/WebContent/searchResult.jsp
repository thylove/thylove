<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="pre.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询用户</title>
</head>
<body>
	<s:if test="userlist.size">
		<table border="1" cellpadding="1" cellspacing = "0" class = "reUser">
			<caption style = "font-size: 50px; font-weight: bold;padding:20px; ">查询结果</caption>
			<thead>
				<tr>
					<th>头像</th>
					<th>用户名</th>
					<th>密码</th>
					<th>性别</th>
					<th>昵称</th>
					<th>电子邮件</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value = "userlist" status="index">
				<s:if test="#index.odd == true">
					<tr align = "center" style="background-color:#cccccc">
						<td class = "userimg"><p><img src='<s:property value = "picture" /> ' alt="" /></p></td>
						<td class = "username" id = "uname"><s:property value = "username" /></td>
						<td class = "pwd"><s:property value = "pwd" /></td>
						<td class = "sex"><s:property value = "sex" /></td>
						<td class = "username"><s:property value = "aliasname" /></td>
						<td class = "pwd"><s:property value = "email" /></a></td>
						<s:if test='username != "admin"'>
							<td  class = "sex"><a href='deleteUser?uid=<s:property value = "userId"  />' class = "note">删除</a></td>
						</s:if>
						<s:else>
							<td  class = "sex"><a href='#' class = "nodel">删除</a></td>
						</s:else>
					</tr>
				</s:if>
				<s:else>
					<tr align = "center">
						<td class = "userimg"><p><img src='<s:property value = "picture" /> ' alt="" /></p></td>
						<td class = "username" id = "uname"><s:property value = "username" /></td>
						<td class = "pwd"><s:property value = "pwd" /></td>
						<td class = "sex"><s:property value = "sex" /></td>
						<td class = "username"><s:property value = "aliasname" /></td>
						<td class = "pwd"><s:property value = "email" /></a></td>
						<s:if test='username != "admin"'>
							<td  class = "sex"><a href='deleteUser?uid=<s:property value = "userId"  />' class = "note">删除</a></td>
						</s:if>
						<s:else>
							<td  class = "sex"><a href='#' class = "nodel">删除</a></td>
						</s:else>
					</tr>
				</s:else>
			</s:iterator>
				<tr><td colspan = "7" align = "center"><a href="searchUser.jsp" class = "with">重新搜索</a></td></tr>
			</tbody>
		</table>		
	</s:if>
	<s:else>
		<p >对不起！没有查到, 请<a href="searchUser.jsp" class = "with">重新搜索</a></p>
	</s:else>
	<%@ include file="footer.jsp"%>
</body>
</html>