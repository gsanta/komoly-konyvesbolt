package komoly.action;

import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class RatingsActionBean extends BaseActionBean {

	static final String RATINGS = "/WEB-INF/web/ratings.jsp";
	static final String FORM = "/WEB-INF/web/ratingform.jsp";

	private int rate;

	private int bookId;

	@DefaultHandler
	public Resolution rate() {
		if (getContext().getUser() != null) {
			return new ForwardResolution(FORM);
		} else
			return new ForwardResolution(RATINGS);
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
}
