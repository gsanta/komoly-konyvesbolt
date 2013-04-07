package komoly.action;

import java.util.List;

import komoly.bean.BasketData;
import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class BasketActionBean extends BaseActionBean {
	private static final String BASKET = "/WEB-INF/web/logged_in/basket_logged_in.jsp";

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/books.jsp";

	private int deleteItemId;

	@DefaultHandler
	public Resolution show() {
		if (getContext().getUser() != null) {
			return new ForwardResolution(BASKET);
		}

		return new ForwardResolution(VIEW);
	}

	public Resolution deleteItem() {

		getContext().deleteFromBasket(deleteItemId);

		return show();
	}

	public Resolution deleteAll() {

		getContext().clearBasket();

		return show();
	}

	public List<BasketData> getBasketList() {
		return getContext().getBasket();
	}

	public int getDeleteItemId() {
		return deleteItemId;
	}

	public void setDeleteItemId(int deleteItemId) {
		this.deleteItemId = deleteItemId;
	}
}
