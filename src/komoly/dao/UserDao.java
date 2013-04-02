package komoly.dao;

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
	Role authenticate(String email, String password);

	UserData getUserData(String email, Role role);

	boolean changeUserData(UserData userData, Role role);
}
