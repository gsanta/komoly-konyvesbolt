package komoly.action;

import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

import org.apache.log4j.Logger;

/**
 * A very simple calculator action.
 * 
 * 
 */
public class TestActionBean extends BaseActionBean implements ActionBean {
	private double numberOne;
	private double numberTwo;
	private double result;

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/test.jsp";

	/**
	 * LOGGER.
	 */
	private final Logger logger = Logger.getLogger(TestActionBean.class);

	public double getNumberOne() {
		return numberOne;
	}

	public void setNumberOne(double numberOne) {
		this.numberOne = numberOne;
	}

	public double getNumberTwo() {
		return numberTwo;
	}

	public void setNumberTwo(double numberTwo) {
		this.numberTwo = numberTwo;
	}

	public double getResult() {
		return result;
	}

	public void setResult(double result) {
		this.result = result;
	}

	@DefaultHandler
	public Resolution addition() {
		logger.info("log4j is mukodik");
		result = getNumberOne() + getNumberTwo();
		return new ForwardResolution(VIEW);
	}
}