package pb.obj.test;

import java.io.ByteArrayInputStream;
import java.util.List;

import pb.db.DB;
import pb.db.TableValues;

public class DBSource extends AbstractSource {

	@Override
	public List<String> getLineList() {
		@SuppressWarnings("resource")
		DB query = new DB();
		TableValues tv = query.query("select logcontent from pb_log where id =1 ", null, null);
		Object[][] values = tv.getValues();
		if (values == null || values.length == 0) {
			return null;
		}
		String str = (String) values[0][0];
		ByteArrayInputStream in = new ByteArrayInputStream(str.getBytes());
		try {
			return getLineList(in);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
