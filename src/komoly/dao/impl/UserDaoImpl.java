package komoly.dao.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import komoly.bean.UserData;
import komoly.dao.UserDao;
import komoly.utils.DatabaseHelper;
import komoly.utils.Role;

import org.apache.log4j.Logger;

public class UserDaoImpl implements UserDao {

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(UserDaoImpl.class);

	@Override
	public Role authenticate(String email, String password) {

		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		md.update(password.getBytes());

		byte byteData[] = md.digest();

		//convert the byte to hex format
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
					.substring(1));
		}

		LOGGER.info("Digest(in hex format):: " + sb.toString());

		Connection conn = DatabaseHelper.getConnection();

		String queryAdmin = "select count(*) as c from admin where email like ? and password like ?";
		String queryUser = "select count(*) as c from user where email like ? and password like ?";
		PreparedStatement stm = null;
		ResultSet rs = null;

		Role role = null;

		try {

			stm = conn.prepareStatement(queryAdmin);
			stm.setString(1, email);
			stm.setString(2, sb.toString());

			rs = stm.executeQuery();

			if (rs.next() && rs.getInt("c") == 1) {
				role = Role.ADMIN;
				return role;
			}

			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);

			stm = conn.prepareStatement(queryUser);
			stm.setString(1, email);
			stm.setString(2, sb.toString());

			rs = stm.executeQuery();

			if (rs.next() && rs.getInt("c") == 1) {
				role = Role.LOGGED_IN_USER;
				return role;
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return null;
	}

	@Override
	public UserData getUserData(String email, Role role) {
		Connection conn = DatabaseHelper.getConnection();

		String table = "user";

		if (role == Role.ADMIN) {
			table = "admin";
		}

		String query = "select * from " + table + " where email like ?";
		PreparedStatement stm = null;
		ResultSet rs = null;

		UserData userData = null;

		try {

			stm = conn.prepareStatement(query);
			stm.setString(1, email);

			rs = stm.executeQuery();

			if (rs.next()) {
				userData = new UserData();
				userData.setEmail(rs.getString("EMAIL"));
				userData.setId(rs.getInt(1));
				userData.setName(rs.getString("NEV"));

				if (role == Role.LOGGED_IN_USER) {
					if (rs.getInt("ISTORZSVASARLO") == 0) {
						userData.setTorzsvasarlo(false);
					} else {
						userData.setTorzsvasarlo(true);
					}
				}

				userData.setRole(role);
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
			return null;
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return userData;
	}

	@Override
	public boolean changeUserData(UserData userData, Role role) {

		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			if (role == Role.ADMIN) {
				String queryEmail = "select count(*) from ADMIN where ADMIN_ID != ? and EMAIL = ?";

				stm = conn.prepareStatement(queryEmail);
				stm.setInt(1, userData.getId());
				stm.setString(2, userData.getEmail());

				rs = stm.executeQuery();

				if (rs.next()) {
					LOGGER.info("Mar van ilyen email cim!");
					return false;
				}

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				String update = "update ADMIN set NEV = ? EMAIL = ? where ADMIN_ID = ?";

				stm = conn.prepareStatement(update);
				stm.setString(1, userData.getName());
				stm.setString(2, userData.getEmail());
				stm.setInt(3, userData.getId());

				int rows = stm.executeUpdate();

				if (rows == 0) {
					return false;
				}

			} else if (role == Role.LOGGED_IN_USER) {
				String queryEmail = "select count(*) from USER where USER_ID != ? and EMAIL = ?";

				stm = conn.prepareStatement(queryEmail);
				stm.setInt(1, userData.getId());
				stm.setString(2, userData.getEmail());

				rs = stm.executeQuery();

				if (rs.next()) {
					LOGGER.info("Mar van ilyen email cim!");
					return false;
				}

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				String update = "update USER set NEV = ? EMAIL = ? where USER_ID = ?";

				stm = conn.prepareStatement(update);
				stm.setString(1, userData.getName());
				stm.setString(2, userData.getEmail());
				stm.setInt(3, userData.getId());

				int rows = stm.executeUpdate();

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				update = "update CIMEK set IRSZ = ? UTCA = ? HAZSZAM = ?";

				stm = conn.prepareStatement(update);
				stm.setInt(1, userData.getIrsz());
				stm.setString(2, userData.getUtca());
				stm.setInt(3, userData.getHazSzam());

				rows += stm.executeUpdate();

				//város még hiányzik
				if (rows == 0) {
					return false;
				}
			}
		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
			return false;
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return true;
	}
}
