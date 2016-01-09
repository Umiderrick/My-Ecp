package pb;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class ItemupdServlet
 */
public class ItemupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String filePath; // �ļ����Ŀ¼
	private String tempPath; // ��ʱ�ļ�Ŀ¼

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
		String itemid =request.getParameter("itemid");
		HttpSession session = request.getSession();
		session.setAttribute("itemid", itemid);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=gbk");
		PrintWriter pw = response.getWriter();
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
			@SuppressWarnings("unchecked")
			List<FileItem> fileItems = upload.parseRequest(request);
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
			String itemid =(String) data.get("itemid");
			String itemname =(String) data.get("itemname");
			int qty = Integer.parseInt(data.get("qty").toString());
			double price = Double.valueOf(data.get("price").toString()).doubleValue();
			String thitypeid =(String) data.get("thitypeid");
			String imgurl = (String) data.get("imgurl");
			itd.update(itemid, itemname, qty, price, thitypeid, imgurl);
			pw.close();
			response.sendRedirect("item.jsp");
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
