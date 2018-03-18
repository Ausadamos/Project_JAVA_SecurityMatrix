package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UpdateProfileBean;
import Dao.AddTranIDDAO;
import Dao.AddTranID_ForProfile_DAO;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class AddTranID_ForProfile_Servlet
 */
@WebServlet("/AddTranID_ForProfile_Servlet")
public class AddTranID_ForProfile_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTranID_ForProfile_Servlet() {
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

	
		String IdUser = request.getParameter("IdUser");
		
		
		String nameUser = request.getParameter("nameUser");
		String nameCode = request.getParameter("nameCode");
		
		
		
		
		
    AddTranID_ForProfile_DAO  addTranID_ForProfile_DAO = new  AddTranID_ForProfile_DAO();
	
    
    int i2 = addTranID_ForProfile_DAO.EditTranIDForProfile(nameUser,Integer.parseInt(IdUser),nameCode);
		    
    
    
    
    
    
              ArrayList<UpdateProfileBean> list = null;
		       
		 	  UpdateProfileDAO  updateProfile = new  UpdateProfileDAO();
		

        if(i2 == 2){
        	
    		list = updateProfile.ListAdd(nameUser);
    	
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
			request.setAttribute("list",list);
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			
			String status = "2";
			request.setAttribute("status",status);
			
			
			dispatcher.forward(request, response);
			
		}else if(i2 == 1){
			
			//" <script>alert('มี TranID ที่เลือก อยู่แล้ว');window.location='ShowDataSelect.jsp';</script>");
			
			list = updateProfile.ListAdd(nameUser);
	    	
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
			request.setAttribute("list",list);
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			String status = "1";
			request.setAttribute("status",status);
			
			
			dispatcher.forward(request, response);
		}else if(i2 == 0){
		
		//	" <script>alert('ไม่มี TranId ที่เลือก');window.location='ShowDataSelect.jsp';</script>");
		
			
			list = updateProfile.ListAdd(nameUser);
	    	
			RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
			request.setAttribute("list",list);
			
			request.setAttribute("nameUser",nameUser);
			request.setAttribute("IdUser",IdUser);
			String status = "0";
			request.setAttribute("status",status);
			request.setAttribute("name_ERROR",nameUser);
			
			dispatcher.forward(request, response);
			
			
			
			
			
		}
        
        
        
        
	}

}
