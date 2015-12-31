package pb.obj.test;

import java.util.List;
import java.util.regex.Pattern;

public class PatternParser implements Parser {

	static final Pattern ipPattern = Pattern.compile("\\d{1,3}(\\.\\d{1,3}){3}");

	@Override
	public List<String> getIPList(Source src) {
		// TODO Auto-generated method stub
		return null;
	}

}
