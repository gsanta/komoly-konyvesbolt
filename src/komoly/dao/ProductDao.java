package komoly.dao;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.CommentData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SelectData;
import komoly.utils.Direction;

public interface ProductDao {

	List<BookData> select(List<SelectData> selectDataList, int selectCount,
			int lastId, Direction direction, int userId);

	/**
	 * Get al publishers
	 * 
	 * @return
	 */
	List<PublisherData> getAllPublisher();

	List<MufajData> getAllMufaj();

	void addBook(BookData bookData, String basePath);

	void addPDFBook(BookData bookData, String basePath);

	boolean hasPrevData(int bookId, List<SelectData> selectDataList);

	boolean hasNextData(int bookId, List<SelectData> selectDataList);

	List<CommentData> getCommmentListByBookId(int bookId);

	void addComment(CommentData commentData);

	void rate(int bookId, int userId, int rate);
}