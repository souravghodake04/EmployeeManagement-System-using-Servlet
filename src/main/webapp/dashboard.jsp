<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String admin = (String) session.getAttribute("admin");

if (admin == null) {

	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="Css/Dashboard.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

	<div class="wrapper">

		<!-- Sidebar -->
		<div class="sidebar">

			<h2 class="text-center text-white py-3 border-bottom">Admin
				Panel</h2>

			<ul class="nav flex-column p-3">

				<li class="nav-item mb-2"><a href="addEmployee.jsp"
					class="nav-link text-white"> <i class="fa fa-user-plus"></i>
						Add Employee
				</a></li>

				<li class="nav-item mb-2"><a href="viewEmployees.jsp"
					class="nav-link text-white"> <i class="fa fa-users"></i> View
						Employees
				</a></li>

				<li class="nav-item mb-2"><a href="searchEmployee.jsp"
					class="nav-link text-white"> <i class="fa fa-search"></i>
						Search Employee
				</a></li>

				<li class="nav-item mb-2"><a href="updateEmployee.jsp"
					class="nav-link text-white"> <i class="fa fa-edit"></i> Update
						Employee
				</a></li>

				<li class="nav-item mb-2"><a href="deleteEmployee.jsp"
					class="nav-link text-white"> <i class="fa fa-trash"></i> Delete
						Employee
				</a></li>

				<li class="nav-item mt-4"><a
					href="<%=request.getContextPath()%>/logout.jsp"
					class="nav-link text-warning fw-bold"> <i
						class="fa fa-sign-out-alt"></i> Logout

				</a></li>
			</ul>

		</div>


		<!-- Main Content -->
		<div class="main-content">

			<!-- Header -->
			<div class="header d-flex justify-content-between align-items-center">

				<h3>Employee Management Dashboard</h3>

				<div>Welcome Admin</div>

			</div>


			<!-- Dashboard Cards -->
			<div class="container-fluid mt-4">

				<div class="row g-4">

					<div class="col-md-4">

						<div class="card dashboard-card shadow">

							<a href="addEmployee.jsp"
								class="nav-link text-dark text-decoration-none">

								<div class="card-body text-center">

									<i class="fa fa-user-plus fa-3x text-primary"></i>

									<h4 class="mt-3">Add Employee</h4>

									<p>Add new employee records</p>

								</div>

							</a>

						</div>

					</div>


					<div class="col-md-4">

						<div class="card dashboard-card shadow">
							<a href="viewEmployees.jsp"
								class="nav-link text-dark text-decoration-none">
								<div class="card-body text-center">

									<i class="fa fa-users fa-3x text-success"></i>

									<h4 class="mt-3">View Employees</h4>

									<p>Manage employee records</p>

								</div>
							</a>
						</div>

					</div>


					<div class="col-md-4">

						<div class="card dashboard-card shadow">
							<a href="searchEmployee.jsp"
								class="nav-link text-dark text-decoration-none">
								<div class="card-body text-center">

									<i class="fa fa-search fa-3x text-danger"></i>

									<h4 class="mt-3">Search Employee</h4>

									<p>Find employee details quickly</p>

								</div>
							</a>
						</div>

					</div>

					<div class="col-md-4">

						<div class="card dashboard-card shadow">

							<a href="updateEmployee.jsp"
								class="nav-link text-dark text-decoration-none">

								<div class="card-body text-center">

									<i class="fa fa-edit fa-3x text-warning"></i>

									<h4 class="mt-3">Update Employee</h4>

									<p>Update employee details</p>

								</div>

							</a>

						</div>

					</div>

					<div class="col-md-4">

						<div class="card dashboard-card shadow">

							<a href="deleteEmployee.jsp"
								class="nav-link text-dark text-decoration-none">

								<div class="card-body text-center">

									<i class="fa fa-trash fa-3x text-danger"></i>

									<h4 class="mt-3">Delete Employee</h4>

									<p>Remove employee records</p>

								</div>

							</a>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>