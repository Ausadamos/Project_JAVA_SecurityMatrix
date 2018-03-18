package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddTranID_ForProfile_DAO;

/**
 * Servlet implementation class AddTranID_ForProfile_Servlet_Page2
 */
@WebServlet("/AddTranID_ForProfile_Servlet_Page2")
public class AddTranID_ForProfile_Servlet_Page2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTranID_ForProfile_Servlet_Page2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	   //แก้ user ไหน
		String IdUser = request.getParameter("IdUser");
		String nameUser = request.getParameter("nameUser");
		
		
		
		String NameProfile = request.getParameter("NameProfile");
		
		
		String 	NameUserLog = request.getParameter("NameUserLog");
		//เก็บ module
		String ModuleID[] = request.getParameterValues("id3[]");
		
		//เก็บtranid ที่เลือก
		String TranID[] = request.getParameterValues("TranID[]");
		
		String getId_Company = request.getParameter("getId_Company");
		
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		
		
		int[] TranID33 = null;
		
		if(TranID != null){
			 TranID33 = new int[TranID.length];
		}
		
		int[] ModuleID33 = new int[ModuleID.length];
		
		//----------------------------------------------------------
		if(TranID != null){
	
		
		for(int j = 0;j < TranID.length;j++)
		{
		   
			TranID33[j] = Integer.parseInt(TranID[j]);
		}
		}
		//----------------------------------------------------------
		if(ModuleID != null){
		
			
			for(int j = 0;j < ModuleID.length;j++)
			{
			   
				ModuleID33[j] = Integer.parseInt(ModuleID[j]);
			}
			
		}
			//----------------------------------------------------------	
			
		
		
	    AddTranID_ForProfile_DAO  addTranID_ForProfile_DAO = new  AddTranID_ForProfile_DAO();

	    int i2 = addTranID_ForProfile_DAO.EditTranIDForProfile_2(ModuleID33,Integer.parseInt(IdUser),TranID33,NameUserLog,NameProfile , Integer.parseInt(getId_Company),Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
			    
		
        if(i2 == 1){
        	
    		
    	
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
			
			
			
			request.setAttribute("listoo2",ModuleID);
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			
			String status = "1";
			
			
			request.setAttribute("statusAddTran",status);
			
			dispatcher.forward(request, response);
			
			
			
		}else if(i2 == 0){
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
		
			request.setAttribute("listoo2",ModuleID);
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			String status = "1";
			request.setAttribute("statusAddTran",status);
			
			
			dispatcher.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
