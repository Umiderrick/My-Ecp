package pb;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pb.db.DataColumn;
import pb.db.TableValues;


/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Searchdealer scd =new Searchdealer(); 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Object o =request.getParameter("pattern");
		if(o == null)
		{
			o =request.getParameter("thitypeid");
			TableValues tv = scd.thitypesearch(o.toString());
			DataColumn[] dcl=tv.getDataColumns();
				for(int i=0;i<tv.getValues().length;i++)
					{
						Map<String,Object> map = new HashMap<String,Object>();
							for(int j=0 ;j<tv.getDataColumns().length;j++)
								{
									String key =dcl[j].getName();
									String value =tv.getValues()[i][j].toString();
									map.put(key,value);
								}
						list.add(map);
					}
		}else{
			TableValues tv = scd.indexsearch(o.toString());
			DataColumn[] dcl=tv.getDataColumns();
				for(int i=0;i<tv.getValues().length;i++)
					{
						Map<String,Object> map = new HashMap<String,Object>();
							for(int j=0 ;j<tv.getDataColumns().length;j++)
								{
									String key =dcl[j].getName();
									String value =tv.getValues()[i][j].toString();
									map.put(key,value);
								}
							list.add(map);
					}
		}
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		request.getRequestDispatcher("list_search.jsp").forward(request, response);
	}
}
