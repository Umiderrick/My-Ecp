package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Sectypedealer {
	DB db =new DB();
	public boolean insert (String firtypeid ,String sectypeid, String sectypename) {
			TableValues tv = null;
			boolean ok = true;
			try {
				List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("firtypeid", firtypeid);
				data.put("sectypeid", sectypeid);
				data.put("sectypename",sectypename);
				dataList.add(data);
				String sql ="select * from sectype  where sectypeid = '" + sectypeid +"'";
				tv=db.query(sql);
				if(tv.isEmpty()) {
					db.tableInsert("sectype", dataList);
					ok =true;
					System.out.println("插入第二类别成功");
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
	public boolean update (String sectypeid, String sectypename){
		String sql ="update sectype set sectypename = '"+ sectypename +"' where sectypeid = '" +sectypeid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
		
	}
	public void delete(String sectypeid){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("sectypeid",sectypeid);
		list.add(map);
		db.tableDelete("sectype",list );
		db.closeDatabase();
		System.out.println(sectypeid +"已删除");
	}
	public TableValues query(String tablename) {
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		return tv;
		
	}
	public TableValues query(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="select * from "+tablename +" where sectypeid = '"+PKey+"'" ;
		System.out.println(sql);
		tv = db.query(sql);
		return tv;
				
	}
	}

