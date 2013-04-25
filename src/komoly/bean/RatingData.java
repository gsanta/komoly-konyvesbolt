package komoly.bean;

public class RatingData {

  	private int rating, ID, date, userID, bookID;		
		
		public int getRating() {
			return rating;
		}
		public void setRating(int rating) {
			this.rating = rating;
		} 
		public int getID() {
			return ID;
		}
		public void setID(int iD) {
			ID = iD;
		}
		public int getBookID() {
			return bookID;
		}
		public void setBookID(int bookID) {
			this.bookID = bookID;
		}
	
		public int getDate() {
			return date;
		}
		public void setDate(int date) {
			this.date = date;
		}
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
}
