package komoly.action;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class AdminActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/logged_in/admin_logged_in.jsp";

	private List<PublisherData> publishers;

	private List<MufajData> mufajs;

	private BookData book;

	private ProductDao productDao = new ProductDaoImpl();

	@DefaultHandler
	public Resolution view() {

		return new ForwardResolution(VIEW);
	}

	public Resolution addBook() {
		System.out.println("adddddddddddddddbbook");
		productDao.addBook(book, getContext().getRequest().getRealPath("/"));
		return new ForwardResolution(VIEW);
	}

	public BookData getBook() {
		return book;
	}

	public void setBook(BookData book) {
		this.book = book;
	}

	public List<PublisherData> getPublishers() {
		if (publishers == null) {
			publishers = productDao.getAllPublisher();
		}

		return publishers;
	}

	public void setPublishers(List<PublisherData> publishers) {
		this.publishers = publishers;
	}

	public List<MufajData> getMufajs() {
		if (mufajs == null) {
			mufajs = productDao.getAllMufaj();
		}
		return mufajs;
	}

	public void setMufajs(List<MufajData> mufajs) {
		this.mufajs = mufajs;
	}
}
