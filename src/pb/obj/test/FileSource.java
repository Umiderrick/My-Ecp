package pb.obj.test;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

public class FileSource extends AbstractSource {

	@Override
	public List<String> getLineList() {
		File file = new File("D:/pengbo/webapps/ereg/log.txt");
		try {
			return getLineList(new FileInputStream(file));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		// List<String> values = new ArrayList<String>();
		// Map<String, Boolean> map = new HashMap<String, Boolean>();
		// BufferedReader reader = null;
		// try {
		// reader = new BufferedReader(new FileReader(file));
		// String value = "";
		// while ((value = reader.readLine()) != null) {
		// value = value.trim();
		// if (!value.equals("")) {
		// if (map.get(value) == null) {
		// values.add(value);
		// map.put(value, true);
		// }
		// }
		// }
		// } catch (IOException e) {
		// e.printStackTrace();
		// } finally {
		// if (reader != null) {
		// try {
		// reader.close();
		// } catch (IOException e1) {
		// }
		// }
		// }
		// return values;
	}
}
