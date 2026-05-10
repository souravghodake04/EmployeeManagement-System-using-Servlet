<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>

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
<title>View Employees</title>

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

.table-container {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

		<div class="container-fluid">

			<div class="table-container">

				<h2 class="mb-4 text-center">Employee Records</h2>

				<table class="table table-bordered table-hover">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Department</th>
							<th>Salary</th>
							<th>Address</th>
						</tr>

					</thead>

					<tbody>

						<%
						try {

							Connection con = DBConnection.getConnection();

							String sql = "SELECT * FROM employee";

							PreparedStatement ps = con.prepareStatement(sql);

							ResultSet rs = ps.executeQuery();

							while (rs.next()) {
						%>

						<tr>

							<td><%=rs.getInt(1)%></td>

							<td><%=rs.getString(2)%></td>

							<td><%=rs.getString(3)%></td>

							<td><%=rs.getString(4)%></td>

							<td><%=rs.getString(5)%></td>

							<td><%=rs.getDouble(6)%></td>

							<td><%=rs.getString(7)%></td>

						</tr>

						<%
						}

						} catch (Exception e) {
						out.println(e);
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</body>
</html>