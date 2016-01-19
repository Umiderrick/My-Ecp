package pb.attribute;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttributeupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attid =request.getParameter("attid");
		HttpSession session = request.getSession();
		session.setAttribute("attid", attid);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String attid =request.getParameter("attid");
		String attname = request.getParameter("attname");
		Attributedealer atd = new Attributedealer();
		boolean ok =atd.update(attid,attname);
		if (ok) {
			response.sendRedirect("success.jsp");
		} 
		else {
			response.sendRedirect("fail.jsp");
		}
	}

}
