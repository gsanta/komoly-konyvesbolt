package komoly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import komoly.bean.BookData;
import komoly.bean.MufajData;
import komoly.bean.PublisherData;
import komoly.bean.SelectData;
import komoly.dao.ProductDao;
import komoly.utils.DatabaseHelper;

import org.apache.log4j.Logger;

public class ProductDaoImpl implements ProductDao {

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(ProductDaoImpl.class);

	public List<BookData> select(List<SelectData> selectDataList,
			int selectCount, int lastId) {

		List<BookData> bookList = new ArrayList<BookData>();

		String query = "select * from KONYV, KIADO, MUFAJOK ";

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

		query += " and KONYV.KIADO_ID = KIADO.KIADO_ID and KONYV.MUFAJ_ID = MUFAJOK.MUFAJ_ID";

		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {
			stm = conn.prepareStatement(query);

			for (i = 0; i < length; i++) {

				if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setInt(i + 1,
							Integer.valueOf(selectDataList.get(i).getValue()));
				} else if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.STRING) {
					stm.setString(i + 1, "%" + selectDataList.get(i).getValue()
							+ "%");
				}
			}

			LOGGER.info(query);
			rs = stm.executeQuery();

			while (rs.next()) {
				BookData book = new BookData();
				book.setId(rs.getInt("KONYV_ID"));
				book.setTitle(rs.getString("CIM"));
				book.setPrice(rs.getInt("PRICE"));
				book.setPageNum(rs.getInt("OLDALSZAM"));
				book.setEbook(rs.getBoolean("ISEBOOK"));
				book.setKotes(rs.getString("KOTES"));
				book.setMeret(rs.getString("MERET"));
				book.setMufaj(rs.getString("MUFAJNEV"));
				book.setKiado(rs.getString("NEV"));
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

	public void addBook(BookData bookData) {
		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;

		try {
			stm = conn
					.prepareStatement("insert into KONYV (CIM,ADDED,PRICE,KIADO_ID,MUFAJ_ID,OLDALSZAM,KOTES,MERET,ISEBOOK,KONYV_ID) values(?,'2013-01-01',?,?,?,?,?,?,?,?)");

			stm.setString(1, bookData.getTitle());
			stm.setInt(2, bookData.getPrice());
			stm.setInt(3, bookData.getKiadoId());
			stm.setInt(4, bookData.getMufajId());
			stm.setInt(5, bookData.getPageNum());
			stm.setString(6, bookData.getKotes());
			stm.setString(7, bookData.getMeret());
			stm.setBoolean(8, bookData.isEbook());
			stm.setInt(9, 5);

			stm.executeUpdate();

		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		} finally {
			DatabaseHelper.close(stm);
			DatabaseHelper.close(conn);
		}
	}
}
