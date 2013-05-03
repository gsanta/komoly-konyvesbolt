package komoly.bean;

import java.util.Date;

public class CommentData {

	private String comment;
	private Date date;
	private int userID;
	private int bookID;
	private int ID;
	private String userName;

	public CommentData(String comment, Date date, int userID, int bookID, int iD) {
		super();
		this.comment = comment;
		this.date = date;
		this.userID = userID;
		this.bookID = bookID;
		ID = iD;
	}

	public CommentData() {

	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
