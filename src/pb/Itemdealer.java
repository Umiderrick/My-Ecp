package pb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Itemdealer {
	public TableValues query(String tablename) {
		DB db = new DB();
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		return tv;
		
	}
	public TableValues query (String tablename,String Pkey )
	{
		DB db = new DB();
		TableValues tv = null;
		String sql ="select * from "+tablename +" where itemid = '"+Pkey+"'" ;
		System.out.println(sql);
		tv = db.query(sql);
		return tv;
		
	}
	public boolean insert (Map<String, Object> data) {
		DB db = new DB();
		TableValues tv = null;
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
//			Map<String, Object> data = new HashMap<String, Object>();
//			data.put("itemid", itemid);
//			data.put("itemname", itemname);
//			data.put("qty", qty);
//			data.put("price", price);
//			data.put("thitypeid", thitypeid);
//			data.put("imgurl", imgurl);
			dataList.add(data);
			String itemid =(String) data.get("itemid");
			String sql ="select * from item where itemid = '" + itemid +"'";
			tv=db.query(sql);
			if(tv.isEmpty()) {
				db.tableInsert("item", dataList);
				ok =true;
				System.out.println("插入商品成功");
				}else
				{
						ok =false;
						System.out.println("商品主键已存在");
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return ok;
	}
	public void delete(String itemid)
	{	DB db =new DB();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("itemid",itemid);
		list.add(map);
		db.tableDelete("item",list );
		db.closeDatabase();
		System.out.println(itemid +"已删除");
	}
	public boolean update (String itemid ,String itemname,int qty, double price,String thitypeid,String imgurl)
	{
		DB db =new DB();
		String sql ="update item set itemname = '"+ itemname +"',qty = '"+ qty +"',price = '"+ price+"',thitypeid = '"+ thitypeid+"',imgurl = '"+ imgurl+ "' where itemid = '" +itemid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
		
	}
	
}
