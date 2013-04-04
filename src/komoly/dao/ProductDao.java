package komoly.dao;

import java.util.List;

import komoly.bean.SelectData;

public interface ProductDao {

	void select(List<SelectData> selectDataList, int selectCount, int lastId);
}