package komoly.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import komoly.bean.BasketData;
import komoly.bean.UserData;
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
	public void setUser(final UserData user) {
		addToSession(Constants.USER_NAME, user);
	}

	/**
	 * Get the currently logged in user.
	 * 
	 * @return the user.
	 */
	public UserData getUser() {
		return (UserData) readFromSession(Constants.USER_NAME);
	}

	@SuppressWarnings("unchecked")
	public void addToBasket(BasketData bd) {
		List<BasketData> basketDataList = null;
		if (readFromSession(Constants.BASKET_LIST) != null) {
			basketDataList = (List<BasketData>) readFromSession(Constants.BASKET_LIST);
		} else {
			basketDataList = new ArrayList<BasketData>();
		}

		boolean newItem = true;

		for (BasketData data : basketDataList) {
			if (data.getId() == bd.getId()) {
				newItem = false;

				data.setCount(data.getCount() + bd.getCount());
			}
		}

		if (newItem) {
			basketDataList.add(bd);
		}

		addToSession(Constants.BASKET_LIST, basketDataList);
	}

	public List<BasketData> getBasket() {
		if (readFromSession(Constants.BASKET_LIST) != null) {
			return (List<BasketData>) readFromSession(Constants.BASKET_LIST);
		} else {
			return new ArrayList<BasketData>();
		}
	}

	public void clearBasket() {
		removeFromSession(Constants.BASKET_LIST);
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
