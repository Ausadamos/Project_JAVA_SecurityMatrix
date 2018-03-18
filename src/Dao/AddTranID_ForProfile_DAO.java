package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class AddTranID_ForProfile_DAO {

	
	

	static Connection Con = null;
	static ResultSet rs = null;
	
	public int EditTranIDForProfile(String nameUser,int IdUser ,String nameCode) {
		
		
		int addResult = 0;
		PreparedStatement pstmt = null;
		
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		
		String sql = " SELECT `IdTranID`, `Code`, `Detail` FROM `tranid` WHERE tranid.Code = ? ;";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,nameCode);
		
			rs = pstmt.executeQuery();
			
			boolean test = rs.next();
			
		
		
			if (test) {
				System.out.println("มี code ที่เลือกในระบบ");
				//bean.setValid(false);
				int a = 0;
				
				
				
					
					 a = rs.getInt("IdTranID");
				String b = rs.getString("Code");
				String c =  rs.getString("Detail");
					

				System.out.print("a ====== "+a);

				
				
				
				String sql2 = " SELECT `ID_Users_TranID`, `Id_User`, `Id_TranID` FROM `users_tranid`,users,tranid WHERE users_tranid.Id_User = users.IdUser AND users_tranid.Id_TranID = tranid.IdTranID AND tranid.Code = ? AND users.IdUser = ? ;";
				
				Con = ConnectionManager.getConnection();
				pstmt = Con.prepareStatement(sql2);
				
				pstmt.setString(1,nameCode);
				pstmt.setInt(2,IdUser);
				rs = pstmt.executeQuery();
				
				boolean test2 = rs.next();
				

							if (test2) {
				
								System.out.println("มี code ที่เลือก อยู่แล้ว");
								
								addResult = 1;
								
							}else{
								
								String sql3 = " INSERT INTO `users_tranid`(`Id_User`, `Id_TranID`) VALUES ( ? , ? ) ;";
								
								
							

								try {
									Con = ConnectionManager.getConnection();

									PreparedStatement ps = Con.prepareStatement(sql3);

								
									
					
									System.out.print("IdUser"+IdUser);
									
									ps.setInt(1,IdUser);
									
									ps.setInt(2,a);
									addResult = ps.executeUpdate();
								
									
								
									ps.close();
									Con.close();
									
									addResult = 2;
									
								} catch (SQLException e) {
									e.printStackTrace();
								}

								
								
								
								
								
								
								
								
								
								
								
								
								
							}
				
							
				
			}
			
			else if (!test) {
				System.out.println("ไม่มีโค้ดที่เลือก");

				addResult = 0;

	

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return addResult;
	}
		//-----------------
		
	
	
public int EditTranIDForProfile_2(int[] ModuleID,int IdUser ,int[] TranID33,String NameUserLog,String NameProfile , int getId_Company,int getId_CompanyUserLogin  ,String getNamePersonal) {
		

		String sql = " DELETE FROM `users_tranid` WHERE users_tranid.Id_User = ? AND users_tranid.Id_TranID in (SELECT `IdTranID` FROM `tranid` WHERE tranid.IdModule = ? )";
		
		String sqlQ = " SELECT module.NameModule,tranid.Code,tranid.IdTranID FROM `users_tranid`,module,tranid WHERE users_tranid.Id_TranID = tranid.IdTranID AND tranid.IdModule = module.IdModule AND users_tranid.Id_User = ?";

		String sqlQC = " SELECT COUNT(tranid.IdTranID) AS COUNTTranID FROM `users_tranid`,module,tranid WHERE users_tranid.Id_TranID = tranid.IdTranID AND tranid.IdModule = module.IdModule AND users_tranid.Id_User =  ?";

		String sqlAddTranIDLog = " INSERT INTO `history`(`NewNameTranID`,`NewNameModule`,`UserLoginTodo`,`OldUserProfile`,`Note` ,`IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,?,'AddTranID',7,?,?	)";
		String sqlDelTranIDLog = " INSERT INTO `history`(`OldNameTranID`,`OldNameModule`,`UserLoginTodo`, `OldUserProfile`,`Note`,`IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,?,'DeleteTranID',7,?,?	)";

		String sqlSelect = " SELECT module.NameModule ,tranid.Code FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdTranID =  ?  ";

		
		int i = 0;
		
	
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		Con = ConnectionManager.getConnection();
		try {
			
			
			    pstmt3 = Con.prepareStatement(sqlQC);
				
				pstmt3.setInt(1,IdUser);
			
				rs = pstmt3.executeQuery();
				
				int countOld = 0;
				
				
				if (rs.next()) {
					countOld = rs.getInt("COUNTTranID");
					
							}
				
			
				
				
				
				 System.out.println("countOld = "+ countOld);
				 
				 String[] countOldd = new String[countOld];
				 
				 
				 
				rs = null;
				
            pstmt2 = Con.prepareStatement(sqlQ);
			
			pstmt2.setInt(1,IdUser);
		
			rs = pstmt2.executeQuery();
			
			//-------------------tranID Old------------------------------
			ListTranIDBean tranID = null;
			
			
			
			int jj = 0;
			
			while (rs.next()) {
				tranID = new ListTranIDBean();
				
				
				countOldd[jj] = Integer.toString(rs.getInt("IdTranID"));
			
				
				 System.out.println("countOldd[jj] = "+ countOldd[jj]);
				 
					jj++;
			}
			
			// List<String> list = Arrays.asList(countOldd);
			
			//   List<String> list = Arrays.asList(countOldd);

		    if(TranID33 != null){
			// อันใหม่ มีในอันเก่า ถ้าไม่มี คือ การเพิ่มเข้ามาใหม่
			for (int j = 0; j < TranID33.length; j++) {
				 
				if( Arrays.asList( countOldd ).contains( Integer.toString(TranID33[j])) ){
					System.out.println("มีอยู่แล้ว"+ TranID33[j]);
					 
					
		        }else{
		        	System.out.println("เข้าที่เพิ่มมาใหม่"+ TranID33[j]);
					//----------ค้นหา---------------
			
					pstmt2 = Con.prepareStatement(sqlSelect);
					
					pstmt2.setInt(1,TranID33[j]);
					
					rs =null;
					
					rs = pstmt2.executeQuery();
		
				
				//	tranID = new ListTranIDBean();
					String CodeNew = null;
					String NameModuleNew = null;
				//	System.out.println("เข้าหาข้อมูลแล้ว");
					if (rs.next()) {
						CodeNew =rs.getString("Code");
						NameModuleNew =rs.getString("NameModule");
						
					}else{
						 System.out.println("ไม่มี ข้อมูล Tran");
					}
					
					
					
					//-----------------ลง log---------------------
					
					 pstmt2 = Con.prepareStatement(sqlAddTranIDLog);
					 pstmt2.setString(1,CodeNew);
					 pstmt2.setString(2,NameModuleNew);
					 pstmt2.setString(3,NameUserLog);
					 pstmt2.setString(4,NameProfile);
					 pstmt2.setString(5,getNamePersonal);
					 pstmt2.setInt(6,getId_CompanyUserLogin);	
					 pstmt2.executeUpdate();
					 
					 
					 
					
		        }
				
				
				
					}
			
		    			}
			//------------------------------------------------
		    String[]  numbers = null;
			if(TranID33 != null){
				
				
	    numbers = new String[TranID33.length];
			 
			for(int j = 0;j < TranID33.length;j++)
			{
			   
			   numbers[j] = Integer.toString(TranID33[j]);
			}

					}else{
						  numbers = new String[1];
							 
						numbers[0] = "0";
						
					}
							
			
				
				
			
			
			// List<String> list2 = Arrays.asList(numbers);
			// อันเก่า มีในอันเก่า ถ้าไม่มี คือ การลบ
			
			for (int j = 0; j < countOldd.length; j++) {
				 
				if(Arrays.asList( numbers ).contains(countOldd[j])){
					System.out.println("มีอยู่แล้วในลบ"+ countOldd[j]);

					
				
				
				
					}else{
						//----------ค้นหา---------------
						System.out.println("เข้าที่ลบ"+ countOldd[j]);
						
						
						pstmt3 = Con.prepareStatement(sqlSelect);
						
						pstmt3.setInt(1,Integer.parseInt(countOldd[j]));
						
						rs =null;
						
						rs = pstmt3.executeQuery();
			
					
				
						String CodeNew = null;
						String NameModuleNew = null;
						
						if (rs.next()) {
							CodeNew =rs.getString("Code");
							NameModuleNew =rs.getString("NameModule");
							System.out.println("ของลบ เข้ามี ข้อมูล Tran");
						}else{
							 System.out.println("ไม่มี ข้อมูล Tran");
						}
						
						
						
						//-----------------ลง log---------------------
						
						 pstmt3 = Con.prepareStatement(sqlDelTranIDLog);
						 
						 System.out.println(CodeNew);
						 System.out.println(NameModuleNew);
						 System.out.println(NameUserLog);
						 System.out.println(NameProfile);
						 
						 pstmt3.setString(1,CodeNew);
						 pstmt3.setString(2,NameModuleNew);
						 pstmt3.setString(3,NameUserLog);
						 pstmt3.setString(4,NameProfile);
						 pstmt3.setString(5,getNamePersonal);
						 pstmt3.setInt(6,getId_CompanyUserLogin);	
						 pstmt3.executeUpdate();
						 
			        }
					}
			
			System.out.println("มาถึงแล้ว");
			//------------------------------------------------
				for (int j = 0; j < ModuleID.length; j++) {

					pstmt = Con.prepareStatement(sql);
					pstmt.setInt(1,IdUser);
					pstmt.setInt(2,ModuleID[j]);
					pstmt.executeUpdate();

				}

			
				
			if(TranID33 != null){
				

				String sql2 = " INSERT INTO `users_tranid`( `Id_User`, `Id_TranID`) VALUES ( ? , ? )";

				
				for (int j = 0; j < TranID33.length; j++) {

					pstmt = Con.prepareStatement(sql2);

				
					pstmt.setInt(1,IdUser);
					pstmt.setInt(2,TranID33[j]);

					pstmt.executeUpdate();

					
					
					
					
					
					
				}
				
				
				
				
				
				
			}
			
			
			
			
			
			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	
	
	
	
}
