package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
public class FirtypeinsServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String firtypeid = request.getParameter("firtypeid");// 获取大类id
		String firtypename = request.getParameter("firtypename");// 获取大类名称
		Firtypedealer ftd = new Firtypedealer();
		boolean insertSuccess = ftd.insert(firtypeid, firtypename);
		HttpSession session = request.getSession();
		session.setAttribute("firtypename", firtypename);
		if (insertSuccess) {
				response.sendRedirect("Firtypeinssuc.jsp");
			} else {
				response.sendRedirect("fail.jsp");
			}
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
}
