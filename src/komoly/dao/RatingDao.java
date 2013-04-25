package komoly.dao;

import komoly.bean.RatingData;

import java.util.*;

public interface RatingDao {
  
		public List<RatingData> read();
		public List<RatingData> getRatingData();
		public RatingData read(Integer id);
		public List<RatingData> save(RatingData ratings);

}
