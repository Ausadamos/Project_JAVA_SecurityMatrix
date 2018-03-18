package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class EditTranIDDAO {

	static Connection Con = null;
	static ResultSet rs = null;
	
	
	public int EditTranID(int PK_TranID,String CodeNew,int selectModule,String NameUserLog,int getId_Company  ,String getNamePersonal) {
		
		
		int addResult = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		int count2 = 0;
		String sql = " SELECT `IdTranID`, `Code` FROM `tranid` WHERE tranid.Code =  ? ;";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,CodeNew);
		
			rs = pstmt.executeQuery();
			//boolean test = rs.next();
			
	
			//	String sql2 = " INSERT INTO `tranid`(`Code`) VALUES ( ? )";
				
		
					
					while (rs.next()) {
						ListTranIDBean tranID = new ListTranIDBean();
						
					   // rs.getInt("IdTranID");
					
						
						if(rs.getInt("IdTranID") != PK_TranID ){
							// มีตัวซ้ำ
							count2 = 1;	
							System.out.print("Code ซ้ำนะ");
						}

					}
					
					pstmt.close();
					
				if(count2 == 0){
					
					String sqlSelect = " SELECT module.NameModule ,tranid.Code FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdTranID =  ?  ";
					String sqlSelect2 = " SELECT module.NameModule FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.Code =  ?  ";

					String sql2 = " UPDATE `tranid` SET `Code`= ?,`IdModule`= ?  WHERE tranid.IdTranID = ? ";
					
					String sql3 = " INSERT INTO `history`(`OldNameTranID`,`OldNameModule`,`NewNameTranID`,`NewNameModule`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,?,?,2,?,?)";

					try {
						Con = ConnectionManager.getConnection();

						//----------ค้นหา---------------
					//	ListTranIDBean tranID = null;
						
						
						pstmt2 = Con.prepareStatement(sqlSelect);
						
						pstmt2.setInt(1,PK_TranID);
						
						rs =null;
						
						rs = pstmt2.executeQuery();
			
					
					//	tranID = new ListTranIDBean();
						String detailOld_1 = null;
						String detailOld_2 = null;
						if (rs.next()) {
				 detailOld_1 =rs.getString("NameModule");
				detailOld_2 =rs.getString("Code");
						}else{
							 System.out.println("ไม่มี ข้อมูล Tran");
						}
						
						
						//---------------------------------------------------
						PreparedStatement ps = Con.prepareStatement(sql2);

					
						ps.setString(1,CodeNew);
						ps.setInt(2,selectModule);
						ps.setInt(3,PK_TranID);
						addResult = ps.executeUpdate();
					
						//-------------- ค้นชื่อ module อันใหม่ ---------------------
					
                        pstmt3 = Con.prepareStatement(sqlSelect2);
						
						pstmt3.setString(1,CodeNew);
						
						rs =null;
						
						rs = pstmt3.executeQuery();
						
						
		
						String NameModuleNew = null;
						if (rs.next()) {
							 NameModuleNew =	rs.getString("NameModule");
						}
						//-----------------ลง log---------------------
						
						 pstmt2 = Con.prepareStatement(sql3);

							
						 pstmt2.setString(1,detailOld_2);
						 pstmt2.setString(2,detailOld_1);
					
						 pstmt2.setString(3,CodeNew);
						 pstmt2.setString(4,NameModuleNew);
					
						 
						 pstmt2.setString(5,NameUserLog);
						 pstmt2.setString(6,getNamePersonal);
						 pstmt2.setInt(7,getId_Company);	
						// System.out.println("NameUserLog = " + NameUserLog);
						 
						 pstmt2.executeUpdate();
						
						
						//-------------------------------------------
						ps.close();
				
						Con.close();
						rs.close();

				
						
					
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
					
					
					
					
					
					
					
					
					
					
				}
				
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				

			

		
		
		
		//-----------------
	
	
	return count2;
	
	
	
	}
	
	
	
	
	
	
	
}
