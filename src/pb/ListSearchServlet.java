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

import com.mysql.jdbc.PreparedStatement.ParseInfo;

import pb.db.DB;
import pb.db.DataColumn;
import pb.db.TableValues;

/**
 * Servlet implementation class ListSearchServlet
 */
public class ListSearchServlet extends HttpServlet {
	DB db =new DB();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num =request.getParameter("num");
		int n =Integer.parseInt(num);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "select top "+n+" * from item where itemid not in (select top "+num+" itemid from item )";
		TableValues tv =db.query(sql);
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
		db.closeDatabase();
		request.setAttribute("list", list);
		request.getRequestDispatcher("list_search.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String attrigid =request.getParameter("attrigid");
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	String sql ="select top 8 * from item inner join item_att on item_att.itemid = item.itemid  where item_att.attrigid = '" +attrigid+"'";
	System.out.println(sql);
	TableValues tv =db.query(sql);
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
	db.closeDatabase();
	request.setAttribute("list", list);
	request.getRequestDispatcher("list_search.jsp").forward(request, response);
	HttpSession session = request.getSession();
	session.setAttribute("attrigid", attrigid);
	session.setAttribute("list", list);
	}

}