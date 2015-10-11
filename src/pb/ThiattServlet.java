package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ThiattServlet
 */
@WebServlet("/ThiattServlet")
public class ThiattServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attid =request.getParameter("attid");
		String thitypeid = request.getParameter("thitypeid");
  	  	Thiattdealer tad =new Thiattdealer();
  	  	tad.delete(thitypeid,attid);
	}

}
