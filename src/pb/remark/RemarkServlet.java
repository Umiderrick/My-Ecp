package pb.remark;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemarkServlet
 */
public class RemarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemarkServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String remarkid =request.getParameter("remarkid");
		Remarkdealer rmd =new Remarkdealer();
		rmd.delete(remarkid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String itemid =request.getSession().getAttribute("itemid").toString();
		String username =request.getSession().getAttribute("userName").toString();
		if(username ==null){
			response.sendRedirect("../fail/fail.jsp");
		}else{
		String levels =request.getParameter("levels");
		String neirong =request.getParameter("neirong");
		Remarkdealer rmd =new Remarkdealer();
		rmd.insert(username,itemid,levels,neirong);
		}
	}

}
