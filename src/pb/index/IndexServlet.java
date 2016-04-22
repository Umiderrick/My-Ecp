package pb.index;

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

import pb.search.Searchdealer;
import pb.db.DataColumn;
import pb.db.TableValues;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Searchdealer scd = new Searchdealer();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String thiid = request.getParameter("thitypeid");
		TableValues tv = scd.thitypesearch(thiid);
		DataColumn[] dcl = tv.getDataColumns();
		for (int i = 0; i < tv.getValues().length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < tv.getDataColumns().length; j++) {
				String key = dcl[j].getName();
				String value = tv.getValues()[i][j].toString();
				map.put(key, value);
			}
			list.add(map);
		}
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		request.setAttribute("thitypeid", thiid);
		request.getRequestDispatcher("list_search_thitype.jsp").forward(request, response);
	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Searchdealer scd = new Searchdealer();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Object o = request.getParameter("pattern");
			TableValues tv = scd.indexsearch(o.toString());
			DataColumn[] dcl = tv.getDataColumns();
			for (int i = 0; i < tv.getValues().length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int j = 0; j < tv.getDataColumns().length; j++) {
					String key = dcl[j].getName();
					String value = tv.getValues()[i][j].toString();
					map.put(key, value);
				}
				list.add(map);
			}
			if (list.size() == 0) {
				System.out.println("未查询到，结果为零");
			}
				HttpSession session = request.getSession();
				session.setAttribute("list", list);
				request.getRequestDispatcher("list_search.jsp").forward(request, response);
			}

}
