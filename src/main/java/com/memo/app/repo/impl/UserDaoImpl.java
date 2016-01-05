package com.memo.app.repo.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.UserSecurConfig;
import com.memo.app.entities.UserRole;
import com.memo.app.repo.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource dataSource;

	@Override
	public UserSecurConfig findUserByUserName(String username) {

		String sql = "SELECT id,name,password,enable FROM tbuser WHERE name LIKE ?";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			UserSecurConfig user = null;
			if (rs.next()) {
				user = new UserSecurConfig();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEnabled(rs.getBoolean(4));
				user.setRoles(this.findUserRoleByUserId(user.getId()));
			}
			return user;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return null;
	}
	public List<UserRole> findUserRoleByUserId(int id) {
			String sql="SELECT id,role FROM tbuser WHERE id=?";
			try(
					Connection conn=dataSource.getConnection();
					PreparedStatement ps=conn.prepareStatement(sql);
			){
					ps.setInt(1,id);
					ResultSet rs=ps.executeQuery();
					List<UserRole> roles=new ArrayList<UserRole>();
					UserRole role=null;
					while(rs.next()){
						role=new UserRole();
						role.setId(rs.getInt(1));
						role.setName(rs.getString(2));
						roles.add(role);
					}
					System.out.println(roles);
				return roles;
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}
		return null;
	}

	@Override
	public UserSecurConfig loadUserById(int id) {
		String sql = "SELECT id,name,password,enable FROM tbuser WHERE id=?";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			UserSecurConfig user = null;
			if (rs.next()) {
				user = new UserSecurConfig();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEnabled(rs.getBoolean(4));
				user.setRoles(this.findUserRoleByUserId(user.getId()));
			}
			return user;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return null;
	}
}
