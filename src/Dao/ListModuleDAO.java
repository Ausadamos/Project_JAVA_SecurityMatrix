package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListModuleBean;

import Connect.ConnectionManager;

public class ListModuleDAO {
	static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<ListModuleBean> ListTranID() {
	PreparedStatement pstmt = null;

	ArrayList<ListModuleBean> Ab = new ArrayList<ListModuleBean>();
	String sql = " SELECT `IdModule`, `NameModule` FROM `module` ORDER BY module.NameModule ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListModuleBean module = new ListModuleBean();
			
			module.setIdModule(rs.getInt("IdModule"));
			module.setNameModule(rs.getString("NameModule"));
		
			

			Ab.add(module);

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
