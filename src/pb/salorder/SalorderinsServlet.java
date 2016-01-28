package pb.salorder;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pb.db.DB;

/**
 * Servlet implementation class SalorderinsServlet
 */
public class SalorderinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DB db =new DB();   
    public SalorderinsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	String nnum =  request.getParameter("nnum").substring(1,request.getParameter("nnum").length()-1);
	String[] num =nnum.split(",");
	String itemidarray = request.getParameter("itemid").substring(1,request.getParameter("itemid").length()-1);
	String[] itemid =itemidarray.split(",");
 	String username =request.getSession().getAttribute("userName").toString();
 	for(int i =0;i<num.length;i++){
 		String nitemid =itemid[i].substring(1, itemid[i].length()-1);
 		int newnum =Integer.parseInt(num[i].substring(1, num[i].length()-1));
	String sql ="update cart set num = '"+newnum+"' where username ='"+username+"' and itemid ='"+nitemid+"'";
	db.executeUpdate(sql);
	}
	}

}
