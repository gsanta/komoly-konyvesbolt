package komoly.action;

import java.util.ArrayList;
import java.util.List;

import komoly.bean.SelectData;
import komoly.common.BaseActionBean;
import komoly.dao.ProductDao;
import komoly.dao.impl.ProductDaoImpl;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

public class HomeActionBean extends BaseActionBean {

	/**
	 * Main view
	 */
	private static final String VIEW = "/WEB-INF/web/home.jsp";

	public Resolution view() {
		ProductDao productDao = new ProductDaoImpl();

		List<SelectData> selectDataList = new ArrayList<SelectData>();

		selectDataList.add(new SelectData(SelectData.RelationOperator.EQUALS,
				SelectData.ConcatenationOperator.AND,
				SelectData.Column.ISEBOOK, "1"));

		selectDataList.add(new SelectData(
				SelectData.RelationOperator.GREATER_THAN,
				SelectData.ConcatenationOperator.OR, SelectData.Column.PRICE,
				"100"));

		selectDataList.add(new SelectData(
				SelectData.RelationOperator.GREATER_THAN,
				SelectData.ConcatenationOperator.OR,
				SelectData.Column.OLDALSZAM, "600"));

		productDao.select(selectDataList, 0, 0);

		return new ForwardResolution(VIEW);
	}
}
