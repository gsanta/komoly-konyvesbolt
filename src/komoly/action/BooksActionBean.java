package komoly.action;

import java.util.ArrayList;
import java.util.List;

import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SearchData;
import komoly.bean.SelectData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import komoly.utils.Constants;
import komoly.utils.Direction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;

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

	@ValidateNestedProperties({
			@Validate(field = "price", minvalue = 1, on = "search"),
			@Validate(field = "length", minvalue = 1, on = "search") })
	private SearchData searchData = new SearchData();

	private BookData basketData = new BookData();

	private ProductDao productDao = new ProductDaoImpl();

	private String bookPath = null;

	private boolean prevData;

	private boolean nextData;

	private int pagerId;

	private Direction direction;

	private boolean[] test = { true };

	private SelectData.RelationOperator dummyEquals = SelectData.RelationOperator.EQUALS;

	/**
	 * Main View
	 * 
	 * @return
	 */
	@DefaultHandler
	@DontValidate
	public Resolution view() {

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		//		selectDataList.add(new SelectData(SelectData.RelationOperator.EQUALS,
		//				SelectData.ConcatenationOperator.AND,
		//				SelectData.Column.ISEBOOK, "0"));
		//
		//		selectDataList.add(new SelectData(
		//				SelectData.RelationOperator.GREATER_THAN,
		//				SelectData.ConcatenationOperator.OR, SelectData.Column.PRICE,
		//				"100"));
		//
		//		selectDataList.add(new SelectData(
		//				SelectData.RelationOperator.GREATER_THAN,
		//				SelectData.ConcatenationOperator.OR,
		//				SelectData.Column.OLDALSZAM, "600"));

		books = productDao.select(selectDataList, Constants.SELECT_COUNT, 0,
				Direction.RIGHT);

		if (books.size() >= 1) {
			prevData = productDao.hasPrevData(books.get(0).getId(),
					selectDataList);
		}

		if (books.size() >= 1) {

			nextData = productDao.hasNextData(books.get(books.size() - 1)
					.getId(), selectDataList);
		}

		LOGGER.info(books);

		getContext().removeFromSession(Constants.SEARCH_DATA);

		/**
		 * logged in
		 */
		if (getContext().getUser() != null) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		}

		return new ForwardResolution(VIEW);
	}

	@DontValidate
	public Resolution changePage() {
		List<SelectData> selectDataList = new ArrayList<SelectData>();

		if (getContext().readFromSession(Constants.SEARCH_DATA) != null) {
			SearchData searchData = (SearchData) getContext().readFromSession(
					Constants.SEARCH_DATA);
			selectDataList = makeSelectDataListFromSearchData(searchData);
		}

		books = productDao.select(selectDataList, Constants.SELECT_COUNT,
				pagerId, direction);

		if (books.size() >= 1) {
			prevData = productDao.hasPrevData(books.get(0).getId(),
					selectDataList);
		}

		if (books.size() >= 1) {

			nextData = productDao.hasNextData(books.get(books.size() - 1)
					.getId(), selectDataList);
		}

		/**
		 * logged in
		 */
		if (getContext().getUser() != null) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		}

		return new ForwardResolution(VIEW);
	}

	public Resolution search() {

		System.out.println("searchenabled: " + searchData.getSearchEnabled());

		LOGGER.info("title: " + searchData.getTitle());

		LOGGER.info(searchData.getPublisherId() + "  "
				+ searchData.getPriceConcatenation() + "  "
				+ searchData.getMufajId() + "   "
				+ searchData.getMufajConcatenation() + "   "
				+ searchData.getLength() + "  "
				+ searchData.getLengthRelation() + "   "
				+ searchData.getPrice() + "   " + searchData.getPriceRelation());

		//		LOGGER.info(length + "  " + price);

		System.out.println("isTitleSearch: " + searchData.isTitleSearch());
		List<SelectData> selectDataList = makeSelectDataListFromSearchData(searchData);

		books = productDao.select(selectDataList, Constants.SELECT_COUNT, 0,
				Direction.RIGHT);

		if (books.size() >= 1) {
			prevData = productDao.hasPrevData(books.get(0).getId(),
					selectDataList);
		}

		if (books.size() >= 1) {

			nextData = productDao.hasNextData(books.get(books.size() - 1)
					.getId(), selectDataList);
		}

		getContext().addToSession(Constants.SEARCH_DATA, searchData);

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

		if (getContext().readFromSession(Constants.SEARCH_DATA) != null) {
			SearchData searchData = (SearchData) getContext().readFromSession(
					Constants.SEARCH_DATA);
			selectDataList = makeSelectDataListFromSearchData(searchData);
		}

		books = productDao.select(selectDataList, Constants.SELECT_COUNT,
				pagerId, Direction.RIGHT);

		if (books.size() >= 1) {
			prevData = productDao.hasPrevData(books.get(0).getId(),
					selectDataList);
		}

		if (books.size() >= 1) {

			nextData = productDao.hasNextData(books.get(books.size() - 1)
					.getId(), selectDataList);
		}

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
		if (getContext().readFromSession(Constants.SEARCH_DATA) != null) {
			searchData = (SearchData) getContext().readFromSession(
					Constants.SEARCH_DATA);
		}
		return searchData;
	}

	public void setSearchData(SearchData searchData) {
		this.searchData = searchData;
	}

	public BookData getBasketData() {
		return basketData;
	}

	public void setBasketData(BookData basketData) {
		this.basketData = basketData;
	}

	public String getBookPath() {
		return getContext().getRequest().getRealPath("/") + "book_pics";
	}

	public void setBookPath(String bookPath) {
		this.bookPath = bookPath;
	}

	public boolean isPrevData() {
		return prevData;
	}

	public void setPrevData(boolean prevData) {
		this.prevData = prevData;
	}

	public boolean isNextData() {
		return nextData;
	}

	public void setNextData(boolean nextData) {
		this.nextData = nextData;
	}

	public int getPagerId() {
		return pagerId;
	}

	public void setPagerId(int pagerId) {
		this.pagerId = pagerId;
	}

	public Direction getDirection() {
		return direction;
	}

	public void setDirection(Direction direction) {
		this.direction = direction;
	}

	public boolean[] getTest() {
		return test;
	}

	public void setTest(boolean[] test) {
		this.test = test;
	}

	private List<SelectData> makeSelectDataListFromSearchData(
			SearchData searchData) {

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		if (searchData.isTitleSearch()) {
			//		if (searchData.getTitle() != null) {
			selectDataList.add(new SelectData(SelectData.RelationOperator.LIKE,
					searchData.getTitleConcatenation(), SelectData.Column.CIM,
					searchData.getTitle()));
		}

		if (searchData.isMufajSearch()) {
			//if (searchData.getMufajId() != -1) {
			selectDataList.add(new SelectData(
					SelectData.RelationOperator.EQUALS, searchData
							.getMufajConcatenation(),
					SelectData.Column.MUFAJ_ID, String.valueOf(searchData
							.getMufajId())));
		}

		if (searchData.isPublisherSearch()) {
			//if (searchData.getPublisherId() != -1) {
			selectDataList.add(new SelectData(
					SelectData.RelationOperator.EQUALS, searchData
							.getPublisherConcatenation(),
					SelectData.Column.KIADO_ID, String.valueOf(searchData
							.getPublisherId())));
		}

		if (searchData.isLengthSearch()) {
			//if (searchData.getLength() != -1) {
			selectDataList.add(new SelectData(searchData.getLengthRelation(),
					searchData.getLengthConcatenation(),
					SelectData.Column.OLDALSZAM, String.valueOf(searchData
							.getLength())));
		}

		if (searchData.isPriceSearch()) {
			selectDataList.add(new SelectData(searchData.getPriceRelation(),
					searchData.getPriceConcatenation(),
					SelectData.Column.PRICE, String.valueOf(searchData
							.getPrice())));
		}

		return selectDataList;
	}
}
