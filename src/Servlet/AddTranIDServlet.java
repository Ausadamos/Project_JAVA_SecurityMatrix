package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddProfileBean;
import Dao.AddProfileDAO;
import Dao.AddTranIDDAO;

/**
 * Servlet implementation class AddTranIDServlet
 */
@WebServlet("/AddTranIDServlet")
public class AddTranIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTranIDServlet() {
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

	
		String name = request.getParameter("name");
		String selectModule = request.getParameter("selectModule");

		
		String 	NameUserLog = request.getParameter("NameUserLog");
	//	System.out.println("selectModule = " + selectModule);
		
		
		String getId_Company = request.getParameter("getId_Company");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		
		if(!(selectModule.equals("Select Module"))){
			
		
		
       AddTranIDDAO  addTranIDDAO = new  AddTranIDDAO();
		
     
       int i2 = addTranIDDAO.AddTranID(name,Integer.parseInt(selectModule),NameUserLog,Integer.parseInt(getId_Company),getNamePersonal);
        
       
	

       
   
       
    
   	if(i2 != 0){
	
		

RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
		
		String status = "1";
		request.setAttribute("status",status);
		
		
		dispatcher.forward(request, response);
		
	//	response.sendRedirect("index5.jsp");
		
	}
   	
   	else{

		
RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
		
		String status = "0";
		request.setAttribute("status",status);
		
		request.setAttribute("name_ERROR",name);
		dispatcher.forward(request, response);
		
	}
       
       
	}else{
		
   		
   		RequestDispatcher dispatcher = request.getRequestDispatcher("AddTranID.jsp");
   				
   				String status = "2";
   				request.setAttribute("status",status);
   				
   				request.setAttribute("name_ERROR",name);
   				dispatcher.forward(request, response);
   		
   		
   		
   		
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
