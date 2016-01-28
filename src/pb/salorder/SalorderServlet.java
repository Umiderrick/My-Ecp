package pb.salorder;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pb.cart.Cartdealer;

/**
 * Servlet implementation class SalorderServlet
 */
public class SalorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String salorderid =request.getParameter("salorderid").toString();
		String num =request.getParameter("num").toString();
  	  	Salorderdealer sod =new Salorderdealer();
  	  	sod.delete(salorderid,num);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username =  request.getParameter("username");
		String phone = request.getParameter("phone");
		String itemidarray = request.getParameter("itemid").substring(1,request.getParameter("itemid").length()-1);
		String[] itemid =itemidarray.split(",");
		String attrigid =request.getParameter("attrigid");
		String numarray = request.getParameter("num").substring(1,request.getParameter("num").length()-1);
		String[] num =numarray.split(",");
		double total = Double.parseDouble(request.getParameter("total"));
		String address = request.getParameter("address");
		Salorderdealer sod =new Salorderdealer();
		String res =sod.insert( username, itemid, num, attrigid, phone, address, total) ;
		if(res!= null){
			System.out.println("订单已下");
			Cartdealer ctd =new Cartdealer();
			if(ctd.delete(itemid, num)){
				System.out.println("购物车清空");
		}
		request.getSession().setAttribute("salorderid", res);
		request.getSession().setAttribute("total", total);
		}
		
	}

}
