<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body class="bg-light">

	<div class="container">

		<div class="row justify-content-center mt-5">

			<div class="col-md-4">

				<div class="card shadow">

					<div class="card-header text-center bg-dark text-white">
						<h3>Admin Login</h3>
					</div>

					<div class="card-body">

						<form action="LoginServlet" method="post">

							<div class="mb-3">
								<label>Username</label> <input type="text" name="username"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									class="form-control" required>
							</div>

							<div class="d-grid">
								<button class="btn btn-primary">Login</button>
							</div>

						</form>

						<%
						String error = (String) request.getAttribute("error");

						if (error != null) {
						%>

						<p class="text-danger text-center mt-3">
							<%=error%>
						</p>

						<%
						}
						%>

					</div>
				</div>

			</div>

		</div>

	</div>

</body>
</html>