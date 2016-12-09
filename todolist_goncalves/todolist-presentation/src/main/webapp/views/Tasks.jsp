<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/materialize.min.css"/>"
	type="text/css" rel="stylesheet" media="screen,projection">
	<link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="shortcut icon" href="http://theau-goncalves.fr/assets/img/favicons/favicon.png" /><!-- Parce qu'il faut bien que je fasse ma pub quelque part -->
<title>Taches</title>
</head>
<body>
	<nav>
	    <div class="nav-wrapper container grey darken-2">
	      <a href="<c:url value="/taches"/>" class="brand-logo left">Todolist Goncalves</a>
	      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	      <ul class="right hide-on-med-and-down">
	        <li><a href="<c:url value="/categories"/>">Categories</a></li>
	        <li><a href="<c:url value="/taches"/>">Tâches</a></li>
	        <li><a href="<c:url value="/recherche"/>">Recherche</a></li>
	      </ul>
	      <ul class="side-nav" id="mobile-demo">
	        <li><a href="<c:url value="/categories"/>">Categories</a></li>
	        <li><a href="<c:url value="/taches"/>">Tâches</a></li>
	        <li><a href="<c:url value="/recherche"/>">Recherche</a></li>
	      </ul>
	    </div>
  	</nav>
  	<div class="container">   
  		<h3 class="center-align">Liste des tâches</h3>
		<ul class="collection">
			<c:forEach items="${tasks}" var="task">
				<li class="collection-item">
					<i class="material-icons" style="margin-right: 15px;">new_releases</i><strong>${task.label}</strong> Début : 
					<fmt:formatDate type="date" dateStyle="short" timeStyle="short" value="${task.beginningDate}" /> / Fin 
					<fmt:formatDate type="date" dateStyle="short" timeStyle="short" value="${task.plannedEndingDate}" /></li>
					
			</c:forEach>
		</ul>
	</div>
	
	 <footer class="page-footer">
          <div class="footer-copyright grey darken-2">
            <div class="container">
            <span class="right">© 2016 Copyright Goncalves</span>
            </div>
          </div>
 <footer class="page-footer">
          <div class="footer-copyright grey darken-2">
            <div class="container">
            <span class="right">© 2016 Copyright Goncalves</span>
            </div>
          </div>
      </footer>	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
	<script>
	  $('.datepicker').pickadate({
		    selectMonths: true, // Creates a dropdown to control month
		    selectYears: 15 // Creates a dropdown of 15 years to control year
		  });
	</script>
	</body>
</html>