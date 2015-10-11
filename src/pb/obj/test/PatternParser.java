package pb.obj.test;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternParser implements Parser {

	static final Pattern ipPattern = Pattern.compile("\\d{1,3}(\\.\\d{1,3}){3}");

	@Override
	public List<String> getIPList(Source src) {
		List<String> ipList = new ArrayList();
		for (String line : src.getLineList()) {
			Matcher m = ipPattern.matcher(line);
			while (m.find()) {
				String f = m.group(0);
				ipList.add(f);
			}
		}
		return ipList;
	}

}
