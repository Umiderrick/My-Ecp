package pb.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemid = request.getParameter("itemid").toString();
		int num =Integer.valueOf(request.getParameter("num").toString());
		String attrigname =request.getParameter("attrigname").toString();
		String username = request.getSession().getAttribute("userName").toString(); 
		Cartdealer ctd =new Cartdealer();
		ctd.insert(itemid, num,username,attrigname);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getSession().getAttribute("userName").toString();
		String itemid = request.getParameter("itemid").toString();
		Cartdealer ctd =new Cartdealer();
		if(ctd.delete(itemid,username)){
			System.out.println("该商品删除成功");
		}else{
			System.out.println("删除失败");
		}
	}

}
