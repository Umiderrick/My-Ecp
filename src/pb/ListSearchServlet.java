package pb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pb.db.DB;
import pb.db.TableValues;

/**
 * Servlet implementation class ListSearchServlet
 */
@WebServlet("/ListSearchServlet")
public class ListSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String attrigid =request.getParameter("attrigid");
	DB db =new DB();
	
	String sql ="select * from (item inner join item_att on item_att.itemid = item.itemid ) where item_att.attrigid = '" +attrigid+"'";
	TableValues tv =db.query(sql);
	try {
		HttpSession session = request.getSession();
		session.setAttribute("attrigid", attrigid);
		session.setAttribute("tv", tv);
		db.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}

}
