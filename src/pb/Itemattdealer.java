package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Itemattdealer {
	DB db = new DB();
	public TableValues query(String tablename) {
		
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		return tv;
		
	}
	public boolean insert (String attid ,String itemid,String attrigid) {
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("itemid", itemid);
			data.put("attid", attid);
			data.put("attrigid", attrigid);
			dataList.add(data);
			db.tableInsert("item_att", dataList);
			ok = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
	public void delete(int iaid) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("iaid",iaid);
		list.add(map);
		db.tableDelete("item_att",list );
		db.closeDatabase();
	} 
}
