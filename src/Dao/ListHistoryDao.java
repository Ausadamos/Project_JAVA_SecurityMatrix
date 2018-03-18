package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import Bean.ListHistoryBean;
import Bean.ListHistoryDateBean;
import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class ListHistoryDao {

	static Connection Con = null;
	static ResultSet rs = null;
	
	
	
	

	

public ArrayList<ListHistoryBean> SearchHistory(String Profile,String dateIn,String dateOut,int Function[],String UserLogin,int ID_COMPANY ) {
	PreparedStatement pstmt = null;

	ArrayList<ListHistoryBean> Ab = new ArrayList<ListHistoryBean>();
	
	
	String sql = " SELECT `IdHistory`, `NewNameTranID`, `NewNameModule`, `OldNameTranID`, `OldNameModule`, `NewUserLogin`, `OldUserLogin`, `NewUserProfile`, `OldUserProfile`, `UserLoginTodo`, `Note`, `DateTime`, typehistory.IdTypeHistory,typehistory.NameTypeHistory,history.NewPasswordUserLogin,history.NamePersonnel,history.Id_Company  FROM `history` , typehistory WHERE history.IdTypeHistory = typehistory.IdTypeHistory ";
	
	
	try {
		Con = ConnectionManager.getConnection();
		
		
		

       if(!UserLogin.equals("")){
			
			
			sql +=	 " AND ( history.NewUserLogin  = ?  OR history.OldUserLogin  = ? OR history.UserLoginTodo  = ? ) ";
			System.out.println("‡¢È“UserLogin");
		}

		
		if(!Profile.equals("")){
			
			
			sql +=	 " and ( history.NewUserProfile = ? OR history.OldUserProfile = ? ) ";
			System.out.println("‡¢È“ Profile");
		}
		
		
		//int min = Arrays.stream(tab).min().getAsInt();
		
      
		
		if(Function != null){
			
			  int max = Arrays.stream(Function).max().getAsInt();
			  
			sql +=	 " AND  ( ";
		
			for (int j = 0; j < Function.length; j++) {
				
				
		
			
				
				
				if(Function[j] == max){
					
					sql +=	 " history.IdTypeHistory =  ? ";
					//System.out.println(sql);
				}else{
					
					sql +=	 " history.IdTypeHistory =  ? OR ";
					//System.out.println(sql);
					
				}
				
				
			
				
			}
			
			sql +=	 " ) ";
			
			
			
			
			System.out.println("‡¢È“ Function");
		
			
			
			
		}

		
		
		
		
		if (!dateIn.equals("")) {
			if (!dateOut.equals("")) {
				sql += " AND DATE(history.DateTime) BETWEEN ? and ?";
				System.out.println("‡¢È“date1 ∫’∑«’π" + dateIn);
				
				
			} else if (dateOut.equals("")){
				sql += " AND DATE(history.DateTime) = ?";
				System.out.println("‡¢È“date1 No btween" + dateIn);
			
				
				
			}
		}
		sql += " AND history.Id_Company = ? ORDER BY history.DateTime ";
		//-------------------------------------------------
		pstmt = Con.prepareStatement(sql);
		
        
		int i = 1;
	
	       if(!UserLogin.equals("")){
				
				pstmt.setString(i++,UserLogin);
				pstmt.setString(i++,UserLogin);
				pstmt.setString(i++,UserLogin);
				System.out.println("‡¢È“UserLogin");
			
				
				
				
			}
		

			if(!Profile.equals("")){
				
			
				pstmt.setString(i++,Profile);
				pstmt.setString(i++,Profile);
				
				System.out.println("‡¢È“Profile");
				
				
				
			}
			
			if(Function != null){
			
				
				
			
				System.out.println("‡¢È“Function");
				for (int j = 0; j < Function.length; j++) {
					
					
					
					
					
					
				//	if(Function[j] == max){
						
						pstmt.setInt(i++,Function[j]);
						//sql +=	 " AND history.IdTypeHistory =  ? ";
						
				//	}else{
				//		pstmt.setInt(i++,Function);
						//sql +=	 " AND history.IdTypeHistory =  ? OR ";
						
						
				//	}
					
					
				
					
				}
				
				
			}

			if (!dateIn.equals("")) {
				if (!dateOut.equals("")) {
					
					pstmt.setString(i++,dateIn);
					pstmt.setString(i++,dateOut);
					
					
					
				} else if (dateOut.equals("")){
				
					pstmt.setString(i++,dateIn);
					
			
					
					
				}
			}
			
			pstmt.setInt(i++,ID_COMPANY);
			
		rs = pstmt.executeQuery();

		
		
		
		//String S = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(myTimestamp);
		
		while (rs.next()) {
			ListHistoryBean tranID = new ListHistoryBean();
			
			String S = null;
			
			S = new SimpleDateFormat("dd-MM-yyyy").format(rs.getTimestamp("DateTime"));
			
String S2 = null;
			
			S2 = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("DateTime"));
			
			tranID.setDateTime(rs.getTimestamp("DateTime"));
			
			tranID.setDate2(S);
			tranID.setTime2(S2);
			
			tranID.setNewNameModule(rs.getString("NewNameModule"));
			tranID.setNewNameTranID(rs.getString("NewNameTranID"));
			
			tranID.setNewUserLogin(rs.getString("NewUserLogin"));
			tranID.setNewUserProfile(rs.getString("NewUserProfile"));
			
			tranID.setIdHistory(rs.getInt("IdHistory"));
			tranID.setIdTypeHistory(rs.getInt("IdTypeHistory"));
			tranID.setNote(rs.getString("Note"));
			tranID.setNameTypeHistory(rs.getString("NameTypeHistory"));
			tranID.setOldNameModule(rs.getString("OldNameModule"));
			tranID.setOldNameTranID(rs.getString("OldNameTranID"));
			tranID.setOldUserLogin(rs.getString("OldUserLogin"));
			tranID.setOldUserProfile(rs.getString("OldUserProfile"));

			tranID.setUserLoginTodo(rs.getString("UserLoginTodo"));
		
			tranID.setNewPasswordUserLogin(rs.getString("NewPasswordUserLogin"));
			
			tranID.setNamePersonnel(rs.getString("NamePersonnel"));
			
			tranID.setId_Company(rs.getString("Id_Company"));
			
			
			Ab.add(tranID);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	

public ArrayList<ListHistoryDateBean> SearchHistoryForGetDate(String Profile,String dateIn,String dateOut,int Function[],String UserLogin,int ID_COMPANY) {
	PreparedStatement pstmt = null;

	ArrayList<ListHistoryDateBean> Ab = new ArrayList<ListHistoryDateBean>();
	
	
	String sql = " SELECT `DateTime` FROM `history` , typehistory WHERE history.IdTypeHistory = typehistory.IdTypeHistory ";
	
	
	try {
		Con = ConnectionManager.getConnection(); 
		
		
		

       if(!UserLogin.equals("") ){
			
			
			sql +=	 " AND ( history.NewUserLogin  = ?  OR history.OldUserLogin  = ? OR history.UserLoginTodo  = ? ) ";
			System.out.println("‡¢È“UserLogin");
		}
		

		if(!Profile.equals("")){
			
			
			sql +=	 " and ( history.NewUserProfile = ? OR history.OldUserProfile = ? ) ";
			System.out.println("‡¢È“ Profile");
		}
		
		
		//int min = Arrays.stream(tab).min().getAsInt();
		
      
		
		if(Function != null){
			
			  int max = Arrays.stream(Function).max().getAsInt();
			  
			sql +=	 " AND  ( ";
		
			for (int j = 0; j < Function.length; j++) {
				
				
		
			
				
				
				if(Function[j] == max){
					
					sql +=	 " history.IdTypeHistory =  ? ";
					//System.out.println(sql);
				}else{
					
					sql +=	 " history.IdTypeHistory =  ? OR ";
					//System.out.println(sql);
					
				}
				
				
			
				
			}
			
			sql +=	 " ) ";
			
			
			
			
			System.out.println("‡¢È“ Function");
		
			
			
			
		}

		
		
		
		
		if (!dateIn.equals("")) {
			if (!dateOut.equals("")) {
				sql += " AND DATE(history.DateTime) BETWEEN ? and ?";
				System.out.println("‡¢È“date1 ∫’∑«’π" + dateIn);
				
				
			} else if (dateOut.equals("")){
				sql += " AND DATE(history.DateTime) = ?";
				System.out.println("‡¢È“date1 No btween" + dateIn);
			
				
				
			}
		}
		
		sql += "AND history.Id_Company = ? GROUP BY DATE (DateTime) ORDER BY DATE (DateTime) ";
		//-------------------------------------------------
		pstmt = Con.prepareStatement(sql);
		
        
		int i = 1;
	
	       if(!UserLogin.equals("")){
				
				pstmt.setString(i++,UserLogin);
				pstmt.setString(i++,UserLogin);
				pstmt.setString(i++,UserLogin);
				System.out.println("‡¢È“UserLogin");
			
				
				
				
			}
		

			if(!Profile.equals("")){
				
			
				pstmt.setString(i++,Profile);
				pstmt.setString(i++,Profile);
				
				System.out.println("‡¢È“Profile");
				
				
				
			}
			
			if(Function != null){
			
				
				
			
				System.out.println("‡¢È“Function");
				for (int j = 0; j < Function.length; j++) {
					
					
					
					
					
					
				//	if(Function[j] == max){
						
						pstmt.setInt(i++,Function[j]);
						//sql +=	 " AND history.IdTypeHistory =  ? ";
						
				//	}else{
				//		pstmt.setInt(i++,Function);
						//sql +=	 " AND history.IdTypeHistory =  ? OR ";
						
						
				//	}
					
					
				
					
				}
				
				
			}

			if (!dateIn.equals("")) {
				if (!dateOut.equals("")) {
					
					pstmt.setString(i++,dateIn);
					pstmt.setString(i++,dateOut);
					
					
					
				} else if (dateOut.equals("")){
				
					pstmt.setString(i++,dateIn);
					
			
					
					
				}
			}
			pstmt.setInt(i++,ID_COMPANY);
		
		rs = pstmt.executeQuery();

		
		
		
		//String S = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(myTimestamp);
		
		while (rs.next()) {
			ListHistoryDateBean tranID = new ListHistoryDateBean();
			
			String S = null;
			
			S = new SimpleDateFormat("dd-MM-yyyy").format(rs.getTimestamp("DateTime"));
			
          String S2 = null;
			
			S2 = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("DateTime"));
			
			tranID.setDateTime(rs.getTimestamp("DateTime"));
			
			tranID.setDate2(S);
			tranID.setTime2(S2);
			
			

			
			Ab.add(tranID);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}

public ArrayList<ListHistoryBean> SearchHistoryAllData(int ID_COMPANY) {
	PreparedStatement pstmt = null;

	ArrayList<ListHistoryBean> Ab = new ArrayList<ListHistoryBean>();
	
	
	String sql = " SELECT `IdHistory`, `NewNameTranID`, `NewNameModule`, `OldNameTranID`, `OldNameModule`, `NewUserLogin`, `OldUserLogin`, `NewUserProfile`, `OldUserProfile`, `UserLoginTodo`, `Note`, `DateTime`, typehistory.IdTypeHistory,typehistory.NameTypeHistory,history.NewPasswordUserLogin,history.NamePersonnel,history.Id_Company  FROM `history` , typehistory WHERE history.IdTypeHistory = typehistory.IdTypeHistory  AND history.Id_Company = ? ORDER BY DateTime";
	
	
	try {
		Con = ConnectionManager.getConnection();
		
		
		
		pstmt = Con.prepareStatement(sql);
		pstmt.setInt(1,ID_COMPANY);
		rs = pstmt.executeQuery();

		
		
		
		
		while (rs.next()) {
			ListHistoryBean tranID = new ListHistoryBean();
			
			String S = null;
			
			S = new SimpleDateFormat("dd-MM-yyyy").format(rs.getTimestamp("DateTime"));
			
String S2 = null;
			
			S2 = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("DateTime"));
			
			tranID.setDateTime(rs.getTimestamp("DateTime"));
			
			tranID.setDate2(S);
			tranID.setTime2(S2);
			
			tranID.setNewNameModule(rs.getString("NewNameModule"));
			tranID.setNewNameTranID(rs.getString("NewNameTranID"));
			
			tranID.setNewUserLogin(rs.getString("NewUserLogin"));
			tranID.setNewUserProfile(rs.getString("NewUserProfile"));
			
			tranID.setIdHistory(rs.getInt("IdHistory"));
			tranID.setIdTypeHistory(rs.getInt("IdTypeHistory"));
			tranID.setNote(rs.getString("Note"));
			tranID.setNameTypeHistory(rs.getString("NameTypeHistory"));
			tranID.setOldNameModule(rs.getString("OldNameModule"));
			tranID.setOldNameTranID(rs.getString("OldNameTranID"));
			tranID.setOldUserLogin(rs.getString("OldUserLogin"));
			tranID.setOldUserProfile(rs.getString("OldUserProfile"));

			tranID.setUserLoginTodo(rs.getString("UserLoginTodo"));
			tranID.setNewPasswordUserLogin(rs.getString("NewPasswordUserLogin"));

	tranID.setNamePersonnel(rs.getString("NamePersonnel"));
			
			tranID.setId_Company(rs.getString("Id_Company"));
			
			
			Ab.add(tranID);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	


}
