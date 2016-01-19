package pb.attributeg;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pb.db.DataColumn;
import pb.db.TableValues;


public class AttrigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attgid =request.getParameter("attgid");
		Attrigdealer agd =new Attrigdealer();
  	  	agd.delete(attgid);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attid =request.getParameter("attid");
		List<Map<String,Object>> listg = new ArrayList<Map<String,Object>>();
		Attrigdealer agd =new Attrigdealer();
		TableValues tv = agd.sel(attid);
		DataColumn[] dcls=tv.getDataColumns();
		for(int i=0;i<tv.getValues().length;i++)
		{
			Map<String,Object> map = new HashMap<String,Object>();
			for(int j=0 ;j<tv.getDataColumns().length;j++)
			{
				String key =dcls[j].getName();
				String value =tv.getValues()[i][j].toString();
				map.put(key,value);
			}
			listg.add(map);
		}
		request.setAttribute("listg", listg);
		request.getRequestDispatcher("attributeg.jsp").forward(request, response);
	}
	

}
