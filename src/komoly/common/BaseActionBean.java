package komoly.common;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;

public abstract class BaseActionBean implements ActionBean {
	private BaseActionBeanContext actionBeanContext;

	public BaseActionBean() {
		//		String homeDir = getContext().getServletContext().getRealPath("/");
		//		File propertiesFile = new File(homeDir,
		//				"WEB-INF/classes/log4j.properties");
		//		PropertyConfigurator.configure(propertiesFile.toString());
	}

	@Override
	public BaseActionBeanContext getContext() {
		return actionBeanContext;
	}

	@Override
	public void setContext(ActionBeanContext actionBeanContext) {
		this.actionBeanContext = (BaseActionBeanContext) actionBeanContext;
	}
}
