package pb;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class IteminsServlet
 */
public class IteminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String filePath; // �ļ����Ŀ¼
	private String tempPath; // ��ʱ�ļ�Ŀ¼

	// ��ʼ��
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// �������ļ��л�ó�ʼ������
		// filePath = config.getInitParameter("filepath");
		// tempPath = config.getInitParameter("temppath");

		ServletContext context = getServletContext();
		filePath = context.getRealPath("/users/images");
		File file = new File(filePath);
		if (!file.exists()) {

			file.mkdirs();
		}
		tempPath = context.getRealPath("/temp");
		File tfile = new File(tempPath);
		if (!tfile.exists()) {

			tfile.mkdirs();
		}
		System.out.println("�ļ����Ŀ¼����ʱ�ļ�Ŀ¼׼����� ...");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	// protected void doPost(HttpServletRequest request, HttpServletResponse
	// response) throws ServletException, IOException {
	// Enumeration<String> attributeNames = request.getAttributeNames();
	// Enumeration<String> parameterNames = request.getParameterNames();
	// String itemid = request.getAttribute("itemid").toString();
	// String itemname = request.getAttribute("itemname").toString();
	// int qty = Integer.parseInt(request.getAttribute("qty").toString());
	// double price = Double.valueOf(request.getAttribute("price").toString()).doubleValue();
	// String thitypeid = request.getAttribute("thitypeid").toString();
	// String imgurl = request.getAttribute("imgurl").toString();
	// Object is = request.getAttribute("fileText");
	// Itemdealer itd =new Itemdealer();
	// boolean ok = itd.insert(itemid, itemname, qty, price, thitypeid, imgurl);
	// if(ok) {
	// response.sendRedirect("success.jsp");
	// }else
	// {
	// response.sendRedirect("fail.jsp");
	// }
	// }

	// doPost
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		 res.setContentType("text/plain;charset=gbk");
		//res.setContentType("text/html;charset=utf-8")
		PrintWriter pw = res.getWriter();
		try {
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			// threshold ���ޡ��ٽ�ֵ����Ӳ�̻��� 1M
			diskFactory.setSizeThreshold(4 * 1024);
			// repository �����ң�����ʱ�ļ�Ŀ¼
			diskFactory.setRepository(new File(tempPath));

			ServletFileUpload upload = new ServletFileUpload(diskFactory);
			// ���������ϴ�������ļ���С 4M
			upload.setSizeMax(4 * 1024 * 1024);
			// ����HTTP������Ϣͷ
			List<FileItem> fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			Map<String, Object> data = new HashMap<String, Object>();
			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					System.out.println("��������� ...");
					processFormField(item, pw, data);
				} else {
					System.out.println("�����ϴ����ļ� ...");
					processUploadFile(item, pw, data);
				}
			} // end while()
			Itemdealer itd = new Itemdealer();
			itd.insert(data);
			pw.close();
		} catch (Exception e) {
			System.out.println("ʹ�� fileupload ��ʱ�����쳣 ...");
			e.printStackTrace();
		} // end try ... catch ...
	}// end doPost()

	// ���������
	private void processFormField(FileItem item, PrintWriter pw, Map<String, Object> data) throws Exception {
		String name = item.getFieldName();
		String value = item.getString("utf-8");
		if(name.equals("qty")) {
			int values  = Integer.parseInt(value);
			data.put(name, values);
		}else if(name.equals("price"))
				{
			double values = Double.valueOf(value).doubleValue();
			data.put(name, values);
				}else {
		data.put(name, value);
				}
		// pw.println(name + " : " + value + "\r\n");
	}

	// �����ϴ����ļ�
	private void processUploadFile(FileItem item, PrintWriter pw, Map<String, Object> data) throws Exception {
		// ��ʱ���ļ���������������·������ע��ӹ�һ��
		String filename = item.getName();
		String subfix = filename.substring(filename.lastIndexOf('.'));
		System.out.println("�������ļ�����" + filename);
		int index = filename.lastIndexOf("\\");
		filename = filename.substring(index + 1, filename.length());
		long fileSize = item.getSize();
		if ("".equals(filename) && fileSize == 0) {
			System.out.println("�ļ���Ϊ�� ...");
			return;
		}
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		filename = dateFormat.format(now);// ���Է�����޸�
		System.out.println("���ļ���:" + filename);
		File uploadFile = new File(filePath + "/" + filename + subfix);
		item.write(uploadFile);
		pw.println(filename + " �ļ�������� ...");
		// pw.println("�ļ���СΪ ��" + fileSize + "\r\n");
		data.put("imgurl", "/users/images/" + filename + subfix);
	}

}
