<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="anime.*"
    %>
<%@ page import="com.hyunjae.noitamina.Anitoday" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/header.js"></script>
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.blue_grey-cyan.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/header.css" type="text/css">

<style type="text/css">

	a:link {color: inherit; text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a.index{color: white; text-decoration: none;}
	
	video {
		width: 100%;
		height: 100%;
	}
	
</style>

<%
	String url = request.getParameter("url");/*
	Item item = Anigod.video(url);
	String title = item.getTitle();
	String video = item.getUrl();
	String poster = item.getSrc();*/
	String title = "";
	String video = Anitoday.video(url);
	String poster = "";
%>
<title><%=title%></title>

</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-drawer">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<a href="index.html" class="index">
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
			<video controls preload="none" poster="<%=poster%>">
				<source src="<%=video%>" type="video/mp4">
			</video>
		</main>
	</div>
</body>
</html>