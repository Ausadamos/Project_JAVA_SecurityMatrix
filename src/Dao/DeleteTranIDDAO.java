package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class DeleteTranIDDAO {


	static Connection Con = null;
	static ResultSet rs = null;
	
	
	
	
	
	
	
	
	
	
	
	public int DeleteTranIDSelect(int[] code,String NameUserLog,int getId_Company  ,String getNamePersonal) {

		
		
		int i = 0;
	//	String selectname = null;
		
		String sqlSelect = " SELECT module.NameModule ,tranid.Code FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdTranID =  ?  ";
		
		
		String sql = " DELETE FROM `tranid` WHERE tranid.IdTranID = ?  ";
		
		String sql3 = " INSERT INTO `history`(`OldNameTranID`,`OldNameModule`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,3,?,?)";

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		
	//	ListTranIDBean tranID = null;
		Con = ConnectionManager.getConnection();
		try {

			for (int j = 0; j < code.length; j++) {

				//rs = null;
				
				ListTranIDBean tranID = null;
				//----------ค้นหา---------------
				
				pstmt = Con.prepareStatement(sqlSelect);
				
				pstmt.setInt(1,code[j]);
				
				rs =null;
				
				rs = pstmt.executeQuery();
	
			
				tranID = new ListTranIDBean();
			
				if (rs.next()) {
				tranID.setNameModule(rs.getString("NameModule"));
				tranID.setCode(rs.getString("Code"));
				}else{
					 System.out.println("ไม่มี ข้อมูล Tran");
				}
				
				//---------ลงlog------------------
				
				 pstmt2 = Con.prepareStatement(sql3);

				
				 pstmt2.setString(1,tranID.getCode());
				 pstmt2.setString(2,tranID.getNameModule());
				 pstmt2.setString(3,NameUserLog);
				 pstmt2.setString(4,getNamePersonal);
				 pstmt2.setInt(5,getId_Company);	
			
				 
				 pstmt2.executeUpdate();
				 
				 
			
				
				//-----------ลบ-----------------
				pstmt3 = Con.prepareStatement(sql);
				pstmt3.setInt(1,code[j]);
				pstmt3.executeUpdate();

				
				
		
				
				
				
			}

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
