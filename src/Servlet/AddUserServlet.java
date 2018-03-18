package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddTranIDDAO;
import Dao.AddUserDAO;
import Dao.ListPersonnelDAO;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
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

	    //ที่กรอก
		String name = request.getParameter("name"); //username คนที่ถูกเพิ่ม
		String 	Password = request.getParameter("Password");
		String 	browser = request.getParameter("browser"); //Personnel
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		//ที่แอบส่งมา
		String IDStatus = request.getParameter("IDStatus");
		
		String getUsername = request.getParameter("getUsername"); //มันซ้ำกันกะ  String NameUserLog
        String 	NameUserLog = request.getParameter("NameUserLog");//WhoDo
		//-----------------------------------------------------------------------
       
        
       AddUserDAO  				addUserDAO 			= new  AddUserDAO();
       ListPersonnelDAO         listPersonnelDAO 	= new  ListPersonnelDAO();
       
       int i222 = listPersonnelDAO. ListIDNTT(browser);
       
       int i2 = 0;
       
       
       
       
       
       if(i222 != 0){
         i2 = addUserDAO.AddUser(name,getUsername,Password,NameUserLog,i222,Integer.parseInt(getId_CompanyUserLogin),getNamePersonal);
         
         
         //-----------------------
         

         
        	if(i2 != 0){ //เพิ่มได้
     	
     		
     if(Integer.parseInt(IDStatus) == 1){//superAdmin
     	RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
     	String status = "1";
     	request.setAttribute("status",status);
     	dispatcher.forward(request, response);
     }else if(Integer.parseInt(IDStatus) == 2 ){//Admin
     	RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
     	String status = "1";
     	request.setAttribute("status",status);
     	dispatcher.forward(request, response);
     }
        	
     		

     		
     	}
        	
        	else{  //เพิ่มไม่ได้

     		
     		if(Integer.parseInt(IDStatus) == 1){//superAdmin
     			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
     			String status = "0";
     			request.setAttribute("status",status);
     			request.setAttribute("name_ERROR",name);
     			dispatcher.forward(request, response);
     		}else if(Integer.parseInt(IDStatus) == 2){//Admin
     			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
     			String status = "0";
     			request.setAttribute("status",status);
     			request.setAttribute("name_ERROR",name);
     			dispatcher.forward(request, response);
     		}
     		
     		   	
     	}
            
        	//----------------------
       }else{
    	   
      
       
	

       
   
       
       
       
       } //หา personal ไม่เจอ
       
		
       if(Integer.parseInt(IDStatus) == 1){ //superAdmin
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S1.jsp");
			String status = "00";
			request.setAttribute("status",status);
			request.setAttribute("name_ERROR",name);
			dispatcher.forward(request, response);
			
		}else if(Integer.parseInt(IDStatus) == 2 ){//Admin
			RequestDispatcher dispatcher = request.getRequestDispatcher("USER_S2.jsp");
			String status = "00";
			request.setAttribute("status",status);
			request.setAttribute("name_ERROR",name);
			dispatcher.forward(request, response);
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
