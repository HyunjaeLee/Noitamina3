<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/header.js"></script>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/thumbnail.css" type="text/css">
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.blue_grey-cyan.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
	
	.fab {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
	
	.mdl-grid {
		margin: 10px;
		height: 100px;
	}
	
	.mdl-cell {
		padding: 0px 10px 0px 5px;
	
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
	
	.mdl-card {
		margin: 20px auto;
	}
	
	.mdl-card__media {
		background-color: black;
	}
	
</style>

<%
	String title = request.getParameter("title");
	String url = request.getParameter("url");
%>

<script type="text/javascript">

	$(document).ready(function() {
		load();
	});
	
	function load()
	{
		$.get("jsp/list.jsp",
		   	{ url: "<%=url%>" },
		   	function(data){
			$(".mdl-layout__content").html(data);
        });
	};
	
	$(document).ajaxStart(function(){
		$("#progress").show();
	});
	
	$(document).ajaxStop(function(){
		$("#progress").hide();
	});
		
</script>

<title><%=title%></title>
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
            <div id="progress" class="mdl-progress mdl-js-progress mdl-progress__indeterminate"></div>
        </header>

        <div class="mdl-layout__drawer">
            <span class="mdl-layout__title">Noitamina</span>
            <nav class="mdl-navigation">
                <a class="mdl-navigation__link" href="all.html">All</a>
            </nav>
        </div>

        <main class="mdl-layout__content">
        </main>
    </div>
</body>
</html>