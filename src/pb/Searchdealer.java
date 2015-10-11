package pb;

import pb.db.DB;
import pb.db.TableValues;

public class Searchdealer {
	public TableValues indexsearch (String pattern) {
		DB db =new DB();
		String sql ="select * from item where itemname like '%"+pattern+"%'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
		}
	public TableValues thitypesearch (String thitypeid)
	{
		DB db =new DB();
		String sql ="select * from item where thitypeid = '"+thitypeid+"'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}
	public TableValues listsearch(int top,String thitypeid)
	{
		DB db =new DB();
		String sql ="select TOP "+ top +" * from item where thitypeid = '"+thitypeid+"'";
		System.out.println(sql);
		TableValues tv = db.query(sql);
		db.closeDatabase();
		return tv;
	}

}
