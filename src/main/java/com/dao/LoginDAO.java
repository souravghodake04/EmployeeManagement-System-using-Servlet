package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;

public class LoginDAO {

	public boolean validate(String username, String password) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM admin WHERE username=? AND password=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			status = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}