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
				"(firstname, lastname, companyname, email, password, isenabled, token, isemployer, employernumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("FirstName").toString().toUpperCase());
			ps.setString(2, input.get("LastName").toString().toUpperCase());
			ps.setString(3, input.get("CompanyName").toString().toUpperCase());
			ps.setString(4, input.get("EmailId").toString().toLowerCase());
			ps.setString(5, input.get("Password").toString());
			ps.setString(6, "N"); //default Value
			ps.setString(7, input.get("token").toString());
			ps.setString(8, input.get("isEmployer").toString());
			ps.setString(9, input.get("EmployerNumber").toString().toUpperCase());
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
			ps.setString(1, input.get("EmailId").toString().toLowerCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = "TRUE";
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			//Do nothing;
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return flag;
	}

	@Override
	public void replaceToken(Map<String, ? extends Object> input) {
		
		String sql = "update user_login_profile set token = ? where email = ?;";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("token").toString());
			ps.setString(2, input.get("EmailId").toString().toLowerCase());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			//Do nothing;

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}

	@Override
	public String verify(Map<String, ? extends Object> input) {
		
		String sql = "select * from authenticate.user_login_profile where email = ? and password = ?;";
		String flag = "FALSE";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("EmailId").toString().toLowerCase());
			ps.setString(2, input.get("Password").toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if(rs.getString("isenabled").equals("Y")) {
					flag = "TRUE-Y";
				} else {
					flag = "TRUE-N";
				}
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			//Do nothing;
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return flag;
	}
	
	@Override
	public String checkEmployerId(Map<String, ? extends Object> input) {
		
		String sql = "select * from authenticate.user_login_profile where employernumber = ?;";
		String flag = "FALSE";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("EmployerNumber").toString().toUpperCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = "TRUE";
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			//Do nothing;
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return flag;
	}

	@Override
	public String verifyToken(Map<String, ? extends Object> input) {
		
		String sql = "select * from authenticate.user_login_profile where token = ?;";
		String flag = "FALSE";
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, input.get("token").toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = "TRUE";
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			//Do nothing;
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
