package pb.attributeg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Attrigdealer {
	DB db =new DB();
	public TableValues sel(String attid){
		String sql ="select * from attg where attid = '"+ attid +"'";
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
		
	};
	public boolean insert (String attid,String attrigid ,String attrigname) {
		TableValues tv = null;
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("attid", attid);
			data.put("attrigid", attrigid);
			data.put("attrigname", attrigname);
			dataList.add(data);
			String sql ="select * from attg where attrigid = '" + attrigid +"'";
			tv=db.query(sql);
			if(tv.isEmpty()) {
				db.tableInsert("attg", dataList);
				ok =true;
				System.out.println("插入属性字典成功");
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
	public boolean update (String attrigid, String attid,String attrigname){
		String sql ="update attg set attrigname = '"+ attrigname +"',attid = '"+attid+"' where attrigid = '" +attrigid +"'" ;
		db.executeUpdate(sql);
		db.closeDatabase();
		return true;
	}
	public void delete(String attrigid){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("attrigid",attrigid);
		list.add(map);
		db.tableDelete("attg",list );
		db.closeDatabase();
		System.out.println(attrigid +"已删除");
	}
	public TableValues query(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="select * from "+tablename +" where attrigid = '"+PKey+"'" ;
		System.out.println(sql);
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
}
