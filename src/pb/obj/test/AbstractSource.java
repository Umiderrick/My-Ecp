package pb.obj.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractSource implements Source {
	
	protected List<String> getLineList(InputStream in) throws Exception {
		List<String> lineList = new ArrayList<String>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(in));
			String line = null;
			while ((line = br.readLine()) != null) {
				if ((line = line.trim()).length() == 0) {
					continue;
				}
				lineList.add(line);
			}
		} finally {
			br.close();
		}
		return lineList;
	}
	
}
