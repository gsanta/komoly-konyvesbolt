package komoly.action;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.CommentData;
import komoly.bean.ShopAndBookData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import komoly.utils.Role;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

public class CommentsActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/comments.jsp";

	/**
	 * Logged in Main View
	 */
	private static final String VIEW_LOGGED_IN = "/WEB-INF/web/logged_in/comments_logged_in.jsp";

	private ProductDao productDao = new ProductDaoImpl();

	private BookData basketData = new BookData();

	private int bookId;

	private int index;

	private BookData book;

	private CommentData actComment = new CommentData();

	private List<ShopAndBookData> shopList;

	@DefaultHandler
	public Resolution list() {
		System.out.println("bookId2: " + bookId);
		comments = productDao.getCommmentListByBookId(bookId);

		actComment.setBookID(bookId);

		book = productDao.getBookById(bookId);

		System.out.println("title: " + book.getTitle());
		System.out.println("basketTitle: " + basketData.getTitle());
		System.out.println("pricce: " + book.getPrice());

		shopList = productDao.getShopListById(bookId);

		if (getContext().getUser() != null
				&& getContext().getUser().getRole() == Role.LOGGED_IN_USER) {
			return new ForwardResolution(VIEW_LOGGED_IN);
		} else
			return new ForwardResolution(VIEW);
	}

	public Resolution addComment() {

		if (getContext().getUser() != null) {
			actComment.setUserID(getContext().getUser().getId());
			productDao.addComment(actComment);
			System.out.println("addComment");
			return new RedirectResolution("/Comments.action?list=&bookId="
					+ actComment.getBookID());
		} else
			return new RedirectResolution("/Comments.action?list=&bookId="
					+ actComment.getBookID());
	}

	public Resolution toBasket() {
		book.setBoltId(index);
		getContext().addToBasket(book);

		System.out.println("indexx: " + index);

		if (getContext().getUser() != null
				&& getContext().getUser().getRole() == Role.LOGGED_IN_USER) {
			return new RedirectResolution("/Comments.action?list=&bookId="
					+ book.getId());
		} else
			return new RedirectResolution("/Comments.action?list=&bookId="
					+ book.getId());
	}

	/*
	 * public Resolution save(){
	 * 
	 * CommentData comment = getCommentData(); getCommentDao().save(comment);
	 * 
	 * return new RedirectResolution(CommentsActionBean.class);
	 * 
	 * }
	 */

	private List<CommentData> comments;
	private int deleteitem;

	public int getDeleteitem() {
		return deleteitem;
	}

	public void setDeleteitem(int deleteitem) {
		this.deleteitem = deleteitem;
	}

	public List<CommentData> getComments() {
		return comments;
	}

	public void setComments(List<CommentData> comments) {
		this.comments = comments;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public CommentData getActComment() {
		return actComment;
	}

	public void setActComment(CommentData actComment) {
		this.actComment = actComment;
	}

	public BookData getBook() {
		return book;
	}

	public void setBook(BookData book) {
		this.book = book;
	}

	public List<ShopAndBookData> getShopList() {
		return shopList;
	}

	public void setShopList(List<ShopAndBookData> shopList) {
		this.shopList = shopList;
	}

	public BookData getBasketData() {
		return basketData;
	}

	public void setBasketData(BookData basketData) {
		this.basketData = basketData;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	@ValidationMethod(on = "toBasket")
	public void validateBookCount(final ValidationErrors errors) {
		System.out.println("baskatdate: " + book.getId() + " bolt " + index);

		bookId = book.getId();

		ShopAndBookData data = productDao.getShopById(book.getId(), index);

		if (book.getCount() > data.getCount()) {
			errors.addGlobalError(new SimpleError(
					"Nincs ennyi könyv a boltban!"));
		}
	}
}
