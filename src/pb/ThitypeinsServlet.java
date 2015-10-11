package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pb.db.DataColumn;
import pb.db.TableValues;
public class ThitypeinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Thitypedealer ttd = new Thitypedealer();
		TableValues firtypeid = ttd.query("thitype");
		DataColumn[] col = firtypeid.getDataColumns();
		String name = col.toString();
		System.out.println(name);
		String sid = request.getParameter("sectypeid");
		String thitypeid = request.getParameter("thitypeid");// 获取三级类id
		String thitypename = request.getParameter("thitypename");// 获取三级类名称
		boolean insertSuccess = ttd.insert(sid,thitypeid, thitypename);
		if (insertSuccess) {
				response.sendRedirect("success.jsp");
			} else {
				response.sendRedirect("#");
			}
	}

}
