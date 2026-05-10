<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
	background: #f4f6f9;
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

	<!-- Session Protection -->
	<%
	String admin = (String) session.getAttribute("admin");

	if (admin == null) {

		response.sendRedirect("login.jsp");
		return;
	}
	%>

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
			</a> <a href="updateEmployee.jsp" class="nav-link"> <i
				class="fa fa-edit"></i> Update Employee
			</a> <a href="deleteEmployee.jsp" class="nav-link"> <i
				class="fa fa-trash"></i> Delete Employee
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

						<div class="card-header
					bg-primary text-white text-center">

							<h3>Update Employee</h3>

						</div>

						<div class="card-body">

							<!-- Search Form -->
							<form method="get" action="updateEmployee.jsp">

								<div class="row">

									<div class="col-md-9">

										<input type="number" name="id" class="form-control"
											placeholder="Enter Employee ID" required>

									</div>

									<div class="col-md-3">

										<button class="btn btn-success w-100">Search</button>

									</div>

								</div>

							</form>

							<hr>

							<%
							String id = request.getParameter("id");

							if (id != null) {

								try {

									Connection con = DBConnection.getConnection();

									String sql = "SELECT * FROM employee WHERE id=?";

									PreparedStatement ps = con.prepareStatement(sql);

									ps.setInt(1, Integer.parseInt(id));

									ResultSet rs = ps.executeQuery();

									if (rs.next()) {
							%>

							<!-- Update Form -->
							<form method="post" action="updateEmployee.jsp">

								<input type="hidden" name="id" value="<%=rs.getInt(1)%>">

								<div class="mb-3">

									<label>Name</label> <input type="text" name="name"
										class="form-control" value="<%=rs.getString(2)%>" required>

								</div>

								<div class="mb-3">

									<label>Email</label> <input type="email" name="email"
										class="form-control" value="<%=rs.getString(3)%>" required>

								</div>

								<div class="mb-3">

									<label>Mobile</label> <input type="text" name="mobile"
										class="form-control" value="<%=rs.getString(4)%>" required>

								</div>

								<div class="mb-3">

									<label>Department</label> <input type="text" name="department"
										class="form-control" value="<%=rs.getString(5)%>" required>

								</div>

								<div class="mb-3">

									<label>Salary</label> <input type="number" name="salary"
										class="form-control" value="<%=rs.getDouble(6)%>" required>

								</div>

								<div class="mb-3">

									<label>Address</label>

									<textarea name="address" class="form-control" required><%=rs.getString(7)%></textarea>

								</div>

								<button class="btn btn-primary">Update Employee</button>

							</form>

							<%
							} else {
							%>

							<div class="alert alert-danger mt-3">Employee Not Found</div>

							<%
							}

							} catch (Exception e) {
							out.println(e);
							}
							}
							%>

							<%
							if (request.getMethod().equalsIgnoreCase("POST")) {

								try {

									Connection con = DBConnection.getConnection();

									String sql = "UPDATE employee SET name=?,email=?,mobile=?,department=?,salary=?,address=? WHERE id=?";

									PreparedStatement ps = con.prepareStatement(sql);

									ps.setString(1, request.getParameter("name"));

									ps.setString(2, request.getParameter("email"));

									ps.setString(3, request.getParameter("mobile"));

									ps.setString(4, request.getParameter("department"));

									ps.setDouble(5, Double.parseDouble(request.getParameter("salary")));

									ps.setString(6, request.getParameter("address"));

									ps.setInt(7, Integer.parseInt(request.getParameter("id")));

									int row = ps.executeUpdate();

									if (row > 0) {
							%>

							<div class="alert alert-success mt-3">Employee Updated
								Successfully</div>

							<%
							}

							} catch (Exception e) {
							out.println(e);
							}
							}
							%>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>