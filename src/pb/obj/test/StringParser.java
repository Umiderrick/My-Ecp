package pb.obj.test;

import java.util.ArrayList;
import java.util.List;

public class StringParser implements Parser {

	@Override
	public List<String> getIPList(Source src) {
		List<Rule> ruleList = new ArrayList();
		ruleList.add(new Rule("[IP:", "]"));
		ruleList.add(new Rule("]@", ":1521/"));
		List<String> ipList = new ArrayList();
		for (String line : src.getLineList()) {
			for (Rule rule : ruleList) {
				int start = line.indexOf(rule.prefix);
				int end = line.indexOf(rule.suffix, start);
				if (start > -1 && end > start) {
					ipList.add(line.substring(start + rule.prefix.length(), end));
				}
			}
		}
		return ipList;
	}

	static class Rule {
		final String prefix;
		final String suffix;

		public Rule(String prefix, String suffix) {
			super();
			this.prefix = prefix;
			this.suffix = suffix;
		}

	}
}
