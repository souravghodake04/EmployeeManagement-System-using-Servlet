package com.servlet;

import java.io.IOException;

import com.dao.EmployeeDAO;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("empId"));

		String name = request.getParameter("empName");

		String email = request.getParameter("email");

		String mobile = request.getParameter("mobile");

		String department = request.getParameter("department");

		double salary = Double.parseDouble(request.getParameter("salary"));

		String address = request.getParameter("address");

		Employee emp = new Employee();

		emp.setId(id);
		emp.setName(name);
		emp.setEmail(email);
		emp.setMobile(mobile);
		emp.setDepartment(department);
		emp.setSalary(salary);
		emp.setAddress(address);

		EmployeeDAO dao = new EmployeeDAO();

		boolean status = dao.addEmployee(emp);

		if (status) {

			response.sendRedirect("viewEmployees.jsp");

		} else {

			response.getWriter().println("Employee Not Added");

		}

	}
}