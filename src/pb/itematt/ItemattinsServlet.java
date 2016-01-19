package pb.itematt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import pb.attributeg.Attrigdealer;
import pb.db.DataColumn;
import pb.db.TableValues;

/**
 * Servlet implementation class ItemattinsServlet
 */
public class ItemattinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		JSONArray fromObject = JSONArray.fromObject(listg);
		 PrintWriter out = response.getWriter();  
	        out.write(fromObject.toString()); 
//	request.setAttribute("data", fromObject);
//	request.getRequestDispatcher("item_att_ins.jsp?1=1").forward(request, response);
}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Itemattdealer tad = new Itemattdealer();
	String attid = request.getParameter("attid");
	String itemid = request.getParameter("itemid");
	String attrigid = request.getParameter("attrigid");
	boolean insertSuccess =tad.insert(attid, itemid,attrigid);
	if (insertSuccess) {
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("#");
		}
	}


}
