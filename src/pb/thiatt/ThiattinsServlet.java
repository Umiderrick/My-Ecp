package pb.thiatt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ThiattinsServlet
 */
public class ThiattinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Thiattdealer tad = new Thiattdealer();
		String attid = request.getParameter("attid");
		String thitypeid = request.getParameter("thitypeid");
		boolean insertSuccess =tad.insert(attid, thitypeid);
		if (insertSuccess) {
				response.sendRedirect("../success.jsp");
			} else {
				response.sendRedirect("#");
			}
		}

}
