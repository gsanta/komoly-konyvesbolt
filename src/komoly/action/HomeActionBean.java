package komoly.action;

import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class HomeActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/home.jsp";

	public Resolution view() {
		return new ForwardResolution(VIEW);
	}
}
