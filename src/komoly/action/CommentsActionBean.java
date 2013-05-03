package komoly.action;

import java.util.List;

import komoly.bean.CommentData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;

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

	private int bookId;

	private CommentData actComment = new CommentData();

	@DefaultHandler
	public Resolution list() {
		System.out.println("bookId2: " + bookId);
		comments = productDao.getCommmentListByBookId(bookId);

		actComment.setBookID(bookId);

		if (getContext().getUser() != null) {
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
}
