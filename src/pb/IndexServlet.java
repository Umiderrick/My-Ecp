package pb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String thityepid = request.getParameter("thityepid");
		request.setAttribute("thitypeid", thityepid);
		request.getRequestDispatcher("list_search.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pattern =null;
		String thitypeid =null;
		thitypeid =request.getParameter("thitypeid");
		pattern =request.getParameter("pattern");
		HttpSession session = request.getSession();
		session.setAttribute("pattern", pattern);
		session.setAttribute("thitypeid", thitypeid);
		request.getRequestDispatcher("list_search.jsp").forward(request, response);
	}

}
