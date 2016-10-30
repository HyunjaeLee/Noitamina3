<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
   	%>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>

<%@taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core"%>
           
<%

	String p = request.getParameter("p");
	List<Item> items = Anigod.list("https://anigod.com/animations/finale/title/asc/" + p);
	request.setAttribute("items", items);
	
%>

<div class="page" id="<%=p%>">
<c:forEach items="${items}" var="item">
<a href="lists.jsp?title=${item.title}&url=${item.url}">
	<section class="mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
		<div class="thumbnail">
			<img src="${item.src}" alt="image">
		</div>
        <div class="mdl-cell mdl-cell--2-col-phone">
			<span class="title">${item.title}</span>
		</div>
    </section>
   </a>
</c:forEach>
</div>