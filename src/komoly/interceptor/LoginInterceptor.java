package komoly.interceptor;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import komoly.action.LoginActionBean;
import komoly.common.BaseActionBean;
import komoly.common.BaseActionBeanContext;
import komoly.utils.Constants;
import komoly.utils.Role;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.controller.ExecutionContext;
import net.sourceforge.stripes.controller.Interceptor;
import net.sourceforge.stripes.controller.Intercepts;
import net.sourceforge.stripes.controller.LifecycleStage;

@Intercepts(LifecycleStage.HandlerResolution)
public class LoginInterceptor implements Interceptor {

	/**
	 * Action class to redirect.
	 */
	private static final Class<LoginActionBean> REDIRECT_ACTION_CLASS = LoginActionBean.class;

	/**
	 * Actions that are allowed to visit without logging in
	 */
	private static Set<Class<? extends BaseActionBean>> ALLOWED_ACTION_CLASSES;
	private static Map<Role, Set<Class<? extends BaseActionBean>>> ALLOWED_ACTION_CLASSES_MAP;

	static {
		ALLOWED_ACTION_CLASSES = new HashSet<Class<? extends BaseActionBean>>();

		ALLOWED_ACTION_CLASSES_MAP = new HashMap<Role, Set<Class<? extends BaseActionBean>>>();

		/**
		 * logged in user
		 */
		ALLOWED_ACTION_CLASSES_MAP.put(Role.LOGGED_IN_USER,
				new HashSet<Class<? extends BaseActionBean>>());

		ALLOWED_ACTION_CLASSES_MAP.get(Role.LOGGED_IN_USER).add(
				LoginActionBean.class);

		/**
		 * Admins
		 */
		ALLOWED_ACTION_CLASSES_MAP.put(Role.ADMIN,
				new HashSet<Class<? extends BaseActionBean>>());

		ALLOWED_ACTION_CLASSES_MAP.get(Role.ADMIN).add(LoginActionBean.class);

		/**
		 * Visitor
		 */
		ALLOWED_ACTION_CLASSES_MAP.put(Role.VISITOR,
				new HashSet<Class<? extends BaseActionBean>>());

		ALLOWED_ACTION_CLASSES_MAP.get(Role.VISITOR).add(LoginActionBean.class);
	}

	/**
	 * Intercepts execution and checks that the user has appropriate
	 * permissions.
	 */
	public Resolution intercept(ExecutionContext execContext) throws Exception {
		Resolution resolution = execContext.proceed();

		final BaseActionBeanContext ctx = (BaseActionBeanContext) execContext
				.getActionBeanContext();

		if (ctx.getUser() == null
				&& !ALLOWED_ACTION_CLASSES_MAP.get(Role.VISITOR).contains(
						execContext.getActionBean().getClass())) {
			ctx.addToSession(Constants.INTERCEPTED_ACTION_BEAN, execContext
					.getActionBean().getClass());
			return new RedirectResolution(LoginActionBean.class);
		}
		//		else if (ctx.getRole() != null
		//				&& !ALLOWED_ACTION_CLASSES_MAP.get(ctx.getRole()).contains(
		//						execContext.getActionBean().getClass())) {
		//			return new RedirectResolution(LoginActionBean.class);
		//		} 
		else {
			return resolution;
		}
	}
}