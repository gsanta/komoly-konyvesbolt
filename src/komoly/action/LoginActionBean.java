package komoly.action;

import komoly.bean.UserData;
import komoly.common.BaseActionBean;
import komoly.dao.UserDao;
import komoly.dao.impl.UserDaoImpl;
import komoly.utils.Constants;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.EmailTypeConverter;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

import org.apache.log4j.Logger;

public class LoginActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/login.jsp";

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(LoginActionBean.class);

	/**
	 * The email.
	 */
	@Validate(required = true, converter = EmailTypeConverter.class)
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
			return new RedirectResolution(HomeActionBean.class);
		}
		return new RedirectResolution(HomeActionBean.class);
	}

	/**
	 * Login action.
	 * 
	 * @return to the main page.
	 */
	@SuppressWarnings({ "unchecked" })
	public Resolution login() {
		//		getContext().setUser(email);
		//		getContext().setRole(Role.LOGGED_IN_USER);

		Class<ActionBean> actionClass = (Class<ActionBean>) getContext()
				.readFromSession(Constants.INTERCEPTED_ACTION_BEAN);

		if (actionClass != null) {
			return new RedirectResolution(actionClass);
		}
		return new RedirectResolution(HomeActionBean.class);
	}

	@DontValidate
	@SuppressWarnings({ "unchecked" })
	public Resolution logout() {
		//		getContext().setUser(email);
		//		getContext().setRole(Role.LOGGED_IN_USER);

		Class<ActionBean> actionClass = (Class<ActionBean>) getContext()
				.readFromSession(Constants.INTERCEPTED_ACTION_BEAN);

		getContext().logout();

		if (actionClass != null) {
			return new RedirectResolution(actionClass);
		}
		return new RedirectResolution(HomeActionBean.class);
	}

	/**
	 * Validation method that checks the username and password against validity.
	 * 
	 * @param errors
	 *            validation errors.
	 */
	@ValidationMethod
	public void validateUser(final ValidationErrors errors) {
		UserData userData = userDao.authenticate(email, password);
		if (userData != null) {
			LOGGER.info("name: " + userData.getName());
			getContext().setUser(userData);
			//getContext().setRole(Role.LOGGED_IN_USER);
		} else {

			errors.add("contact.email", new SimpleError(
					"Hibás felhasználónév vagy jelszó."));
		}
	}
}