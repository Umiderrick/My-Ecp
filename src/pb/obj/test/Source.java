package pb.obj.test;

import java.util.List;

/**
 * 文本输入接口
 * 
 * @author
 * 
 */
public interface Source {
	/**
	 * 返回所有的非空文本行。
	 * 
	 * @return
	 */
	List<String> getLineList();
}
