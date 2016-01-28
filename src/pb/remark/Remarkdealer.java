package pb.remark;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Remarkdealer {
	DB db = new DB();

	public TableValues queryI(String itemid) {
		TableValues tv = null;
		String sql ="select * from  remark where itemid = '"+itemid+"'";
		tv = db.query(sql);
		return tv;
		
	}
	public TableValues queryU(String username )
	{
		TableValues tv = null;
		String sql ="select * from remark where username = '"+username+"'" ;
		tv = db.query(sql);
		return tv;
		
	}
	public boolean insert (String username ,String itemid,String levels,String neirong) {
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("username", username);
			map.put("itemid", itemid);
			map.put("levels", levels);
			map.put("neirong", neirong);
			dataList.add(map);
			db.tableInsert("remark", dataList);
			ok =true;
			System.out.println("ÔuÕ“³É¹¦");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
	public void delete(int remarkid){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("remarkid",remarkid);
		list.add(map);
		db.tableDelete("remark",list );
		db.closeDatabase();
		System.out.println(remarkid +"ÒÑÉ¾³ý");
	}
}
