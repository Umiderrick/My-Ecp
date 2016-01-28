package pb.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pb.db.DB;
import pb.db.DataColumn;
import pb.db.TableValues;

public class Cartdealer {
	DB db = new DB();
	public TableValues cartsearch(String username) {
		TableValues tv = null;
		String sql ="select * from cart inner join item on cart.itemid =item.itemid where cart.username = '"+username+"'" ;
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public boolean insert (String itemid,int num,String username,String attrigname) {
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			String sql ="select * from cart where (itemid = '"+itemid+"' and username ='"+username+"')" ;
			TableValues tv = db.query(sql);
			if(tv.isEmpty()){
				data.put("itemid", itemid);
				data.put("num", num);
				data.put("username", username);
				data.put("attrigid", attrigname);
				dataList.add(data);
				db.tableInsert("cart", dataList);
			}else{
				DataColumn[] dcl=tv.getDataColumns();
				for(int i=0;i<tv.getValues().length;i++)
				{
					for(int j=0 ;j<tv.getDataColumns().length;j++)
					{
						String key =dcl[j].getName();
						String value =tv.getValues()[i][j].toString();
						if(key.equals("num")){
						int newnum =Integer.parseInt(value)+num;
						update(newnum,itemid);
						}
					}
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		return false;
	}
	private void update(int newnum, String itemid) {
		String sql ="update cart set num = '"+newnum +"'  where itemid = '"+itemid+"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
	}
	public TableValues cartidsearch(String itemid,int num) {
		TableValues tv = null;
		String sql ="select cartid from cart where( itemid = '"+itemid+"' and num ='"+num+"')" ;
		System.out.println(sql);
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public boolean delete (String[] itemid,String[] num){
		for(int l=0;l<itemid.length;l++){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		String nitemid =itemid[l].substring(1, itemid[l].length()-1);
		int nnum =Integer.parseInt(num[l].substring(1, num[l].length()-1));
		TableValues tv= cartidsearch(nitemid, nnum);
		DataColumn[] dcl=tv.getDataColumns();
		for(int i=0;i<tv.getValues().length;i++)
		{
				for(int j=0 ;j<tv.getDataColumns().length;j++)
					{
						String key =dcl[j].getName();
						String value =tv.getValues()[i][j].toString();
						if(key .equals("cartid")){
						int cartid =Integer.parseInt(value);
						map.put("cartid",cartid);
						}
					}
		}
		list.add(map);
		db.tableDelete("cart",list );
		}
		db.closeDatabase();
		return true;
		
	} 
	public boolean update (int num, double total ,String itemid){
		String sql ="update cart set num = '"+num+"' ,total = '" +total +"'  where itemid = '"+itemid+"'" ;
		System.out.println(sql);
		db.executeUpdate(sql);
		return true;
	}
	public boolean delete(String itemid, String username) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		String sql ="select cartid from cart where( itemid = '"+itemid+"' and username ='"+username+"')" ;
		TableValues tv =db.query(sql);
		DataColumn[] dcl=tv.getDataColumns();
		for(int i=0;i<tv.getValues().length;i++)
		{
				for(int j=0 ;j<tv.getDataColumns().length;j++)
					{
						String key =dcl[j].getName();
						String value =tv.getValues()[i][j].toString();
						if(key .equals("cartid")){
						int cartid =Integer.parseInt(value);
						map.put("cartid",cartid);
						}
					}
		}
		list.add(map);
		db.tableDelete("cart", list);
		db.closeDatabase();
		System.out.println(itemid + "ÒÑÉ¾³ý");
		return true;
	}
}
