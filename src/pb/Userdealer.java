package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Userdealer {
	
	public boolean canlogin(String username, String password)
	{	DB db = new DB();
		TableValues tv =null;
		try {
		String sql ="select * from users where username = '" + username +"' and password = '" + password +"'";
		System.out.println(sql);
		tv =db.query(sql);
		return !tv.isEmpty();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		db.closeDatabase();
	}
		return !tv.isEmpty();
		
	}
	public boolean insert(String username, String password,String usertype) {
		DB db = new DB();
		boolean ok = true;
		TableValues tv =null;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("username", username);
			data.put("password", password);
			data.put("usertype", usertype);
			dataList.add(data);
			String sql ="select * from users where username = '" + username + "'";
			tv=db.query(sql);
			if(tv.isEmpty()) {
			db.tableInsert("users", dataList);
			}
			else {
				System.out.println("用户名已存在");
				ok = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ok = false;
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
}