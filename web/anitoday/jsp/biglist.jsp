<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, anime.*"
    %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>

<%@taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core"%>
           
<%
	String url = request.getParameter("url");
	List<Item> items = Anigod.lists(url);
	request.setAttribute("items", items);
%>

<c:forEach items="${items}" var="item">
	<div class="mdl-card mdl-shadow--2dp">
		<div class="mdl-card__title">
					<h2 class="mdl-card__title-text">${item.title}</h2>
			</div>
		<div class="mdl-card__media">
		<video controls preload="none" poster="${item.src}" width="100%" height="100%">
			<source src="jsp/bigvideo.jsp?url=${item.url}" type="video/mp4">
		</video>
		</div>
	</div>
</c:forEach>	