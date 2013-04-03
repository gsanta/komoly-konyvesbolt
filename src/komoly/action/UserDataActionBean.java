package komoly.action;

import komoly.bean.UserData;
import komoly.common.BaseActionBean;
import komoly.dao.UserDao;
import komoly.dao.impl.UserDaoImpl;
import komoly.utils.Role;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class UserDataActionBean extends BaseActionBean {

	private static final String VIEW_USER = "/WEB-INF/web/userData.jsp";

	private static final String VIEW_ADMIN = "/WEB-INF/web/adminData.jsp";

	private UserData userData = new UserData();

	@DefaultHandler
	@DontValidate
	public Resolution view() {

		if (getContext().getUser().getRole() == Role.ADMIN) {
			return new ForwardResolution(VIEW_ADMIN);
		} else {
			return new ForwardResolution(VIEW_USER);
		}
	}

	public Resolution change() {

		UserDao userDao = new UserDaoImpl();

		System.out.println(userData.getName());
		userData.setId(getContext().getUser().getId());
		userDao.changeUserData(userData, getContext().getUser().getRole());

		userData = userDao.getUserData(userData.getId(), userData.getRole());
		if (userData != null) {
			getContext().setUser(userData);
		}

		if (getContext().getUser().getRole() == Role.ADMIN) {
			return new ForwardResolution(VIEW_ADMIN);
		} else {
			return new ForwardResolution(VIEW_USER);
		}
	}

	public UserData getUserData() {
		return getContext().getUser();
	}

	public void setUserData(UserData userData) {
		this.userData = userData;
	}
}
