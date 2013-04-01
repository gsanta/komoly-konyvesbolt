package komoly.action;

import komoly.common.BaseActionBean;
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
	 * The username.
	 */
	@Validate(required = true)
	private String username;

	/**
	 * The password.
	 */
	@Validate(required = true)
	private String password;

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(final String username) {
		this.username = username;
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
		getContext().setUser(username);
		getContext().setRole(Role.LOGGED_IN_USER);
		return new RedirectResolution(TestActionBean.class);
	}

	/**
	 * Validation method that checks the username and password against validity.
	 * 
	 * @param errors
	 *            validation errors.
	 * @throws InstanceException
	 *             InstanceException
	 * @throws ModelException
	 *             ModelException
	 */
	@ValidationMethod
	public void validateUser(final ValidationErrors errors) {

		getContext().setUser(username);
		getContext().setRole(Role.LOGGED_IN_USER);
	}
}