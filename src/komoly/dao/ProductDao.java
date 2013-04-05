package komoly.dao;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SelectData;

public interface ProductDao {

	List<BookData> select(List<SelectData> selectDataList, int selectCount,
			int lastId);

	/**
	 * Get al publishers
	 * 
	 * @return
	 */
	List<PublisherData> getAllPublisher();

	List<MufajData> getAllMufaj();
}