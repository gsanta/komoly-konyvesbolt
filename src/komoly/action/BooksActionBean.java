package komoly.action;

import java.util.ArrayList;
import java.util.List;

import komoly.bean.BasketData;
import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SearchData;
import komoly.bean.SelectData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

import org.apache.log4j.Logger;

public class BooksActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/books.jsp";

	/**
	 * Logged in Main View
	 */
	private static final String VIEW_LOGGED_IN = "/WEB-INF/web/logged_in/books_logged_in.jsp";

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(BooksActionBean.class);

	private List<BookData> books;

	private List<PublisherData> publishers;

	private List<MufajData> mufajs;

	private SearchData searchData = new SearchData();

	private BasketData basketData = new BasketData();

	private ProductDao productDao = new ProductDaoImpl();

	private SelectData.RelationOperator dummyEquals = SelectData.RelationOperator.EQUALS;

	/**
	 * Main View
	 * 
	 * @return
	 */
	@DefaultHandler
	public Resolution view() {

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		selectDataList.add(new SelectData(SelectData.RelationOperator.EQUALS,
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

		/**
		 * logged in
		 */
		if (getContext().getUser() != null) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		}

		return new ForwardResolution(VIEW);
	}

	public Resolution search() {

		LOGGER.info("title: " + searchData.getTitle());

		LOGGER.info(searchData.getPublisherId() + "  "
				+ searchData.getPriceConcatenation() + "  "
				+ searchData.getMufajId() + "   "
				+ searchData.getMufajConcatenation() + "   "
				+ searchData.getLength() + "  "
				+ searchData.getLengthRelation() + "   "
				+ searchData.getPrice() + "   " + searchData.getPriceRelation());

		//		LOGGER.info(length + "  " + price);

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		if (searchData.getTitle() != null) {
			selectDataList.add(new SelectData(SelectData.RelationOperator.LIKE,
					searchData.getTitleConcatenation(), SelectData.Column.CIM,
					searchData.getTitle()));
		}

		if (searchData.getMufajId() != -1) {
			selectDataList.add(new SelectData(
					SelectData.RelationOperator.EQUALS, searchData
							.getMufajConcatenation(),
					SelectData.Column.MUFAJ_ID, String.valueOf(searchData
							.getMufajId())));
		}

		if (searchData.getPublisherId() != -1) {
			selectDataList.add(new SelectData(
					SelectData.RelationOperator.EQUALS, searchData
							.getPublisherConcatenation(),
					SelectData.Column.KIADO_ID, String.valueOf(searchData
							.getPublisherId())));
		}

		if (searchData.getLength() != -1) {
			selectDataList.add(new SelectData(searchData.getLengthRelation(),
					searchData.getLengthConcatenation(),
					SelectData.Column.OLDALSZAM, String.valueOf(searchData
							.getLength())));
		}

		if (searchData.getPrice() != -1) {
			selectDataList.add(new SelectData(searchData.getPriceRelation(),
					searchData.getPriceConcatenation(),
					SelectData.Column.PRICE, String.valueOf(searchData
							.getPrice())));
		}

		books = productDao.select(selectDataList, 0, 0);

		LOGGER.info(books);

		/**
		 * logged in
		 */
		if (getContext().getUser() != null) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		}

		return new ForwardResolution(VIEW);
	}

	public Resolution toBasket() {

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		selectDataList.add(new SelectData(SelectData.RelationOperator.EQUALS,
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

		getContext().addToBasket(basketData);

		LOGGER.info("basket info: " + basketData.getId() + "  "
				+ basketData.getTitle() + "  " + basketData.getCount());
		/**
		 * logged in
		 */
		if (getContext().getUser() != null) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		}

		return new ForwardResolution(VIEW);
	}

	public List<BookData> getBooks() {
		return books;
	}

	public void setBooks(List<BookData> books) {
		this.books = books;
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

	public SearchData getSearchData() {
		return searchData;
	}

	public void setSearchData(SearchData searchData) {
		this.searchData = searchData;
	}

	public BasketData getBasketData() {
		return basketData;
	}

	public void setBasketData(BasketData basketData) {
		this.basketData = basketData;
	}

	public SelectData.RelationOperator getDummyEquals() {
		return dummyEquals;
	}

	public void setDummyEquals(SelectData.RelationOperator dummyEquals) {
		this.dummyEquals = dummyEquals;
	}
}
