package pb.thirdtype;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ThitypeupdServlet
 */
public class ThitypeupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tid =request.getParameter("thitypeid");
		HttpSession session = request.getSession();
		session.setAttribute("thitypeid", tid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sectypeid =request.getParameter("sectypeid");
		String thitypeid =request.getParameter("thitypeid");
		String thitypename = request.getParameter("thitypename");
		Thitypedealer ttd = new Thitypedealer();
		boolean ok =ttd.update(sectypeid,thitypeid,thitypename);
		if (ok) {
			response.sendRedirect("success.jsp");
		} 
		else {
			response.sendRedirect("fail.jsp");
			System.out.println("¸üÐÂÊ§°Ü");
		}
	}

}
