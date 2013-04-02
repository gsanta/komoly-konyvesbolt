package komoly.action;

import komoly.bean.UserData;
import komoly.common.BaseActionBean;
import komoly.dao.UserDao;
import komoly.dao.impl.UserDaoImpl;
import komoly.utils.Role;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

public class LoginActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/login.jsp";

	/**
	 * The email.
	 */
	@Validate(required = true)
	private String email;

	/**
	 * The password.
	 */
	@Validate(required = true)
	private String password;

	private UserDao userDao = new UserDaoImpl();

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(final String password) {
		this.password = password;
	}

	/**
	 * Default handler. Returns the current view if no user is logged in.
	 * Otherwise forwards to the main page.
	 * 
	 * @return VIEW
	 */
	@DefaultHandler
	@DontValidate
	public Resolution view() {
		if (getContext().getUser() != null) {
			return new RedirectResolution(TestActionBean.class);
		}
		return new ForwardResolution(VIEW);
	}

	/**
	 * Login action.
	 * 
	 * @return to the main page.
	 */
	public Resolution login() {
		//		getContext().setUser(email);
		//		getContext().setRole(Role.LOGGED_IN_USER);
		return new RedirectResolution(TestActionBean.class);
	}

	/**
	 * Validation method that checks the username and password against validity.
	 * 
	 * @param errors
	 *            validation errors.
	 */
	@ValidationMethod
	public void validateUser(final ValidationErrors errors) {
		Role role = userDao.authenticate(email, password);
		if (role != null) {
			UserData userData = userDao.getUserData(email, role);

			getContext().setUser(userData);
			//getContext().setRole(Role.LOGGED_IN_USER);
		}
	}
}