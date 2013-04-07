package komoly.utils;

import net.sourceforge.stripes.exception.StripesJspException;
import net.sourceforge.stripes.tag.DefaultPopulationStrategy;
import net.sourceforge.stripes.tag.InputTagSupport;

public class MyPopulationStrategy extends DefaultPopulationStrategy {
	/**
	 * Strategy to look at the ActionBean first, then the request, then the
	 * page.
	 */
	public Object getValue(InputTagSupport tag) throws StripesJspException {
		Object value = getValueFromTag(tag);

		if (value == null)
			value = getValueFromActionBean(tag);
		if (value == null)
			value = getValuesFromRequest(tag);

		return value;
	}
}