package pb;

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
				System.out.println("������Ʒ�ɹ�");
				}else
				{
						ok =false;
						System.out.println("��Ʒ�����Ѵ���");
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
		System.out.println(itemid +"��ɾ��");
	}
	public boolean update (String itemid ,String itemname,int qty, double price,String thitypeid,String imgurl){
		String sql ="update item set itemname = '"+ itemname +"',qty = '"+ qty +"',price = '"+ price+"',thitypeid = '"+ thitypeid+"',imgurl = '"+ imgurl+ "' where itemid = '" +itemid +"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
	}
}
