package pb.obj.test;

import java.util.List;

public class Main {

	/**
	 * type = 1�������ݿ� type = 2�����ļ���ȡ��
	 * 
	 * @param type
	 * @return
	 */
	static Source getLineList(int type) {
		Source src = null;
		if (type == 1) {
			src = new DBSource();
		} else if (type == 2) {
			src = new FileSource();
		}
		return src;
	}

	/**
	 * pb_log.id+logcontent(CLOB)
	 * 
	 * @param lineList
	 * @param type
	 *            1��ʹ��String���� 2��ʹ���������
	 * @return
	 */
	static List<String> parseLineList(Source src, int type) {
		if (type == 1) {
			StringParser SP = new StringParser();
			return SP.getIPList(src);
		} else if (type == 2) {
			PatternParser PP = new PatternParser();
			return PP.getIPList(src);
		} else

			return null;
	}

	/**
	 * https://www.processon.com/network Ҫ�󻭳�UMLͼ
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		Source src = getLineList(1);
		List<String> ipList = parseLineList(src, 1);
		for (String ip : ipList) {
			System.out.println(ip);
		}
	}

}
