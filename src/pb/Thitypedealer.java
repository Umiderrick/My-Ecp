package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Thitypedealer {
	public boolean insert (String sectypeid, String thitypeid,String thitypename) {
		DB db = new DB();
		TableValues tv = null;
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("sectypeid", sectypeid);
			data.put("thitypeid", thitypeid);
			data.put("thitypename", thitypename);
			dataList.add(data);
			String sql ="select * from thitype  where thitypeid = '" + thitypeid +"'";
			tv=db.query(sql);
			if(tv.isEmpty()) {
				db.tableInsert("thitype", dataList);
				ok =true;
				System.out.println("插入第三类别成功");
				}else
				{
						ok =false;
						System.out.println("类别名已存在");
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
public boolean update (String sectypeid,String thityprid, String thitypename)
{
	DB db =new DB();
	String sql ="update thitype set thitypename = '"+ thitypename +"',sectypeid = '"+ sectypeid + "' where thitypeid = '" +thityprid +"'" ;
	System.out.println(sql);
	db.executeUpdate(sql);
	return true;
	
}
public void delete(String thitypeid)
{
	DB db =new DB();
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> map =new HashMap<String,Object>();
	map.put("thitypeid",thitypeid);
	list.add(map);
	db.tableDelete("thitype",list );
	db.closeDatabase();
	System.out.println(thitypeid +"已删除");
	
	
}
public TableValues query(String tablename) {
	DB db = new DB();
	TableValues tv = null;
	String sql ="select * from "+tablename;
	tv = db.query(sql);
	return tv;
			
}
public TableValues query(String tablename,String PKey) {
	DB db = new DB();
	TableValues tv = null;
	String sql ="select * from "+tablename +" where thitypeid = '"+PKey+"'" ;
	System.out.println(sql);
	tv = db.query(sql);
	return tv;
			
}

}
