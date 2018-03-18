package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.AddProfileBean;
import Dao.AddProfileDAO;
import Dao.SelectAddTranIDDAO;

/**
 * Servlet implementation class AddProfileServlet
 */
@WebServlet("/AddProfileServlet")
public class AddProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	
		String name = request.getParameter("name"); //profile ที่กรอกมา
	
		
		String 	id3[] = request.getParameterValues("id3[]"); //
		
		String 	NameUserLog = request.getParameter("NameUserLog");
		
		String 	ID_company_UserLog = request.getParameter("ID_company_UserLog");
		
		
		
		String browser = request.getParameter("browser");
		
		String getId_CompanyUserLogin = request.getParameter("getId_CompanyUserLogin");
		String getNamePersonal = request.getParameter("getNamePersonal");
		
		
		//------------------------------------------------------------------
        AddProfileDAO addProfile = new AddProfileDAO();
        
        
	    int i2 = addProfile.AddUser(name,NameUserLog,Integer.parseInt(ID_company_UserLog),Integer.parseInt(getId_CompanyUserLogin),getNamePersonal); //
        
       
       //----------------
       
   	int i9 =0;
	
 	if(i2 != 0){
 		
 	
	String id2[] = request.getParameterValues("TranID[]");
	
	
	if(id2 != null){
		i9 = 1;


	int[] numbers = new int[id2.length];
	for(int j = 0;j < id2.length;j++)
	{
	   
	   numbers[j] = Integer.parseInt(id2[j]);
	}
	
	
	   int h=0;

	int num = addProfile.AddSelectTranUser_2(numbers,Integer.parseInt(addProfile.getLastAddTranID()));
	    
	
	//-----------------------------
       
     //  addProfile.addbook(Integer.parseInt(numroom), Integer.parseInt(addProfile.getLastAddTranID()));
       
 	}
       
	}    
       
       
   
       
       AddProfileBean user = new AddProfileBean();
       //System.out.println(name);
   	if(i2 != 0){
		//HttpSession session = request.getSession(true);
		//session.setAttribute("status",1);
   		
        user.setValid(true);
        
    
    	
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddProfile_1.jsp");
	
		
		String status = "1";
		request.setAttribute("statusAddPro",status);
		
		request.setAttribute("listoo",id3);
		dispatcher.forward(request, response);

		
		
	//	response.sendRedirect("index5.jsp");
		
	}
   	
   	else{
	//	response.sendRedirect("login.jsp");
		


		RequestDispatcher dispatcher = request.getRequestDispatcher("AddProfile_2.jsp");
	
		
		String status = "0";
		
		request.setAttribute("statusAddPro",status);
		request.setAttribute("listoo",id3);
		
		request.setAttribute("name_ERROR",name);
		
		
		dispatcher.forward(request, response);
		
		
		
	}
       
       
       
		
	}

}
