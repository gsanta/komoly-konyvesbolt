package komoly.bean;

public class SearchData {

	private String title;

	private SelectData.ConcatenationOperator titleConcatenation;

	private int length = -1;

	private SelectData.RelationOperator lengthRelation;

	private SelectData.ConcatenationOperator lengthConcatenation;

	private int price = -1;

	private SelectData.RelationOperator priceRelation;

	private SelectData.ConcatenationOperator priceConcatenation;

	private int mufajId = -1;

	private SelectData.RelationOperator mufajRelation;

	private SelectData.ConcatenationOperator mufajConcatenation;

	private int publisherId = -1;

	private SelectData.RelationOperator publisherRelation;

	private SelectData.ConcatenationOperator publisherConcatenation;

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public SelectData.RelationOperator getLengthRelation() {
		return lengthRelation;
	}

	public void setLengthRelation(SelectData.RelationOperator lengthRelation) {
		this.lengthRelation = lengthRelation;
	}

	public SelectData.ConcatenationOperator getLengthConcatenation() {
		return lengthConcatenation;
	}

	public void setLengthConcatenation(
			SelectData.ConcatenationOperator lengthConcatenation) {
		this.lengthConcatenation = lengthConcatenation;
	}

	public SelectData.RelationOperator getPriceRelation() {
		return priceRelation;
	}

	public void setPriceRelation(SelectData.RelationOperator priceRelation) {
		this.priceRelation = priceRelation;
	}

	public SelectData.ConcatenationOperator getPriceConcatenation() {
		return priceConcatenation;
	}

	public void setPriceConcatenation(
			SelectData.ConcatenationOperator priceConcatenation) {
		this.priceConcatenation = priceConcatenation;
	}

	public int getMufajId() {
		return mufajId;
	}

	public void setMufajId(int mufajId) {
		this.mufajId = mufajId;
	}

	public SelectData.RelationOperator getMufajRelation() {
		return mufajRelation;
	}

	public void setMufajRelation(SelectData.RelationOperator mufajRelation) {
		this.mufajRelation = mufajRelation;
	}

	public SelectData.ConcatenationOperator getMufajConcatenation() {
		return mufajConcatenation;
	}

	public void setMufajConcatenation(
			SelectData.ConcatenationOperator mufajConcatenation) {
		this.mufajConcatenation = mufajConcatenation;
	}

	public int getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}

	public SelectData.RelationOperator getPublisherRelation() {
		return publisherRelation;
	}

	public void setPublisherRelation(
			SelectData.RelationOperator publisherRelation) {
		this.publisherRelation = publisherRelation;
	}

	public SelectData.ConcatenationOperator getPublisherConcatenation() {
		return publisherConcatenation;
	}

	public void setPublisherConcatenation(
			SelectData.ConcatenationOperator publisherConcatenation) {
		this.publisherConcatenation = publisherConcatenation;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public SelectData.ConcatenationOperator getTitleConcatenation() {
		return titleConcatenation;
	}

	public void setTitleConcatenation(
			SelectData.ConcatenationOperator titleConcatenation) {
		this.titleConcatenation = titleConcatenation;
	}
}
