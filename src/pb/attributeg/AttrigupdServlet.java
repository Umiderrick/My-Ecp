package pb.attributeg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AttrigupdServlet
 */
public class AttrigupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String attgid =request.getParameter("attgid");
		HttpSession session = request.getSession();
		session.setAttribute("attgid", attgid);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String attid =request.getParameter("attid");
		String attrigid = request.getParameter("attrigid");
		String attname = request.getParameter("attrigname");
		Attrigdealer agd = new Attrigdealer();
		boolean ok =agd.update(attrigid,attid,attname);
		if (ok) {
			response.sendRedirect("success.jsp");
		} 
		else {
			response.sendRedirect("fail.jsp");
		}	
	}

}
