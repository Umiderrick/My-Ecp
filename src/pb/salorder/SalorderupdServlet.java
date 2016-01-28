package pb.salorder;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SalorderupdServlet
 */
public class SalorderupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String salorderid =request.getParameter("salorderid");
		HttpSession session = request.getSession();
		session.setAttribute("salorderid", salorderid);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String itemid =request.getParameter("itemid");
		int num =Integer.parseInt(request.getParameter("num").toString());
		String address =request.getParameter("address");
		String attrigid =request.getParameter("attrigid");
		Salorderdealer sod = new Salorderdealer();
		boolean ok =sod.update(itemid,username,num,address,attrigid);
		if (ok) {
			response.sendRedirect("success.jsp");
		} 
		else {
			response.sendRedirect("fail.jsp");
		}
	}

}
