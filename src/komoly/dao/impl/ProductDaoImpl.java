package komoly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import komoly.bean.SelectData;
import komoly.dao.ProductDao;
import komoly.utils.DatabaseHelper;

import org.apache.log4j.Logger;

public class ProductDaoImpl implements ProductDao {

	/**
	 * LOGGER.
	 */
	private final Logger LOGGER = Logger.getLogger(ProductDaoImpl.class);

	public void select(List<SelectData> selectDataList, int selectCount,
			int lastId) {

		String query = "select * from KONYV ";

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

			if (elso == true) {
				query += "where ( "
						+ selectDataList.get(i).getColumn().toString()
						+ selectDataList.get(i).getRelationOperator() + "?";
				elso = false;
			} else {
				query += " " + selectDataList.get(i).getColumn().toString()
						+ selectDataList.get(i).getRelationOperator() + "?";
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

			query += " and " + selectDataList.get(i).getColumn().toString()
					+ selectDataList.get(i).getRelationOperator() + "?";
			i++;
		}

		Connection conn = DatabaseHelper.getConnection();

		PreparedStatement stm = null;
		ResultSet rs = null;

		try {
			stm = conn.prepareStatement(query);

			for (i = 0; i < length; i++) {

				if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setInt(i + 1,
							Integer.valueOf(selectDataList.get(i).getValue()));
				} else if (selectDataList.get(i).getColumn().getColumnType() == SelectData.COLUMN_TYPE.INT) {
					stm.setString(i + 1, selectDataList.get(i).getValue());
				}
			}

			LOGGER.info(query);
			rs = stm.executeQuery();

			if (rs.next()) {
				LOGGER.info(rs.getString("CIM"));
			}

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
