package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SectypeupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sid =request.getParameter("sectypeid");
		HttpSession session = request.getSession();
		session.setAttribute("sectypeid", sid);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String firtypeid =request.getParameter("firtypeid");
		String sectypeid =request.getParameter("sectypeid");
		String sectypename = request.getParameter("sectypename");
		Sectypedealer std = new Sectypedealer();
		boolean ok =std.update(firtypeid,sectypeid,sectypename);
		if (ok) {
			response.sendRedirect("success.jsp");
		} 
		else {
			response.sendRedirect("fail.jsp");
			System.out.println("¸üÐÂÊ§°Ü");
		}
		
	}

}
