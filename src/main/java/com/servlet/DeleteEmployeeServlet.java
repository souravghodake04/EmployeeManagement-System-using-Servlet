package com.servlet;

import java.io.IOException;

import com.dao.EmployeeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		EmployeeDAO dao = new EmployeeDAO();

		boolean status = dao.deleteEmployee(id);

		if (status) {

			response.sendRedirect("viewEmployees.jsp");

		} else {

			response.getWriter().println("Delete Failed");

		}
	}
}