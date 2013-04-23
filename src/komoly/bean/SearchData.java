package komoly.bean;

import java.util.ArrayList;
import java.util.List;

public class SearchData {

	private List<String> searchEnabled = new ArrayList<String>();

	private String title;

	private boolean titleSearch;

	private SelectData.ConcatenationOperator titleConcatenation;

	private boolean titleDisabled;

	private int length = 0;

	private boolean lengthSearch;

	private SelectData.RelationOperator lengthRelation = SelectData.RelationOperator.EQUALS;

	private SelectData.ConcatenationOperator lengthConcatenation;

	private int price = 0;

	private boolean priceSearch;

	private SelectData.RelationOperator priceRelation = SelectData.RelationOperator.EQUALS;

	private SelectData.ConcatenationOperator priceConcatenation;

	private int mufajId = -1;

	private boolean mufajSearch;

	private SelectData.RelationOperator mufajRelation;

	private SelectData.ConcatenationOperator mufajConcatenation;

	private int publisherId = -1;

	private boolean publisherSearch;

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

	public boolean isTitleSearch() {
		return titleSearch;
	}

	public void setTitleSearch(boolean titleSearch) {
		this.titleSearch = titleSearch;
	}

	public boolean isLengthSearch() {
		return lengthSearch;
	}

	public void setLengthSearch(boolean lengthSearch) {
		this.lengthSearch = lengthSearch;
	}

	public boolean isPriceSearch() {
		return priceSearch;
	}

	public void setPriceSearch(boolean priceSearch) {
		this.priceSearch = priceSearch;
	}

	public boolean isMufajSearch() {
		return mufajSearch;
	}

	public void setMufajSearch(boolean mufajSearch) {
		this.mufajSearch = mufajSearch;
	}

	public boolean isPublisherSearch() {
		return publisherSearch;
	}

	public void setPublisherSearch(boolean publisherSearch) {
		this.publisherSearch = publisherSearch;
	}

	public boolean isMufajDisabled() {
		if (mufajId > 0) {
			return false;
		}
		return true;
	}

	public boolean isPublisherDisabled() {
		if (publisherId > 0) {
			return false;
		}
		return true;
	}

	public boolean isPriceDisabled() {
		if (price > 0) {
			return false;
		}
		return true;
	}

	public boolean isLengthDisabled() {
		if (length > 0) {
			return false;
		}
		return true;
	}

	public boolean isTitleDisabled() {
		if (title == null || title.equals("")) {
			return true;
		}
		return false;
	}

	public List<String> getSearchEnabled() {
		searchEnabled.add("price");
		return searchEnabled;
	}

	public void setSearchEnabled(List<String> searchEnabled) {
		this.searchEnabled = searchEnabled;
	}
}
