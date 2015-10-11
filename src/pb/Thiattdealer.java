package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.DataColumn;
import pb.db.TableValues;

public class Thiattdealer {

	public TableValues query(String tablename) {
		DB db = new DB();
		TableValues tv = null;
		String sql ="select * from "+tablename ;
		tv = db.query(sql);
		return tv;
	}
	public boolean insert (String attid ,String thitypeid) {
		DB db = new DB();
		TableValues tv = null;
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("attid", attid);
			data.put("thitypeid", thitypeid);
			dataList.add(data);
			db.tableInsert("thi_att", dataList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
	
	
public void delete(String thitypeid,String attid)
{	DB db =new DB();
	String sql ="select taid from thi_att where thitypeid = '"+thitypeid+"' and attid ='"+attid +"'"; 
	TableValues tv =db.query(sql);
	DataColumn[] dcl=tv.getDataColumns();
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	for(int i=0;i<tv.getValues().length;i++)
	{
		for(int j=0 ;j<tv.getDataColumns().length;j++)
		{		Map<String,Object> map =new HashMap<String,Object>();
				int value = Integer.valueOf(tv.getValues()[i][j].toString()).intValue();
				map.put("taid",value);
				list.add(map);
		}
	}
	db.tableDelete("thi_att",list );
	db.closeDatabase();
}

}
