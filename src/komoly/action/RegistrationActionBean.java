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
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.EmailTypeConverter;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

import org.apache.log4j.Logger;

public class RegistrationActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/registration.jsp";

	@ValidateNestedProperties({
			@Validate(field = "email", required = true, on = "register", converter = EmailTypeConverter.class),
			@Validate(field = "name", required = true, on = "register"),
			@Validate(field = "irsz", required = true, on = "register"),
			@Validate(field = "utca", required = true, on = "register"),
			@Validate(field = "hazSzam", required = true, on = "register"),
			@Validate(field = "varos", required = true, on = "register") })
	private UserData userData;

	@Validate(field = "password", required = true, on = "register")
	private String password;

	private UserDao userDao = new UserDaoImpl();

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger
			.getLogger(RegistrationActionBean.class);

	/**
	 * Default handler. Returns the current view if no user is logged in.
	 * Otherwise forwards to the main page.
	 * 
	 * @return VIEW
	 */
	@DefaultHandler
	@DontValidate
	public Resolution view() {

		return new ForwardResolution(VIEW);
	}

	public Resolution register() {
		UserDao userDao = new UserDaoImpl();

		List<String> errors = new ArrayList<String>();

		if (userDao.register(userData, Role.LOGGED_IN_USER, errors) == false) {
			for (String e : errors) {
				getContext().getValidationErrors().addGlobalError(
						new SimpleError(e));
			}
		}

		//		userData = userDao.getUserData(userData.getId(), userData.getRole());
		//		if (userData != null) {
		//			getContext().setUser(userData);
		//		}
		//
		//		if (getContext().getUser().getRole() == Role.ADMIN) {
		//			return new ForwardResolution(VIEW_ADMIN);
		//		} else {
		//			return new ForwardResolution(VIEW_USER);
		//		}
		return new ForwardResolution(VIEW);
	}

	public UserData getUserData() {
		return userData;
	}

	public void setUserData(UserData userData) {
		this.userData = userData;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@ValidationMethod
	public void validatePassword(final ValidationErrors errors) {

		if (!userData.getPassword().equals(password)) {
			errors.add("userData.password", new SimpleError(
					"A jelszó és a jelszó újra nem egyezik!"));
		}

		if (userData.getPassword().length() < 4) {
			errors.add("userData.password", new SimpleError(
					"A jelszó hossza legalább 4 karakter legyen"));
		}
	}
}