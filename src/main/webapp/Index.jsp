<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">


<link rel="stylesheet" href="Css/Style.css">

</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">

			<a class="navbar-brand fw-bold" href="#"> Student Management
				System </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">

				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link active" href="#">Home</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#">About</a></li>

					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>

					<li class="nav-item ms-3"><a class="btn btn-warning"
						href="login.jsp"> Login </a></li>

				</ul>

			</div>
		</div>
	</nav>

	<section class="hero-section d-flex align-items-center">

		<div class="container text-center text-white">

			<h1 class="display-4 fw-bold">Welcome to Student Management
				System</h1>

			<p class="lead mt-3">Manage students, courses, attendance, and
				records efficiently.</p>

			<a href="login.jsp" class="btn btn-lg btn-primary mt-3"> Get
				Started </a>

		</div>

	</section>



	<footer class="bg-dark text-white text-center p-3"> © 2026
		Student Management System | All Rights Reserved </footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>