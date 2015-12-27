package pb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
public class FirsttypeServlet extends HttpServlet {      
	  
	    @Override
		public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException  {  
	       
	    }  

	    @Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	  String fid =request.getParameter("firtypeid");
	    	  Firtypedealer ftd =new Firtypedealer();
	    	  ftd.delete(fid);
	    	  HttpSession session = request.getSession();
	    	  session.setAttribute("firtypeid", fid);
	    	
	    }
		

}
