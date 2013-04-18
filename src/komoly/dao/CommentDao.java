package komoly.dao;

import komoly.bean.CommentData;

import java.util.*;

public interface CommentDao {
  
		public List<CommentData> read();
		public List<CommentData> getCommentData();
		public CommentData read(Integer id);
		public void save(CommentData comment);

}
