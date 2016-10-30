<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hyunjae.noitamina.Item" %>
<%@ page import="com.hyunjae.noitamina.Anigod" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/header.js"></script>
<script src="js/thumbnail.js"></script>
<link rel="stylesheet" href="css/header.min.css" type="text/css">
<link rel="stylesheet" href="css/thumbnail.css" type="text/css">
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.blue_grey-cyan.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">

    .mdl-grid {
        margin: 10px;
        height: 140px;
        display: flex;
        align-items: center;
    }

    .new .mdl-grid {
        background-color: cyan;
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

    .title {
        font-size: 16px;
    }

</style>

<script>

    $(document).ready(function() {
        var day = getDay();
        $(".mdl-layout__tab:contains("+day+")").addClass("is-active");
        $(".mdl-layout__tab-panel#"+day).addClass("is-active");
    });

    function getDay() {
        var date = new Date();
        var weekday = new Array(7);
        weekday[0] = "Sun";
        weekday[1] = "Mon";
        weekday[2] = "Tue";
        weekday[3] = "Wed";
        weekday[4] = "Thu";
        weekday[5] = "Fri";
        weekday[6] = "Sat";
        return weekday[date.getDay()];
    }

</script>

<%
    Map<String, List<Item>> map = Anigod.now();
    request.setAttribute("map", map);
%>

<title>Noitamina</title>
</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-tabs mdl-layout--fixed-drawer">
		<header class="mdl-layout__header mdl-layout__header--waterfall">
			<div class="mdl-layout__header-row">

                <!-- Title -->
				<a href="index.jsp" class="index"> <span
					class="mdl-layout__title">Noitamina</span>
				</a>

				<!-- Search -->
                <!-- Displayed on Computer and Tablet -->
				<div class="mdh-expandable-search mdl-cell--hide-phone">
					<i class="material-icons">search</i>
					<form action="search.jsp">
						<input type="text" name="keyword" placeholder="Search" size="1">
					</form>
				</div>
				<!-- Displayed on mobile -->
				<div
					class="mdl-layout-spacer mdl-cell--hide-tablet mdl-cell--hide-desktop"></div>
				<!-- Search button -->
				<button
					class="mdh-toggle-search mdl-button mdl-js-button mdl-button--icon mdl-cell--hide-tablet mdl-cell--hide-desktop">
					<i class="material-icons">search</i>
				</button>
			</div>

            <!-- Tabs -->
            <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
                <a href="#Mon" class="mdl-layout__tab">Mon</a>
                <a href="#Tue" class="mdl-layout__tab">Tue</a>
                <a href="#Wed" class="mdl-layout__tab">Wed</a>
                <a href="#Thu" class="mdl-layout__tab">Thu</a>
                <a href="#Fri" class="mdl-layout__tab">Fri</a>
                <a href="#Sat" class="mdl-layout__tab">Sat</a>
                <a href="#Sun" class="mdl-layout__tab">Sun</a>
            </div>

		</header>

        <!-- Drawer -->
		<div class="mdl-layout__drawer">
			<span class="mdl-layout__title">Noitamina</span>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link" href="all.html">All</a>
                <a class="mdl-navigation__link" href="anitoday/">Anitoday</a>
			</nav>
		</div>

        <!-- Content -->
		<main class="mdl-layout__content">
            <c:forEach items="${map}" var="entry">
            <section class="mdl-layout__tab-panel" id="${entry.key}">
                <div class="page-content">
                    <c:forEach items="${entry.value}" var="item">
                    <a class="container<c:if test="${item.isNew()}"> new</c:if>" href="lists.jsp?title=${item.title}&url=${item.url}">
                        <!--With ripple-effect -> Performance decrease
                        <section class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                        -->
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
            </section>
            </c:forEach>
        </main>
	</div>
</body>
</html>