<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="anime.*"
    %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>

<%
	String url = request.getParameter("url");
	Item item = Anigod.video(url);
	String _url = item.getUrl();
	response.sendRedirect(_url);
%>
