package komoly.action;

import java.util.List;

import komoly.bean.CommentData;
import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class CommentsActionBean extends BaseActionBean {

	static final String COMMENTS = "/WEB-INF/web/comments.jsp";
	static final String FORM = "/WEB-INF/web/form.jsp";

	public Resolution list() {
		return new ForwardResolution(COMMENTS);
	}

	@DefaultHandler
	public Resolution form() {
		if (getContext().getUser() != null) {
			return new ForwardResolution(FORM);
		} else
			return new ForwardResolution(COMMENTS);
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

	public Resolution deleteComment() {

		getContext().deleteComm(deleteitem);

		return list();
	}

	public List<CommentData> getComments() {
		return comments;
	}

	public void setComments(List<CommentData> comments) {
		this.comments = comments;
	}
}
