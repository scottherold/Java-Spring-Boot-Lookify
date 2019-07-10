<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<title>Lookify!</title>
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
						<li class="nav-item active">
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
					    <input class="form-control mr-sm-2" placeholder="Search Artists" aria-label="Search" name="search" required>
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    	</form>
			    </div>
			</nav>
			<div class="row justify-content-center bg-white border rounded-bottom">
				<c:if test="${not empty songs}" >
					<div class="col-8 p-3">
						<div class="row justify-content-center pb-2">
							<h2 class="text-center">List of Songs</h2>
						</div>
						<div class="row justify-content-center">
					        <table class="table">
					        	<thead>
					        		<tr>
						        		<th scope="col">Title</th>
						        		<th scope="col">Artist</th>
						        		<th scope="col">Rating</th>
						        		<th scope="col">Actions</th>
						        	</tr>					        		
					        	</thead>
					        	<c:forEach items="${songs}" var="song">								    
							        <tr>
							            <td><a href="/songs/<c:out value="${song.id}"/>"><c:out value="${song.title}"/></a></td>
							            <td><c:out value="${song.artist}"/></td>
							            <td><c:out value="${song.rating}"/></td>
							            <td>
					            			<form action="/songs/<c:out value="${song.id}"/>" method="post">
					            				<input type="hidden" name="_method" value="delete">
		    									<input type="submit" class="btn btn-link" value="delete">
					            			</form>
							            </td>
							        </tr>
					        	</c:forEach>
					        </table>
						</div>
					</div>
				</c:if>
				<c:if test="${empty songs}" >
					<div class="row justify-content-center p-5">						
						<h1 class="text-center">No songs added yet...</h1>
					</div>
				</c:if>
			</div>
		</div>
	</body>
</html>