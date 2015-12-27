package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pb.db.DataColumn;
import pb.db.TableValues;

/**
 * Servlet implementation class SectypeinsServlet
 */
public class SectypeinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Sectypedealer std = new Sectypedealer();
		String fid = request.getParameter("firtypeid");
		String sectypeid = request.getParameter("sectypeid");// 获取二级类id
		String sectypename = request.getParameter("sectypename");// 获取二级类名称
		boolean insertSuccess = std.insert(fid,sectypeid, sectypename);
		if (insertSuccess) {
				response.sendRedirect("success.jsp");
			} else {
				response.sendRedirect("#");
			}
	}

}
