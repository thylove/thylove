<% 
	Object user = session.getAttribute("userID");
	if(user == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
%>