package pb;

import pb.db.DB;
import pb.db.TableValues;

public class Searchdealer {
	DB db =new DB();
	public TableValues indexsearch (String pattern) {
		String sql ="select * from item where itemname like '%"+pattern+"%'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
		}
	public TableValues thitypesearch (String thitypeid){
		String sql ="select * from item where thitypeid = '"+thitypeid+"'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public TableValues listsearch(int top,String thitypeid){
		String sql ="select TOP "+ top +" * from item where thitypeid = '"+thitypeid+"'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}

}
