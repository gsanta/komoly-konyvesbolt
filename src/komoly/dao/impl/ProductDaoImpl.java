package komoly.dao.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import komoly.bean.BookData;
import komoly.bean.CommentData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SelectData;
import komoly.dao.ProductDao;
import komoly.utils.DatabaseHelper;
import komoly.utils.Direction;

import org.apache.log4j.Logger;

public class ProductDaoImpl implements ProductDao {

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(ProductDaoImpl.class);

	public List<BookData> select(List<SelectData> selectDataList,
			int selectCount, int lastId, Direction direction, int userId) {

		List<BookData> bookList = new ArrayList<BookData>();

		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		String query = "select * from (select KONYV.KONYV_ID as KID, KONYV.CIM as C, PRICE as P, OLDALSZAM as OSZ, ISEBOOK as EB, KOTES as KO,"
				+ "MERET as ME, MUFAJNEV as MNEV, NEV as N, IMAGE_URL as IURL from KONYV, KIADO, MUFAJOK ";

		query += makeSearchQueryWhereClause(selectDataList);

		if (selectDataList.size() > 0) {
			query += " and ";
		}

		String directionString = "";
		String orderString = "";
		if (direction == Direction.LEFT) {
			directionString = " < ";
			orderString = " desc ";
		} else {
			directionString = " > ";
			orderString = " asc ";
		}

		query += " KONYV.KIADO_ID = KIADO.KIADO_ID and KONYV.MUFAJ_ID = MUFAJOK.MUFAJ_ID and KONYV_ID"
				+ directionString
				+ "? order by KID "
				+ orderString
				+ ") where ROWNUM <= ? order by KID";

		try {
			stm = conn.prepareStatement(query);

			int len = selectDataList.size();

			for (int i = 0; i < len; i++) {

				if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setInt(i + 1,
							Integer.valueOf(selectDataList.get(i).getValue()));
				} else if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.STRING) {
					stm.setString(i + 1, "%" + selectDataList.get(i).getValue()
							+ "%");
				}
			}

			stm.setInt(len + 1, lastId);
			stm.setInt(len + 2, selectCount);

			LOGGER.info(query);
			rs = stm.executeQuery();

			ResultSet rs2;
			while (rs.next()) {
				BookData book = new BookData();

				stm = conn
						.prepareStatement("select avg(RATING) as AVG, count(RATING) as COUNT from KONYV inner join RATING on KONYV.KONYV_ID = RATING.BOOK_ID where KONYV_ID = ?");
				stm.setInt(1, rs.getInt("KID"));

				rs2 = stm.executeQuery();

				if (rs2.next()) {
					book.setRating(Math.round(rs2.getFloat("AVG")));
					book.setRatingCount(rs2.getInt("COUNT"));
				} else {
					book.setRating(0);
					book.setRatingCount(0);
				}

				stm = conn
						.prepareStatement("select KONYV_ID from KONYV inner join RATING on KONYV.KONYV_ID = RATING.BOOK_ID where KONYV_ID = ? and USER_ID = ?");
				stm.setInt(1, rs.getInt("KID"));
				stm.setInt(2, userId);

				rs2 = stm.executeQuery();

				if (rs2.next()) {
					book.setRatedByUser(true);
				} else {
					book.setRatedByUser(false);
				}

				book.setId(rs.getInt("KID"));
				book.setTitle(rs.getString("C"));
				book.setPrice(rs.getInt("P"));
				book.setPageNum(rs.getInt("OSZ"));
				book.setEbook(rs.getBoolean("EB"));
				book.setKotes(rs.getString("KO"));
				book.setMeret(rs.getString("ME"));
				book.setMufaj(rs.getString("MNEV"));
				book.setKiado(rs.getString("N"));
				book.setFileName(rs.getString("IURL"));
				bookList.add(book);
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return bookList;
	}

