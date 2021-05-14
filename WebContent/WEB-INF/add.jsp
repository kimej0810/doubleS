<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		ArrayList<String> arr = (ArrayList<String>)(session.getAttribute("productList"));
		
		String[] productName = request.getParameterValues("menu");
		
		if(session.getAttribute("productList")==null){
			arr = new ArrayList<String>();
		}
		for(int i=0; i<productName.length; i++){
			arr.add(productName[i]);
			
		}
		session.setAttribute("productList", arr);
		out.println(arr);
	%>
</body>
</html>