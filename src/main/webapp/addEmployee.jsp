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
<title>Add Employee</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
	background-color: #f4f6f9;
}

.sidebar {
	width: 250px;
	height: 100vh;
	background: #212529;
	position: fixed;
}

.sidebar .nav-link {
	color: white;
	padding: 12px;
	border-radius: 5px;
	margin-bottom: 5px;
}

.sidebar .nav-link:hover {
	background: #0d6efd;
}

.main-content {
	margin-left: 250px;
	padding: 30px;
}

.card {
	border: none;
	border-radius: 10px;
}
</style>

</head>

<body>

	<!-- Sidebar -->
	<div class="sidebar">

		<h3 class="text-white text-center py-3 border-bottom">Admin Panel
		</h3>

		<div class="p-3">

			<a href="dashboard.jsp" class="nav-link"> <i class="fa fa-home"></i>
				Dashboard
			</a> <a href="addEmployee.jsp" class="nav-link"> <i
				class="fa fa-user-plus"></i> Add Employee
			</a> <a href="viewEmployees.jsp" class="nav-link"> <i
				class="fa fa-users"></i> View Employees
			</a> <a href="searchEmployee.jsp" class="nav-link"> <i
				class="fa fa-search"></i> Search Employee
			</a> <a href="logout.jsp" class="nav-link text-warning fw-bold"> <i
				class="fa fa-sign-out-alt"></i> Logout
			</a>

		</div>

	</div>


	<!-- Main Content -->
	<div class="main-content">

		<div class="container">

			<div class="row justify-content-center">

				<div class="col-md-8">

					<div class="card shadow">

						<div class="card-header bg-primary text-white text-center">

							<h3>Add Employee</h3>

						</div>

						<div class="card-body">

							<form action="AddEmployeeServlet" method="post">

								<div class="row">

									<div class="col-md-6 mb-3">

										<label class="form-label"> Employee ID </label> <input
											type="text" name="empId" class="form-control" required>

									</div>


									<div class="col-md-6 mb-3">

										<label class="form-label"> Employee Name </label> <input
											type="text" name="empName" class="form-control" required>

									</div>

								</div>


								<div class="row">

									<div class="col-md-6 mb-3">

										<label class="form-label"> Email </label> <input type="email"
											name="email" class="form-control" required>

									</div>


									<div class="col-md-6 mb-3">

										<label class="form-label"> Mobile Number </label> <input
											type="text" name="mobile" class="form-control" required>

									</div>

								</div>


								<div class="row">

									<div class="col-md-6 mb-3">

										<label class="form-label"> Department </label> <select
											name="department" class="form-select" required>

											<option value="">Select Department</option>

											<option>HR</option>

											<option>IT</option>

											<option>Sales</option>

											<option>Marketing</option>

										</select>

									</div>


									<div class="col-md-6 mb-3">

										<label class="form-label"> Salary </label> <input
											type="number" name="salary" class="form-control" required>

									</div>

								</div>


								<div class="mb-3">

									<label class="form-label"> Address </label>

									<textarea name="address" rows="3" class="form-control" required></textarea>

								</div>


								<div class="text-center">

									<button type="submit" class="btn btn-success px-4">

										<i class="fa fa-save"></i> Save Employee

									</button>

									<button type="reset" class="btn btn-secondary px-4">

										Reset</button>

								</div>

							</form>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>