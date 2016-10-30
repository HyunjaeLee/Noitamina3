<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>
<%@ page import="java.util.List" %>

<%@taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/header.js"></script>
<script src="js/thumbnail.js"></script>
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.blue_grey-cyan.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Noto+Sans' type='text/css'>
<link rel="stylesheet" href="css/header.min.css" type="text/css">
<link rel="stylesheet" href="css/thumbnail.css" type="text/css">

<style type="text/css">

	.mdl-grid {
		margin: 10px;
		height: 140px;
		display: flex;
		align-items: center;
	}
	
	.mdl-cell {
		padding: 0 10px 0 5px;
	
		display: flex;
		display: -webkit-flex;
		display: -moz-box;
		
		-moz-box-align: center;
  		-webkit-align-items: center;
		align-items: center;
		
		-webkit-box-flex: 1;
  		-webkit-flex-grow: 1;
 		-ms-flex-positive: 1;
  		flex-grow: 1;
	}
	
	.title {
		font-size: 16px;
	}
	
</style>

<%
	String keyword = request.getParameter("keyword");
	List<Item> items = Anigod.search(keyword);
	request.setAttribute("items", items);
%>

<title><%=keyword%> - Search</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-drawer">
	<header class="mdl-layout__header">
		<div class="mdl-layout__header-row">
			<a href="index.jsp" class="index">
				<span class="mdl-layout__title">Noitamina</span>
			</a>
   			   	<!-- Displayed on Computer and Tablet -->
      <!-- Search -->
      <div class="mdh-expandable-search mdl-cell--hide-phone">
        <i class="material-icons">search</i>
        <form action="search.jsp">
          <input type="text" name="keyword" placeholder="Search" size="1">
        </form>
      </div>

      <!-- Displayed on mobile -->
      <div class="mdl-layout-spacer mdl-cell--hide-tablet mdl-cell--hide-desktop"></div>
      <!-- Search button -->
      <button class="mdh-toggle-search mdl-button mdl-js-button mdl-button--icon mdl-cell--hide-tablet mdl-cell--hide-desktop">
        <i class="material-icons">search</i>
      </button>
      
      	</div>
      	
	</header>
	
	<div class="mdl-layout__drawer">
		<span class="mdl-layout__title">Noitamina</span>
		<nav class="mdl-navigation">
        	<a class="mdl-navigation__link" href="all.html">All</a>
    	</nav>
	</div>
	
	<main class="mdl-layout__content">
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
	</main>
	
</div>

</body>
</html>