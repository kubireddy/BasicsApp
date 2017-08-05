package com.klr.repositoryAndService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("signupServiceImpl") 
public class SignupServiceImpl implements RepositoryService {
	
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(SignupServiceImpl.class);
	
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Map<String, ? extends Object> input) {
		
		String sql = "insert into user_login_profile " +
				"(firstname, lastname, email, password, isenabled, token) VALUES (?, ?, ?, ?, ?, ?)";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("FirstName").toString());
			ps.setString(2, input.get("LastName").toString());
			ps.setString(3, input.get("EmailId").toString());
			ps.setString(4, input.get("Password").toString());
			ps.setString(5, "N"); //default Value
			ps.setString(6, input.get("token").toString());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}

	@Override
	public String checkUserExistance(Map<String, ? extends Object> input) {
		
		String sql = "select * from user_login_profile where email = ?";
		String flag = "FALSE";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("EmailId").toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = "TRUE";
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return flag;
	}
	
}
