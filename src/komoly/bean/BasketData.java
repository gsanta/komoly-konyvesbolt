package komoly.bean;

public class BasketData {

	private int id;

	private String title;

	private int count = 1;

	private int boltId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBoltId() {
		return boltId;
	}

	public void setBoltId(int boltId) {
		this.boltId = boltId;
	}

}
