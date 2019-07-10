<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- To use form binding -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<title>Add New Song</title>
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
						<li class="nav-item active">
							<a class="nav-link current" href="/songs/new">Add New</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/search/topTen">Top Songs</a>
						</li>
					</ul>
				</div>
				<div class="align-items-end">
					<form:form class="form-inline my-2 my-lg-0" action="/search" method="get">
					    <input class="form-control mr-sm-2" placeholder="Search Artists" aria-label="Search" name="search" required>
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    	</form:form>
			    </div>
			</nav>
			<div class="row justify-content-center bg-white border rounded-bottom">
				<div class="col-8 p-3">
					<div class="row justify-content-center border-bottom pb-2">
						<h2 class="text-center">Add New Song</h2>
					</div>
					<div class="row justify-content-center">
						<div class="col-4 p-2">
							<form:form action="/songs/new" method="post" modelAttribute="song">
								<div class="row justify-content-start">
									<div class="col-6">
								        <form:label path="title">Title</form:label>
							        </div>
							        <div class="col-6">
							        	<form:input path="title"/>
							        </div>
							        <div class="col-12">
										<p class="text-danger"><form:errors path="title"/></p>
									</div>
								</div>
								<div class="row justify-content-start">
									<div class="col-6">
								        <form:label path="artist">Artist</form:label>
								    </div>
							        <div class="col-6">  
							        	<form:input path="artist"/>
									</div>
									<div class="col-12">
										<p class="text-danger"><form:errors path="artist"/></p>
									</div>
								</div>
								<div class="row justify-content-start">
									<div class="col-6">
							        	<form:label path="rating">Rating (1-10)</form:label>
							        </div>
							        <div class="col-6">  
							        	<!-- JSTL for select list -->
							        	<form:select path="rating">
							        		<!-- Loop for form options -->
							        		<c:forEach begin="1" end="10" varStatus="loop">
							        			<form:option value="${loop.index}" label="${loop.index}" />
							        		</c:forEach>
							        	</form:select>							        	
							        </div>
							        <div class="col-12">
										<p class="text-danger"><form:errors path="rating"/></p>
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-2-offset-5">
							    		<input type="submit" value="Submit" class="btn btn-success"/>
							    	</div>
							    </div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>