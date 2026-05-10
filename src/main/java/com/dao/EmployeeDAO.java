package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.db.DBConnection;
import com.model.Employee;

public class EmployeeDAO {

	public boolean addEmployee(Employee emp) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO employee VALUES(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, emp.getId());
			ps.setString(2, emp.getName());
			ps.setString(3, emp.getEmail());
			ps.setString(4, emp.getMobile());
			ps.setString(5, emp.getDepartment());
			ps.setDouble(6, emp.getSalary());
			ps.setString(7, emp.getAddress());

			int row = ps.executeUpdate();

			if (row > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public boolean updateEmployee(Employee emp) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "UPDATE employee SET name=?,email=?,mobile=?,department=?,salary=?,address=? WHERE id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, emp.getName());

			ps.setString(2, emp.getEmail());

			ps.setString(3, emp.getMobile());

			ps.setString(4, emp.getDepartment());

			ps.setDouble(5, emp.getSalary());

			ps.setString(6, emp.getAddress());

			ps.setInt(7, emp.getId());

			int row = ps.executeUpdate();

			if (row > 0) {

				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public boolean deleteEmployee(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM employee WHERE id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int row = ps.executeUpdate();

			if (row > 0) {

				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}