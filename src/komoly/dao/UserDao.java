package komoly.dao;

import java.util.List;

import komoly.bean.UserData;
import komoly.utils.Role;

public interface UserDao {

	/**
	 * Determines if the email/password pair is correct
	 * 
	 * @param email
	 * @param password
	 * @return
	 */
	UserData authenticate(String email, String password);

	UserData getUserData(int id, Role role);

	boolean changeUserData(UserData userData, Role role, List<String> errors);
}
