<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = request.getParameter("msg");

if ("deleted".equals(msg)) {
%>

<div class="alert alert-success">Employee Deleted Successfully</div>

<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>

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
					bg-danger text-white text-center">

							<h3>Delete Employee</h3>

						</div>

						<div class="card-body">

							<!-- Search Form -->
							<form method="get" action="deleteEmployee.jsp">

								<div class="row">

									<div class="col-md-9">

										<input type="number" name="id" class="form-control"
											placeholder="Enter Employee ID" required>

									</div>

									<div class="col-md-3">

										<button class="btn btn-danger w-100">Search</button>

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

							<table class="table table-bordered">

								<tr>
									<th>ID</th>
									<td><%=rs.getInt(1)%></td>
								</tr>

								<tr>
									<th>Name</th>
									<td><%=rs.getString(2)%></td>
								</tr>

								<tr>
									<th>Email</th>
									<td><%=rs.getString(3)%></td>
								</tr>

								<tr>
									<th>Mobile</th>
									<td><%=rs.getString(4)%></td>
								</tr>

								<tr>
									<th>Department</th>
									<td><%=rs.getString(5)%></td>
								</tr>

							</table>
							<form method="post" action="DeleteEmployeeServlet">

								<input type="hidden" name="id" value="<%=rs.getInt(1)%>">

								<button class="btn btn-danger">Delete Employee</button>

							</form>

							<%
							} else {
							%>

							<div class="alert alert-danger">Employee Not Found</div>

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