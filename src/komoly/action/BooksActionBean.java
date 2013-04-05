package komoly.action;

import java.util.ArrayList;
import java.util.List;

import komoly.bean.BookData;
import komoly.bean.SelectData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

import org.apache.log4j.Logger;

public class BooksActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/books.jsp";

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(BooksActionBean.class);

	private List<BookData> books;

	/**
	 * Main View
	 * 
	 * @return
	 */
	public Resolution view() {
		ProductDao productDao = new ProductDaoImpl();

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		selectDataList.add(new SelectData(SelectData.RelationOperator.EQUAL,
				SelectData.ConcatenationOperator.AND,
				SelectData.Column.ISEBOOK, "0"));

		selectDataList.add(new SelectData(
				SelectData.RelationOperator.GREATER_THAN,
				SelectData.ConcatenationOperator.OR, SelectData.Column.PRICE,
				"100"));

		selectDataList.add(new SelectData(
				SelectData.RelationOperator.GREATER_THAN,
				SelectData.ConcatenationOperator.OR,
				SelectData.Column.OLDALSZAM, "600"));

		books = productDao.select(selectDataList, 0, 0);

		LOGGER.info(books);

		return new ForwardResolution(VIEW);
	}

	public List<BookData> getBooks() {
		return books;
	}

	public void setBooks(List<BookData> books) {
		this.books = books;
	}
}
