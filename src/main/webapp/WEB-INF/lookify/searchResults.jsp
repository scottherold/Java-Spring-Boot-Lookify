<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<title>Songs by <c:out value="${search}" /></title>
	</head>
	<body class="bg-light">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand">Lookify</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="/dashboard">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/songs/new">Add New</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/search/topTen">Top Songs</a>
						</li>
					</ul>
				</div>
				<div class="align-items-end">
					<form class="form-inline my-2 my-lg-0" action="/search" method="get">
						<a class="nav-item px-2">Songs by Artist: "<c:out value="${search}" />"</a>
					    <input class="form-control mr-sm-2" placeholder="Search Artists" aria-label="Search" name="search" required>
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    	</form>
			    </div>
			</nav>
			<div class="row justify-content-center bg-white border rounded-bottom">
				<c:if test="${not empty songs}" >
					<div class="col-8 p-3">
						<div class="row justify-content-center pb-2">
							<h2 class="text-center">Songs by the artist "<c:out value="${search}" />"</h2>
						</div>
						<div class="row justify-content-center">
					        <table class="table">
					        	<thead>
					        		<tr>
					        			<th scope="col">Rating</th>
						        		<th scope="col">Title</th>
						        		<th scope="col">Artist</th>
						        	</tr>					        		
					        	</thead>
					        	<c:forEach items="${songs}" var="song">								    
							        <tr>
							        	<td><c:out value="${song.rating}"/></td>
							            <td><a href="/songs/<c:out value="${song.id}"/>"><c:out value="${song.title}"/></a></td>
							            <td><c:out value="${song.artist}"/></td>							            
							        </tr>
					        	</c:forEach>
					        </table>
						</div>
					</div>
				</c:if>
				<c:if test="${empty songs}" >
					<div class="row justify-content-center p-5">						
						<h1 class="text-center">No songs by "<c:out value="${search}" />" added yet...</h1>
					</div>
				</c:if>
			</div>
		</div>
	</body>
</html>