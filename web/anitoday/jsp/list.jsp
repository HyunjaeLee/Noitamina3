<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hyunjae.noitamina.Anitoday" %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String url = request.getParameter("url");
	List<Item> items = Anitoday.lists(url);
	request.setAttribute("items", items);
%>

<c:forEach items="${items}" var="item">
	<a href="video.jsp?url=${item.url}">
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