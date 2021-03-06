package pb.item;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ItemServlet
 */
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String itemid = request.getParameter("itemid");
		HttpSession session = request.getSession();
		session.setAttribute("itemid", itemid);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String itemid = request.getParameter("itemid");
		Itemdealer itd = new Itemdealer();
		itd.delete(itemid);
	}
}
