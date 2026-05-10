<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String admin =
(String)session.getAttribute("admin");

if(admin == null){

	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Employee</title>

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

							<h3>Search Employee</h3>

						</div>

						<div class="card-body">

							<form method="get" action="searchEmployee.jsp">

								<div class="row">

									<div class="col-md-9">

										<input type="number" name="id" class="form-control"
											placeholder="Enter Employee ID" required>

									</div>

									<div class="col-md-3">

										<button class="btn btn-success w-100">

											<i class="fa fa-search"></i> Search

										</button>

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

								<tr>
									<th>Salary</th>
									<td><%=rs.getDouble(6)%></td>
								</tr>

								<tr>
									<th>Address</th>
									<td><%=rs.getString(7)%></td>
								</tr>

							</table>

							<%
							} else {
							%>

							<div class="alert alert-danger text-center">Employee Not
								Found</div>

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