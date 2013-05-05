package komoly.action;

import java.util.ArrayList;
import java.util.List;

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
import net.sourceforge.stripes.validation.EmailTypeConverter;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;

public class UserDataActionBean extends BaseActionBean {

	private static final String VIEW_USER = "/WEB-INF/web/logged_in/user_data_logged_in.jsp";

	private static final String VIEW_ADMIN = "/WEB-INF/web/adminData.jsp";

	@ValidateNestedProperties({
			@Validate(field = "email", required = true, on = { "change",
					"changeAdmin" }, converter = EmailTypeConverter.class),
			@Validate(field = "name", required = true, on = { "change",
					"changeAdmin" }),
			@Validate(field = "irsz", required = true, on = "change"),
			@Validate(field = "utca", required = true, on = "change"),
			@Validate(field = "hazSzam", required = true, on = "change"),
			@Validate(field = "varos", required = true, on = "change") })
	private UserData userData;

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

		System.out.println("nééééév: " + userData.getUtca());
		userData.setId(getContext().getUser().getId());

		List<String> errors = new ArrayList<String>();

		if (userDao.changeUserData(userData, getContext().getUser().getRole(),
				errors) == false) {
			for (String e : errors) {
				getContext().getValidationErrors().addGlobalError(
						new SimpleError(e));
			}
		}

		userData = userDao.getUserData(userData.getId(), userData.getRole());
		if (userData != null) {
			getContext().setUser(userData);
		}

		if (getContext().getUser().getRole() == Role.ADMIN) {
			return new RedirectResolution(getClass());
		} else {
			return new RedirectResolution(getClass());
		}
	}

	public Resolution changeAdmin() {

		UserDao userDao = new UserDaoImpl();

		userData.setId(getContext().getUser().getId());

		List<String> errors = new ArrayList<String>();

		System.out.println("changeAdmin-ban vagyok " + userData.getId());

		if (userDao.changeUserData(userData, Role.ADMIN, errors) == false) {
			for (String e : errors) {
				getContext().getValidationErrors().addGlobalError(
						new SimpleError(e));
			}
		}

		userData = userDao.getUserData(userData.getId(), userData.getRole());
		if (userData != null) {
			getContext().setUser(userData);
		}

		if (getContext().getUser().getRole() == Role.ADMIN) {
			return new RedirectResolution(getClass());
		} else {
			return new RedirectResolution(getClass());
		}
	}

	public UserData getUserData() {
		if (userData == null) {
			userData = getContext().getUser();
		}

		return userData;
	}

	public void setUserData(UserData userData) {
		this.userData = userData;
	}
}
