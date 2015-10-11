package pb.db;

import java.util.Arrays;

/**
 * ±íÊý¾Ý
 * 
 * @author Administrator
 *
 */
public class TableValues {

	private final DataColumn[] dataColumns;

	private final Object[][] values;

	public TableValues(DataColumn[] dataColumns, Object[][] values) {
		super();
		this.dataColumns = dataColumns;
		this.values = values;
	}

	public DataColumn[] getDataColumns() {
		return dataColumns;
	}

	public Object[][] getValues() {
		return values;
	}

	public boolean isEmpty() {
		return dataColumns == null || dataColumns.length == 0 || values == null || values.length == 0;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		for (DataColumn dc : dataColumns) {
			if (sb.length() > 0) {
				sb.append("\t");
			}
			sb.append(dc);
		}
		sb.append("\n");
		int i = 0;
		for (Object[] vs : values) {
			if (i++ > 0) {
				sb.append("\n");
			}
			sb.append(Arrays.toString(vs));
		}
		return sb.toString();
	}
}
