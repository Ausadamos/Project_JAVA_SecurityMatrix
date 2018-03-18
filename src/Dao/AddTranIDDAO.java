package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.AddProfileBean;
import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class AddTranIDDAO {


	static Connection Con = null;
	static ResultSet rs = null;
	
	public int AddTranID(String name,int selectModule,String NameUserLog,int getId_Company,String getNamePersonal) {
	
	
		int addResult = 0;
		PreparedStatement pstmt = null;
		
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		
		String sql = " SELECT `IdTranID`, `Code`, `Detail` FROM `tranid` WHERE tranid.Code = ? ;";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,name);
		
			rs = pstmt.executeQuery();
			boolean test = rs.next();
			
		
		
			if (test) {
				System.out.println("Sorry, duplicate your TranID!!!! ");
				//bean.setValid(false);
				
			}
			
			else if (!test) {
				System.out.println("good");

				

	
				
				String sqlSelect = "SELECT module.NameModule FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdModule = ? GROUP BY tranid.IdModule  ";
				String sql2 = " INSERT INTO `tranid`(`Code`, `IdModule`) VALUES ( ? , ? )";
				String sql3 = " INSERT INTO `history`(`NewNameTranID`,`NewNameModule`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,1,?,?)";

				try {
					Con = ConnectionManager.getConnection();

					PreparedStatement ps = Con.prepareStatement(sql2);

				
					ps.setString(1,name);
					ps.setInt(2,selectModule);
					
					
					
					addResult = ps.executeUpdate();
				//--------------------------------
					
					
					ListTranIDBean tranID = null;
					//----------ค้นหา---------------
					
					pstmt = Con.prepareStatement(sqlSelect);
					
					pstmt.setInt(1,selectModule);
					
					rs =null;
					
					rs = pstmt.executeQuery();
		
				
					tranID = new ListTranIDBean();
				
					if (rs.next()) {
					tranID.setNameModule(rs.getString("NameModule"));
					}else{
						 System.out.println("ไม่มี ข้อมูล NameModule");
					}
					
					//-------------------------------------------------------
					PreparedStatement ps2 = Con.prepareStatement(sql3);

					
					ps2.setString(1,name);
					ps2.setString(2,tranID.getNameModule());
					ps2.setString(3,NameUserLog);
				
					ps2.setString(4,getNamePersonal);
					ps2.setInt(5,getId_Company);
					
					
					ps2.executeUpdate();
					
					
					
					ps.close();
					Con.close();
					
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				

			

				pstmt.close();
				Con.close();
				rs.close();

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		//-----------------
		
	
	
	
		
		
		return addResult;
		}
	
	
	
	
	
	
	
	
	
	
}