	@Override
	public List<PublisherData> getAllPublisher() {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		List<PublisherData> publisherList = new ArrayList<PublisherData>();

		try {
			stm = conn.prepareStatement("select KIADO_ID, NEV from KIADO");

			rs = stm.executeQuery();

			while (rs.next()) {
				PublisherData pd = new PublisherData();
				pd.setId(rs.getInt("KIADO_ID"));
				pd.setName(rs.getString("NEV"));
				publisherList.add(pd);
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
		return publisherList;
	}

	@Override
	public List<MufajData> getAllMufaj() {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		List<MufajData> mufajList = new ArrayList<MufajData>();

		try {
			stm = conn
					.prepareStatement("select MUFAJ_ID, MUFAJNEV from MUFAJOK");

			rs = stm.executeQuery();

			while (rs.next()) {
				MufajData md = new MufajData();
				md.setId(rs.getInt("MUFAJ_ID"));
				md.setName(rs.getString("MUFAJNEV"));
				mufajList.add(md);
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
		return mufajList;
	}

	public void addBook(BookData bookData, String basePath) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			stm = conn.prepareStatement("select max(KONYV_ID) from KONYV");
			rs = stm.executeQuery();

			System.out.println("saaavePath: " + basePath + "file.jpg");

			System.out.println(bookData.getImage().getContentType());
			System.out.println(bookData.getImage().getFileName());

			int newId = 0;

			if (rs.next()) {
				newId = rs.getInt(1) + 1;
			}

			DatabaseHelper.close(stm);

			String ext = null;

			if (bookData.getImage().getContentType().equals("image/jpeg")) {
				ext = ".jpg";
			}

			bookData.getImage().save(
					new File(basePath + "/book_pics/" + newId + ext));

			stm = conn
					.prepareStatement("insert into KONYV (CIM,ADDED,PRICE,KIADO_ID,MUFAJ_ID,OLDALSZAM,KOTES,MERET,ISEBOOK,KONYV_ID,IMAGE_URL) values(?,to_date('04-SZEPT.-29','RR-MON-DD'),?,?,?,?,?,?,?,?,?)");

			stm.setString(1, bookData.getTitle());
			stm.setInt(2, bookData.getPrice());
			stm.setInt(3, bookData.getKiadoId());
			stm.setInt(4, bookData.getMufajId());
			stm.setInt(5, bookData.getPageNum());
			stm.setString(6, bookData.getKotes());
			stm.setString(7, bookData.getMeret());
			stm.setBoolean(8, bookData.isEbook());
			stm.setInt(9, newId);

			if (ext != null) {
				stm.setString(10, newId + ext);
			}

			stm.executeUpdate();

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
	}

	public void addPDFBook(BookData bookData, String basePath) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			stm = conn.prepareStatement("select max(KONYV_ID) from KONYV");
			rs = stm.executeQuery();

			System.out.println("saaavePath: " + basePath + "file.jpg");

			System.out.println(bookData.getImage().getContentType());
			System.out.println(bookData.getImage().getFileName());

			int newId = 0;

			if (rs.next()) {
				newId = rs.getInt(1) + 1;
			}

			DatabaseHelper.close(stm);

			String ext = null;

			if (bookData.getImage().getContentType().equals("image/jpeg")) {
				ext = ".jpg";
			}

			bookData.getImage().save(
					new File(basePath + "/book_pics/" + newId + ext));

			bookData.getPdf().save(
					new File(basePath + "/book_pics/" + newId + ext));

			stm = conn
					.prepareStatement("insert into KONYV (CIM,ADDED,PRICE,KIADO_ID,MUFAJ_ID,OLDALSZAM,KOTES,MERET,ISEBOOK,KONYV_ID,IMAGE_URL) values(?,to_date('04-SZEPT.-29','RR-MON-DD'),?,null,?,?,null,null,1,?,?)");

			stm.setString(1, bookData.getTitle());
			stm.setInt(2, bookData.getPrice());
			stm.setInt(3, bookData.getMufajId());
			stm.setInt(4, bookData.getPageNum());
			stm.setInt(5, newId);

			if (ext != null) {
				stm.setString(6, newId + ext);
			}

			stm.executeUpdate();

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
	}

	public boolean hasPrevData(int bookId, List<SelectData> selectDataList) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			String query = "select min(KONYV_ID) from KONYV, KIADO, MUFAJOK ";
			query += makeSearchQueryWhereClause(selectDataList);

			if (selectDataList.size() > 0) {
				query += " and ";
			}
			query += " KONYV.KIADO_ID = KIADO.KIADO_ID and KONYV.MUFAJ_ID = MUFAJOK.MUFAJ_ID order by KONYV.KONYV_ID";

			stm = conn.prepareStatement(query);

			int len = selectDataList.size();

			for (int i = 0; i < len; i++) {

				if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setInt(i + 1,
							Integer.valueOf(selectDataList.get(i).getValue()));
				} else if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.STRING) {
					stm.setString(i + 1, "%" + selectDataList.get(i).getValue()
							+ "%");
				}
			}

			rs = stm.executeQuery();

			int id = 0;
			System.out.println("firstId: " + id + " currentId: " + bookId);
			if (rs.next()) {
				id = rs.getInt(1);
			}

			if (id < bookId) {
				return true;
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return false;
	}

	public boolean hasNextData(int bookId, List<SelectData> selectDataList) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			String query = "select max(KONYV_ID) from KONYV, KIADO, MUFAJOK ";
			query += makeSearchQueryWhereClause(selectDataList);

			if (selectDataList.size() > 0) {
				query += " and ";
			}

			query += " KONYV.KIADO_ID = KIADO.KIADO_ID and KONYV.MUFAJ_ID = MUFAJOK.MUFAJ_ID";

			System.out.println("hasNextQuery: " + query);

			stm = conn.prepareStatement(query);

			int len = selectDataList.size();

