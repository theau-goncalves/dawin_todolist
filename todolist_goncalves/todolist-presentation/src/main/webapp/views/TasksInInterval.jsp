<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<c:url value="/resources/css/materialize.min.css"/>" type="text/css" rel="stylesheet" media="screen,projection">
	<link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
	<link rel="shortcut icon" href="http://theau-goncalves.fr/assets/img/favicons/favicon.png" /> <!-- Parce qu'il faut bien que je fasse ma pub quelque part -->
    <title>Résultat de la recherche</title>
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
	    <c:choose>
	      <c:when test="${tasks.isEmpty()}">
	        <div class="row">
	          <div class="col s12 m12">
	            <p class="center-align"><i class="large material-icons">warning</i></p>
	            <h4 class="center-align">Désolé, aucune tâche n'a été trouvée dans la prédiode sélectionée</h4>
	          </div>
	        </div>
		  </c:when>
		  <c:otherwise>
		<h3>Vos tâches </h3>
	        <c:forEach items="${tasks}" var="task">
	          <div class="row">
	            <div class="col s12 m12">
	              <div class="card grey lighten-5">
	                <div class="card-content">
	                  <span class="card-title">${task.label}</span><hr>
	                  <p>Début : <fmt:formatDate type="date" dateStyle="short" timeStyle="short" value="${task.beginningDate}" /></p>
	                  <p>Fin : <fmt:formatDate type="date" dateStyle="short" timeStyle="short" value="${task.plannedEndingDate}" /></p>
	                </div>
	             </div>
	            </div>
	          </div>
		    </c:forEach>
		  </c:otherwise>
	    </c:choose>
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
  </body>
</html>