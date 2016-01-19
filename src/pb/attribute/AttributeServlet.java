package pb.attribute;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AttributeServlert
 */
public class AttributeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attid =request.getParameter("attid");
		Attributedealer atd =new Attributedealer();
  	  	atd.delete(attid);
  	  	HttpSession session = request.getSession();
  	  	session.setAttribute("attid", attid);
	}

}
