package pb.firsttype;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirtypeupdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String fid =request.getParameter("firtypeid");
			HttpSession session = request.getSession();
			session.setAttribute("firtypeid", fid);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String firtypeid =request.getParameter("firtypeid");
		String firtypename = request.getParameter("firtypename");
		Firtypedealer ftd = new Firtypedealer();
		boolean ok =ftd.update(firtypeid,firtypename);
		if (ok) {
			response.sendRedirect("../success.jsp");
		} 
		else {
			response.sendRedirect("../fail/fail.jsp");
			System.out.println("¸üÐÂÊ§°Ü");
	}
	}
}
