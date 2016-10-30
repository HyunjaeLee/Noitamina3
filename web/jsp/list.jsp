<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>
<%@ page import="java.util.List" %>

<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String p = request.getParameter("p");
    String url = request.getParameter("url");
    List<Item> items = Anigod.list(url + "/" + p);
    request.setAttribute("items", items);
%>

<c:if test="<%=!items.isEmpty()%>">
<div class="page" id="<%=p%>">
<div class="list big-list">
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

        <div class="mdl-card__actions mdl-card--border">
            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="jsp/bigvideo.jsp?url=${item.url}" download="${item.title}.mp4">
                Download
            </a>
        </div>
    </div>
    </c:forEach>
</div>

<div class="list small-list">
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
</div>
</div>
</c:if>