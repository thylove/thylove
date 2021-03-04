<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userImg = "";
	int id  = Integer.parseInt(session.getAttribute("userID").toString());
	int status = Integer.parseInt(session.getAttribute("userType").toString());
	String userName = session.getAttribute("userName").toString();
	if(session.getAttribute("userImg") == null) {
		userImg = "";
	} else {
		userImg = session.getAttribute("userImg").toString();
	}
	
	String userLeavl = null;
	if(status == 1) {
		userLeavl = "销售员";
	} else if(status == 2) {
		userLeavl = "采购员";
	}else {
		userLeavl = "管理员";
	}
	String realPath = null;
	if(userImg.equals("")) {
		realPath = "img/favicon.ico";
	} else {
		realPath = "img/" + userImg;
	}
%>
<div id = "wrapper">
	<div id="panelBody">
		<div class="tal">
			 <span class="username" ><%=userName %></span>
			 <input type = "hidden" value = "<%=session.getAttribute("storeID") %>" class= "storeID" />
			 <i class="delico">
		 		<a href="${pageContext.request.contextPath}/jsp/updateImg.jsp?id=<%=id%>"><img src="${pageContext.request.contextPath}/<%=realPath %>" alt="" class="mark" /></a>
			 </i>
		</div>
		<span class="gly"><%=userLeavl %></span>
		<div class="exitico">
			<a href="${pageContext.request.contextPath}/jsp/loginout.jsp">
				<span></span><i>注销</i>
			</a>
		</div>
	</div>
</div>