			for (int i = 0; i < len; i++) {

				if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setInt(i + 1,
							Integer.valueOf(selectDataList.get(i).getValue()));
				} else if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.STRING) {
					stm.setString(i + 1, "%" + selectDataList.get(i).getValue()
							+ "%");
				}
			}

			rs = stm.executeQuery();

			int id = 0;

			if (rs.next()) {
				id = rs.getInt(1);
			}

			System.out.println("lastId: " + id + " currentId: " + bookId);
			if (id > bookId) {
				return true;
			}

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return false;
	}

	private String makeSearchQueryWhereClause(List<SelectData> selectDataList) {
		String query = "";

		Collections.sort(selectDataList, new Comparator<SelectData>() {

			@Override
			public int compare(SelectData o1, SelectData o2) {
				if (o1.getConcatenationOperator() == SelectData.ConcatenationOperator.OR) {
					return -1;
				} else {
					return 1;
				}
			}

		});

		LOGGER.info(selectDataList);

		boolean elso = true;

		int i = 0;
		int length = selectDataList.size();

		while (i < length
				&& selectDataList.get(i).getConcatenationOperator() == SelectData.ConcatenationOperator.OR) {

			boolean string = (selectDataList.get(i).getRelationOperator() == SelectData.RelationOperator.LIKE);

			if (elso == true) {
				query += "where ( "
						+ selectDataList.get(i).getColumn().toString() + " "
						+ selectDataList.get(i).getRelationOperator() + " ";

				query += "?";

				elso = false;
			} else {
				query += " " + selectDataList.get(i).getColumn().toString()
						+ " " + selectDataList.get(i).getRelationOperator()
						+ " ";

				query += "?";

			}

			i++;

			if (length == i
					|| selectDataList.get(i).getConcatenationOperator() != SelectData.ConcatenationOperator.OR) {
				query += ")";
			} else {
				query += " or ";
			}
		}

		if (i == 0) {
			query += " where ";
		}

		while (i < length) {

			if (i != 0) {
				query += " and ";
			}

			boolean string = (selectDataList.get(i).getRelationOperator() == SelectData.RelationOperator.LIKE);

			query += selectDataList.get(i).getColumn().toString() + " "
					+ selectDataList.get(i).getRelationOperator() + " ";

			query += "?";

			i++;
		}

		return query;
	}

	public List<CommentData> getCommmentListByBookId(int bookId) {
		//		List<CommentData> commentDataList = new ArrayList<CommentData>();
		//		commentDataList.add(new CommentData("Ez a könyv szar", new Date(), 1,
		//				1, 1));
		//		commentDataList.add(new CommentData("Ez a könyv szar tényleg szar",
		//				new Date(), 2, 1, 2));
		//		commentDataList.add(new CommentData("Ez a könyv szar tényleg szar",
		//				new Date(), 1, 2, 3));
		//		return commentDataList;
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		List<CommentData> commentDataList = new ArrayList<CommentData>();

		try {

			stm = conn
					.prepareStatement("select CONTENT,CREATE_DATE,KOMMENT.USER_ID,COMMENT_ID,NEV from KOMMENT, USERS where USERS.USER_ID = KOMMENT.USER_ID AND BOOK_ID = ?");
			stm.setInt(1, bookId);
			rs = stm.executeQuery();

			while (rs.next()) {
				CommentData commentData = new CommentData();
				commentData.setBookID(bookId);
				commentData.setComment(rs.getString("CONTENT"));
				commentData.setDate(rs.getDate("CREATE_DATE"));
				commentData.setUserID(rs.getInt("USER_ID"));
				commentData.setID(rs.getInt("COMMENT_ID"));
				commentData.setUserName(rs.getString("NEV"));
				commentDataList.add(commentData);
			}
		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}

		return commentDataList;
	}

	public void addComment(CommentData commentData) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			stm = conn.prepareStatement("select max(COMMENT_ID) from KOMMENT");
			rs = stm.executeQuery();

			int newId = 0;

			if (rs.next()) {
				newId = rs.getInt(1) + 1;
			}

			DatabaseHelper.close(stm);

			stm = conn
					.prepareStatement("insert into KOMMENT (CONTENT,CREATE_DATE,USER_ID,BOOK_ID,COMMENT_ID) values(?,to_date('04-SZEPT.-29','RR-MON-DD'),?,?,?)");

			stm.setString(1, commentData.getComment());
			stm.setInt(2, commentData.getUserID());
			stm.setInt(3, commentData.getBookID());
			stm.setInt(4, newId);

			stm.executeUpdate();

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
	}

	public void rate(int bookId, int userId, int rate) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {

			stm = conn
					.prepareStatement("insert into RATING (BOOK_ID,USER_ID,RATING) values(?,?,?)");

			stm.setInt(1, bookId);
			stm.setInt(2, userId);
			stm.setInt(3, rate);

			stm.executeUpdate();

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(rs);
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
	}
}
