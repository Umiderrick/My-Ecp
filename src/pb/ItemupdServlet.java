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
       
	private String filePath; // 文件存放目录
	private String tempPath; // 临时文件目录

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// 从配置文件中获得初始化参数
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
		System.out.println("文件存放目录、临时文件目录准备完毕 ...");
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
			// threshold 极限、临界值，即硬盘缓存 1M
			diskFactory.setSizeThreshold(4 * 1024);
			// repository 贮藏室，即临时文件目录
			diskFactory.setRepository(new File(tempPath));

			ServletFileUpload upload = new ServletFileUpload(diskFactory);
			// 设置允许上传的最大文件大小 4M
			upload.setSizeMax(4 * 1024 * 1024);
			// 解析HTTP请求消息头
			@SuppressWarnings("unchecked")
			List<FileItem> fileItems = upload.parseRequest(request);
			Iterator<FileItem> iter = fileItems.iterator();
			Map<String, Object> data = new HashMap<String, Object>();
			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					System.out.println("处理表单内容 ...");
					processFormField(item, pw, data);
				} else {
					System.out.println("处理上传的文件 ...");
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
			System.out.println("使用 fileupload 包时发生异常 ...");
			e.printStackTrace();
		} // end try ... catch ...
	}// end doPost()

	// 处理表单内容
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

	// 处理上传的文件
	private void processUploadFile(FileItem item, PrintWriter pw, Map<String, Object> data) throws Exception {
		// 此时的文件名包含了完整的路径，得注意加工一下
		String filename = item.getName();
		String subfix = filename.substring(filename.lastIndexOf('.'));
		System.out.println("完整的文件名：" + filename);
		int index = filename.lastIndexOf("\\");
		filename = filename.substring(index + 1, filename.length());
		long fileSize = item.getSize();
		if ("".equals(filename) && fileSize == 0) {
			System.out.println("文件名为空 ...");
			return;
		}
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		filename = dateFormat.format(now);// 可以方便地修改
		System.out.println("新文件名:" + filename);
		File uploadFile = new File(filePath + "/" + filename + subfix);
		item.write(uploadFile);
		pw.println(filename + " 文件保存完毕 ...");
		// pw.println("文件大小为 ：" + fileSize + "\r\n");
		data.put("imgurl", "/users/images/" + filename + subfix);
	}
}
