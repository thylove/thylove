<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main-left">
	<div class="nav-list">
		<h3>销售<span></span></h3>
		<ul>	
			<li class = "adm cai"><a href="${pageContext.request.contextPath}/jsp/saleComputer.jsp">销售出库</a></li>
			<li class = "cai"><a href="saleRecord">销售记录</a></li>
		</ul>
		<h3>笔记本仓库<span></span></h3>
		<ul>
			<li class = "xiao adm"><a href="${pageContext.request.contextPath}/jsp/addComputer.jsp">笔记本入库</a></li>
			<li class = "adm" ><a href="showComputer?storeID=<%=session.getAttribute("storeID")%>">查看仓库</a></li>
		</ul>
		<h3>笔记本调拨<span></span></h3>
		<ul>
			<li class = "xiao cai" ><a href="${pageContext.request.contextPath}/jsp/transfer.jsp">笔记本调拨</a></li>
			<li class = "xiao cai" ><a href="showTransferRecord">笔记本调拨记录</a></li>
		</ul>
		
		<h3>管理员管理<span></span></h3>
		<ul>
			<li><a href="#">管理员添加</a></li>
			<li><a href="#">管理员查看</a></li>

		</ul>
	</div>
</div>
