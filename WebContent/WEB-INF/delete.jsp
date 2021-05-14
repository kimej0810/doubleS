<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    	request.setCharacterEncoding("utf-8");
    	String delMenu = request.getParameter("del");
    
  		 ArrayList<String> menus = (ArrayList)(session.getAttribute("productList"));
    	
    	//삭제
    	if(menus != null){
    		try{
	    		for(int i=0; i<menus.size(); i++){
	    			if(menus.get(i).equals(delMenu));
	    			menus.remove(i);
	    		}
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		session.setAttribute("menus", menus);
    	}
    %>
    <script>
    	alert("<%=delMenu%>를(을) 장바구니에서 삭제했습니다.");
    	location.href="<%=request.getContextPath()%>/index.jsp";
    	/* history.back(); */
    </script>