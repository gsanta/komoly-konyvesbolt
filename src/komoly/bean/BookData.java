package komoly.bean;

import net.sourceforge.stripes.action.FileBean;

public class BookData {

	private int id;

	private String title;

	private int price;

	private int pageNum;

	private boolean ebook;

	private String kotes;

	private String meret;

	private String mufaj;

	private int mufajId;

	private String kiado;

	private int kiadoId;

	private FileBean image;

	private FileBean pdf;

	private String fileName = "placeholder.jpg";

	private int count;

	private int boltId;

	private boolean ratedByUser;

	private int rating;

	private int ratingCount;

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isEbook() {
		return ebook;
	}

	public void setEbook(boolean ebook) {
		this.ebook = ebook;
	}

	public String getKotes() {
		return kotes;
	}

	public void setKotes(String kotes) {
		this.kotes = kotes;
	}

	public String getMeret() {
		return meret;
	}

	public void setMeret(String meret) {
		this.meret = meret;
	}

	public String getMufaj() {
		return mufaj;
	}

	public void setMufaj(String mufaj) {
		this.mufaj = mufaj;
	}

	public String getKiado() {
		return kiado;
	}

	public void setKiado(String kiado) {
		this.kiado = kiado;
	}

	public int getMufajId() {
		return mufajId;
	}

	public void setMufajId(int mufajId) {
		this.mufajId = mufajId;
	}

	public int getKiadoId() {
		return kiadoId;
	}

	public void setKiadoId(int kiadoId) {
		this.kiadoId = kiadoId;
	}

	public FileBean getImage() {
		return image;
	}

	public void setImage(FileBean image) {
		this.image = image;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public FileBean getPdf() {
		return pdf;
	}

	public void setPdf(FileBean pdf) {
		this.pdf = pdf;
	}

	public boolean isRatedByUser() {
		return ratedByUser;
	}

	public void setRatedByUser(boolean ratedByUser) {
		this.ratedByUser = ratedByUser;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}

	public int getBoltId() {
		return boltId;
	}

	public void setBoltId(int boltId) {
		this.boltId = boltId;
	}

	@Override
	public String toString() {
		return "BookData [id=" + id + ", title=" + title + ", price=" + price
				+ ", pageNum=" + pageNum + ", ebook=" + ebook + "]";
	}
}
