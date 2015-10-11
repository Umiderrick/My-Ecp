package pb.obj.test;

import java.util.List;

/**
 * 文本解析器。
 * 
 * @author 
 * 
 */
public interface Parser {
	/**
	 * 返回文本行中所有的IP
	 * 
	 * @param lineList
	 * @return
	 */
	List<String> getIPList(Source src);
}
