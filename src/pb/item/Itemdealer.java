package pb.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.TableValues;

public class Itemdealer {
	DB db = new DB();
	public TableValues query(String tablename) {
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		return tv;
		
	}
	public TableValues query (String tablename,String Pkey )
	{
		TableValues tv = null;
		String sql ="select * from "+tablename +" where itemid = '"+Pkey+"'" ;
		tv = db.query(sql);
		return tv;
		
	}
	public boolean insert (Map<String, Object> data) {
		TableValues tv = null;
		boolean ok = true;
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
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
	public void delete(String itemid){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("itemid",itemid);
		list.add(map);
		db.tableDelete("item",list );
		db.closeDatabase();
		System.out.println(itemid +"已删除");
	}
	public boolean update (String itemid ,String itemname,int qty, double price,String thitypeid,String imgurl){
		String sql ="update item set itemname = '"+ itemname +"',qty = '"+ qty +"',price = '"+ price+"',thitypeid = '"+ thitypeid+"',imgurl = '"+ imgurl+ "' where itemid = '" +itemid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
	}
	public boolean update (String itemid ,String qty){
		String sql = "update item set qty = qty +'"+qty +"' where itemid = '"+itemid+"'";
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
	}
	public TableValues queryattg(String itemid){
		String sql ="select T1.attid,T1.attrigid,T2.attrigname from (select attid,attrigid,item.itemid from item inner join item_att on item_att.itemid =item.itemid where item.itemid ='"+itemid+"' ) T1 inner join  attg  T2 on T1.attrigid =T2.attrigid ";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		return tv;
		
	}
	public TableValues queryatt(String itemid){
		String sql ="select  * from( select distinct attid from item inner join item_att on item.itemid =item_att.itemid where item.itemid ='"+itemid+"')T1 inner join attribute T2 on T1.attid = T2.attid";
		TableValues tv = db.query(sql);
		return tv;
		
	}
}
