package komoly.dao;

import java.util.List;

import komoly.bean.BookData;
import komoly.bean.SelectData;

public interface ProductDao {

	List<BookData> select(List<SelectData> selectDataList, int selectCount,
			int lastId);
}