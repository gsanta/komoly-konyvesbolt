package komoly.action;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;

public class OwnBookUploadActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/logged_in/own_book_upload_logged_in.jsp";

	private List<MufajData> mufajs;

	@ValidateNestedProperties({
			@Validate(field = "title", required = true, on = "upload"),
			@Validate(field = "pageNum", required = true, minvalue = 1, on = "upload"),
			@Validate(field = "price", required = true, minvalue = 0, on = "upload"),
			@Validate(field = "pdf", required = true, on = "upload") })
	private BookData book;

	private ProductDao productDao = new ProductDaoImpl();

	/**
	 * Main View
	 * 
	 * @return
	 */
	@DefaultHandler
	@DontValidate
	public Resolution view() {
		return new ForwardResolution(VIEW);
	}

	public Resolution upload() {
		productDao.addPDFBook(book, getContext().getRequest().getRealPath("/"));
		return new ForwardResolution(VIEW);
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

	public BookData getBook() {
		return book;
	}

	public void setBook(BookData book) {
		this.book = book;
	}
}
