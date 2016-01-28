package pb.salorder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pb.db.DB;
import pb.db.DataColumn;
import pb.db.TableValues;
import pb.item.Itemdealer;

public class Salorderdealer {
	DB db =new DB();
	public String insert (String username,String[] itemid,String[] num,String attrigid,String phone,String address,double total) {
		for(int i =0;i<itemid.length;i++){
		try {
			List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
			Map<String, Object> data = new HashMap<String, Object>();
			String nitemid =itemid[i].substring(1, itemid[i].length()-1);
			int nnum =Integer.parseInt(num[i].substring(1, num[i].length()-1));
			Itemdealer itd =new Itemdealer();
			TableValues tv =itd.query("item", nitemid);
			DataColumn[] dcl=tv.getDataColumns();
			int v =0;
			for(int m=0;m<tv.getValues().length;m++)
			{
				for(int j=0 ;j<tv.getDataColumns().length;j++)
				{
					String key =dcl[j].getName();
					if(key.equals("qty")){
					String value =tv.getValues()[m][j].toString();
					v =Integer.parseInt(value); 
					}
				}
			}
			int nv = v-nnum;
			StringBuffer sb = new StringBuffer();
			sb.append(username);
			sb.append(nitemid);
			data.put("salorderid", sb.toString());
			data.put("username", username);
			data.put("itemid", nitemid);
			data.put("attrigid", attrigid);
			data.put("phone", phone);
			data.put("num", nnum);
			data.put("address", address);
			data.put("total", total);
			dataList.add(data);
			String sql ="UPDATE item SET qty='"+nv+"' WHERE itemid ='"+nitemid+"'";
			System.out.println(sql);
			db.executeUpdate(sql);
			System.out.println("商品余量已更新");
			db.tableInsert("salorder", dataList);
			System.out.println("订单录入成功");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeDatabase();
		}
		}
		return null;
		
	}
	public boolean update (String itemid,String username,int num,String address,String attrigid){
		try {
			String sql ="update salorder set num ='"+num +"',address ='"+address+"' ,attrigid = '"+attrigid+"' where (itemid ='"+itemid+"' and username ='"+username+"')";
			System.out.println(sql);
			db.executeUpdate(sql);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
		db.closeDatabase();
		}
	}
	public void delete(String salorderid,String num){	
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =new HashMap<String,Object>();
		String sql ="select _id from salorder where salorderid ='"+salorderid+"' and num ='"+num+"'";
		TableValues tv = db.query(sql);
		if(tv.isEmpty()){
			System.out.println("未查询到订单");
		}else{
			String _id = tv.getValues()[0][0].toString();
			int pk =Integer.parseInt(_id);
		map.put("_id",pk);
		list.add(map);
		db.tableDelete("salorder",list );
		db.closeDatabase();
		System.out.println("订单" +salorderid +"已删除");
		}
	}
	public TableValues query(String tablename) {
		TableValues tv = null;
		String sql ="select * from "+tablename;
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public TableValues userquery(String username) {
		TableValues tv = null;
		String sql ="select * from salorder where username = '"+username+"'";
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public TableValues query(String tablename,String PKey) {
		TableValues tv = null;
		String sql ="select * from "+tablename +" where salorderid = '"+PKey+"'" ;
		tv = db.query(sql);
		db.closeDatabase();
		return tv;
			
	}
}
