package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.ConnectionManager;

public class SelectAddTranIDDAO {
	static Connection Con = null;
	static ResultSet rs = null;
	
	public int AddSelectTranID(int[] code,int user) {

		// int delResult = 0;

		int i = 0;
		while (i < code.length) {
			System.out.print("code มาล่ะ" + code[i]);
			i++;
		}

		String sql = " INSERT INTO `users_tranid`(`Id_User`, `Id_TranID`) VALUES ( ?,? );   ";
		PreparedStatement pstmt = null;
		Con = ConnectionManager.getConnection();
		try {

			for (int j = 0; j < code.length; j++) {

				pstmt = Con.prepareStatement(sql);

				pstmt.setInt(1, code[j]);
				pstmt.setInt(1, user);
				pstmt.executeUpdate();

			}

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
