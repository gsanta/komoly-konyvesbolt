package komoly.bean;

public class SelectData {

	public enum RelationOperator {
		LESS_THAN("<"), GREATER_THAN(">"), LESS_THAN_EQUAL("<="), GREATER_THAN_EQUAL(
				">="), EQUALS("="), LIKE("like");

		String name;

		private RelationOperator(String name) {
			this.name = name;
		}

		public String toString() {
			return name;
		}
	};

	public enum Column {
		PRICE("PRICE", COLUMN_TYPE.INT), OLDALSZAM("OLDALSZAM", COLUMN_TYPE.INT), ISEBOOK(
				"ISEBOOK", COLUMN_TYPE.INT), CIM("KONYV.CIM",
				COLUMN_TYPE.STRING), MUFAJ_ID("KONYV.MUFAJ_ID", COLUMN_TYPE.INT), KIADO_ID(
				"KONYV.KIADO_ID", COLUMN_TYPE.INT);

		String name;
		COLUMN_TYPE columnType;

		private Column(String name, COLUMN_TYPE type) {
			this.name = name;
			this.columnType = type;
		}

		public String toString() {
			return name;
		}

		public COLUMN_TYPE getColumnType() {
			return columnType;
		}
	}

	public enum COLUMN_TYPE {
		STRING, INT, DATE
	};

	public enum ConcatenationOperator {
		AND("and"), OR("or");

		String name;

		private ConcatenationOperator(String name) {
			this.name = name;
		}

		public String toString() {
			return name;
		}
	}

	/**
	 * 
	 */
	private RelationOperator relationOperator;

	/**
	 * 
	 */
	private ConcatenationOperator concatenationOperator;

	/**
	 * 
	 */
	private Column column;

	/**
	 * 
	 */
	private String value;

	public SelectData(RelationOperator relationOperator,
			ConcatenationOperator concatenationOperator, Column column,
			String value) {
		super();
		this.relationOperator = relationOperator;
		this.concatenationOperator = concatenationOperator;
		this.column = column;
		this.value = value;
	}

	public RelationOperator getRelationOperator() {
		return relationOperator;
	}

	public ConcatenationOperator getConcatenationOperator() {
		return concatenationOperator;
	}

	public Column getColumn() {
		return column;
	}

	public String getValue() {
		return value;
	}

	@Override
	public String toString() {
		return "SelectData [relationOperator=" + relationOperator
				+ ", concatenationOperator=" + concatenationOperator
				+ ", column=" + column + ", value=" + value + "]";
	}
}
