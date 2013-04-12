package komoly.dao.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
	public UserData authenticate(String email, String password) {

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
		LOGGER.info("Email: " + email);

		Connection conn = DatabaseHelper.getConnection();

		String queryAdmin = "select * from admin where email like ? and password like ?";
		String queryUser = "select * from users where email like ? and password like ?";
		PreparedStatement stm = null;
		ResultSet rs = null;

		UserData userData = null;

		try {

			stm = conn.prepareStatement(queryAdmin);
			stm.setString(1, email);
			stm.setString(2, sb.toString());

			rs = stm.executeQuery();

			if (rs.next()) {
				userData = new UserData();
				userData.setEmail(rs.getString("EMAIL"));
				userData.setId(rs.getInt(1));
				userData.setName(rs.getString("NEV"));
				userData.setRole(Role.ADMIN);
				return userData;
			}

			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);

			stm = conn.prepareStatement(queryUser);
			stm.setString(1, email);
			stm.setString(2, sb.toString());

			rs = stm.executeQuery();

			if (rs.next()) {
				userData = new UserData();
				userData.setEmail(rs.getString("EMAIL"));
				userData.setId(rs.getInt(1));
				userData.setName(rs.getString("NEV"));

				if (rs.getInt("ISTORZSVASARLO") == 0) {
					userData.setTorzsvasarlo(false);
				} else {
					userData.setTorzsvasarlo(true);
				}

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				String query = "select * from CIMEK, IRANYITOSZAM where IRANYITOSZAM.IRSZ = CIMEK.IRSZ and USER_ID = ?";
				stm = conn.prepareStatement(query);
				stm.setInt(1, userData.getId());

				rs = stm.executeQuery();

				if (rs.next()) {
					userData.setIrsz(rs.getInt("IRSZ"));
					userData.setHazSzam(rs.getInt("HAZSZAM"));
					userData.setUtca(rs.getString("UTCA"));
					userData.setVaros(rs.getString("TELEPULES"));
				}

				userData.setRole(Role.LOGGED_IN_USER);
				return userData;
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
	public UserData getUserData(int id, Role role) {
		Connection conn = DatabaseHelper.getConnection();

		String query = "select * from users where user_id = ?";

		if (role == Role.ADMIN) {
			query = "select * from admin where admin_id = ?";
		}

		PreparedStatement stm = null;
		ResultSet rs = null;

		UserData userData = null;

		try {

			stm = conn.prepareStatement(query);
			stm.setInt(1, id);

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

					DatabaseHelper.close(rs);
					DatabaseHelper.close(stm);

					query = "select * from CIMEK, IRANYITOSZAM where IRANYITOSZAM.IRSZ = CIMEK.IRSZ and USER_ID = ?";
					stm = conn.prepareStatement(query);
					stm.setInt(1, userData.getId());

					rs = stm.executeQuery();

					if (rs.next()) {
						userData.setIrsz(rs.getInt("IRSZ"));
						userData.setHazSzam(rs.getInt("HAZSZAM"));
						userData.setUtca(rs.getString("UTCA"));
						userData.setVaros(rs.getString("TELEPULES"));
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
	public boolean changeUserData(UserData userData, Role role,
			List<String> errors) {

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
				String queryEmail = "select count(*) from USERS where USER_ID != ? and EMAIL = ?";

				stm = conn.prepareStatement(queryEmail);
				stm.setInt(1, userData.getId());
				stm.setString(2, userData.getEmail());

				rs = stm.executeQuery();

				if (rs.next() && rs.getInt(1) > 0) {
					LOGGER.info("Mar van ilyen email cim!");

					errors.add("Ez az email cím már foglalt!");
					return false;
				}

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				String update = "update USERS set NEV = ?, EMAIL = ? where USER_ID = ?";

				stm = conn.prepareStatement(update);
				stm.setString(1, userData.getName());
				stm.setString(2, userData.getEmail());
				stm.setInt(3, userData.getId());

				int rows = stm.executeUpdate();

				DatabaseHelper.close(rs);
				DatabaseHelper.close(stm);

				update = "update CIMEK set IRSZ = ?, UTCA = ?, HAZSZAM = ? where USER_ID = ?";

				stm = conn.prepareStatement(update);
				stm.setInt(1, userData.getIrsz());
				stm.setString(2, userData.getUtca());
				stm.setInt(3, userData.getHazSzam());
				stm.setInt(4, userData.getId());

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
