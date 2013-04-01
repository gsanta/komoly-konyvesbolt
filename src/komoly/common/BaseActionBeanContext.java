package komoly.common;

import javax.servlet.http.HttpSession;

import komoly.utils.Constants;
import komoly.utils.Role;
import net.sourceforge.stripes.action.ActionBeanContext;

import org.apache.log4j.Logger;

/**
 * Custom ActionBeanContext with helper methods for session management.
 * 
 */
public class BaseActionBeanContext extends ActionBeanContext {

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(BaseActionBeanContext.class);

	/**
	 * Adds an object with the given name to the session.
	 * 
	 * @param name
	 *            name
	 * @param value
	 *            value
	 */
	public void addToSession(final String name, final Object value) {

		getRequest().getSession().setAttribute(name, value);
	}

	public Object getFromSession(final String name) {
		return getRequest().getSession().getAttribute(name);
	}

	/**
	 * Read an object with the given name from the session.
	 * 
	 * @param name
	 *            name
	 * @param <T>
	 *            type of object
	 * @return object with the given name
	 */
	@SuppressWarnings("unchecked")
	public <T> T readFromSession(final String name) {
		return (T) getRequest().getSession().getAttribute(name);

	}

	/**
	 * Removes an object with the given name from the session.
	 * 
	 * @param name
	 *            name
	 */
	public void removeFromSession(final String name) {
		getRequest().getSession().removeAttribute(name);
	}

	/**
	 * The role of the logged in user
	 * 
	 * @param role
	 */
	public void setRole(final Role role) {
		addToSession(Constants.ROLE_NAME, role);
	}

	/**
	 * The role of the logged in user
	 * 
	 * @return
	 */
	public Role getRole() {
		return readFromSession(Constants.ROLE_NAME);
	}

	/**
	 * Set the username in session.
	 * 
	 * @param userName
	 *            userName
	 */
	public void setUser(final String userName) {
		addToSession(Constants.USER_NAME, userName);
	}

	/**
	 * Get the currently logged in user.
	 * 
	 * @return the user.
	 */
	public String getUser() {
		return readFromSession(Constants.USER_NAME);
	}

	/**
	 * The logout action.
	 */
	public void logout() {
		final HttpSession session = getRequest().getSession();
		if (session != null) {
			session.invalidate();
		}
	}
}
