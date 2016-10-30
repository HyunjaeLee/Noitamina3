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
<link rel="stylesheet" href="css/header.min.css" type="text/css">
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

    /* List */

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
	
	.thumbnail {
 	 position: relative;
	  width: 120px;
	  height: 80px;
	  margin: 10px;
	  overflow: hidden;
	}
	
	.thumbnail img {
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  height: 100%;
	  width: auto;
  	  -webkit-transform: translate(-50%,-50%);
      -ms-transform: translate(-50%,-50%);
      transform: translate(-50%,-50%);
	}

    /* Card */
	
	.title {
		font-size: 16px;
	}
	
	.mdl-card {
		margin: 20px auto;
	}
	
	.mdl-card__media {
		background-color: black;
	}

    #more {
        display: block;
        margin: 10px auto 10px auto;
    }

    .mdl-spinner {
        position: relative;
        top: 2px;
    }
	
</style>

<%
	String title = request.getParameter("title");
	String url = request.getParameter("url");
%>

<script type="text/javascript">

	$(document).ready(function() {

        $.get("jsp/list.jsp",
                { p: 1,
                    url: "<%=url%>" },
                function(data){
                    $(".mdl-layout__content").prepend(data);
                });

        // Hide show-big-list button
        $("#view-big-list").hide();

        // Add button action
        $("#more").click(function(){
            if ($("#progress").is(":hidden")){
                load();
            }
        });

        // Show small-list
		$("#view-small-list").click(function(){
			$(".fab").toggle();
            $(".big-list").hide();
			$(".small-list").show();
		});

        // Show big-list
		$("#view-big-list").click(function(){
			$(".fab").toggle();
            $(".small-list").hide();
            $(".big-list").show();
		});

	});

    // Load page
    function load()
    {
        $.get("jsp/list.jsp",
                { p: parseInt($(".page:last").attr("id")) + 1,
                url: "<%=url%>" },
                function(data){
                    if($(data).text().length == 0) {
                        $("#more").hide();
                    } else {
                        $(".page:last").after(data);
                    }
                }
        );
    };
	
	$(document).ajaxStart(function(){
		$("#progress").show();
        $("#icon-add").hide();
        $(".mdl-spinner").addClass("is-active");
	});
	
	$(document).ajaxStop(function(){
		$("#progress").hide();
        $("#icon-add").show();
        $(".mdl-spinner").removeClass("is-active");
        if($(".list.big-list").css("display") == "none") {
            $(".list.big-list").hide();
        } else {
            $(".list.small-list").hide();
        }
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
            <button id="more" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                <i class="material-icons" id="icon-add">add</i>
                <div class="mdl-spinner mdl-js-spinner"></div>
            </button>
        </main>
    </div>

	<button id="view-small-list" class="fab mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
		<i class="material-icons">view_list</i>
	</button>
	<button id="view-big-list" class="fab mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
		<i class="material-icons">view_day</i>
	</button>
</body>
</html>