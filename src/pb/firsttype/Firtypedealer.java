package pb.firsttype;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Firtypedealer {
	DB db = new DB();
	public boolean insert (String firtypeid, String firtypename) {
			TableValues tv = null;
			boolean ok = true;
			try {
				List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("firtypeid", firtypeid);
				data.put("firtypename", firtypename);
				dataList.add(data);
				String sql ="select * from firtype  where firtypeid = '" + firtypeid +"' and firtypename = '" + firtypename +"'";
				tv=db.query(sql);
				if(tv.isEmpty()) {
					db.tableInsert("firtype", dataList);
					ok =true;
					System.out.println("插入新大类别成功");
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
	public boolean update (String firtypeid, String firtypename)
	{
		String sql ="update firtype set firtypename = '"+ firtypename +"' where firtypeid = '" +firtypeid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
		
	}
	public void delete(String firtypeid){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("firtypeid",firtypeid);
		list.add(map);
		db.tableDelete("firtype",list );
		db.closeDatabase();
		System.out.println(firtypeid +"已删除");
		
		
	}
	public TableValues query(String tablename) {
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		return tv;
				
	}
	public TableValues query(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="select * from "+tablename +" where firtypeid = '"+PKey+"'" ;
		System.out.println(sql);
		tv = db.query(sql);
		return tv;
	}
}

