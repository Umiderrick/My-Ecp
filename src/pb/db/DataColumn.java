package pb.db;

/**
 * Êý¾ÝÁÐ
 * 
 * @author Administrator
 *
 */
public class DataColumn {
	private final String name;
	private final int type;

	public DataColumn(String name, int type) {
		super();
		this.name = name;
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public int getType() {
		return type;
	}

	private int size;
	private int deci;

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getDeci() {
		return deci;
	}

	public void setDeci(int deci) {
		this.deci = deci;
	}

	@Override
	public String toString() {
		return name + "=" + type;
	}
}
