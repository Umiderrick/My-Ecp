package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Attributedealer {
	DB db = new DB();
	public boolean insert (String attid ,String attname) {
			TableValues tv = null;
			boolean ok = true;
			try {
				List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("attid", attid);
				data.put("attname", attname);
				dataList.add(data);
				String sql ="select * from attribute where attid = '" + attid +"'";
				tv=db.query(sql);
				if(tv.isEmpty()) {
					db.tableInsert("attribute", dataList);
					ok =true;
					System.out.println("插入属性成功");
					}else
					{
							ok =false;
							System.out.println("属性名已存在");
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				db.closeDatabase();
			}
			return ok;
		}
	public boolean update (String attid, String attname){
		String sql ="update attribute set attname = '"+ attname +"' where attid = '" +attid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		db.closeDatabase();
		return true;
		
	}
	public void delete(String attid){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("attid",attid);
		list.add(map);
		db.tableDelete("attribute",list );
		db.closeDatabase();
		System.out.println(attid +"已删除");
	}
	public TableValues query(String tablename) {
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public TableValues query(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="select * from "+tablename +" where attid = '"+PKey+"'" ;
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
				
	}
	public TableValues innerquery(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="SELECT itemid FROM item INNER JOIN item_att ON item.itemid = item_att.itemid "  ;
		System.out.println(sql);
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
		
	}
}

