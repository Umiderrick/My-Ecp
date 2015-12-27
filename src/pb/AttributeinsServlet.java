package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttributeinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String attid = request.getParameter("attid");// 获取大类id
		String attname = request.getParameter("attname");// 获取大类名称
		Attributedealer atd = new Attributedealer();
		boolean insertSuccess = atd.insert(attid, attname);
		HttpSession session = request.getSession();
		session.setAttribute("attname", attname);
		if (insertSuccess) {
				response.sendRedirect("success.jsp");
			} else {
				response.sendRedirect("failure.jsp");
			}
	}

}
