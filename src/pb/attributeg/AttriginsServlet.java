package pb.attributeg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttriginsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Attrigdealer atd = new Attrigdealer();
		String attid = request.getParameter("attid");
		String attrigid = request.getParameter("attrigid");
		String attrigname = request.getParameter("attrigname");
		boolean insertSuccess = atd.insert(attid,attrigid, attrigname);
		if (insertSuccess) {
				response.sendRedirect("../success.jsp");
			} else {
				response.sendRedirect("../fail/fail.jsp");
			}
	}

}
