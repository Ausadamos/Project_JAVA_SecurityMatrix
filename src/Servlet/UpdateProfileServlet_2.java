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

import Bean.AddProfileBean;
import Bean.UpdateProfileBean;
import Dao.AddProfileDAO;
import Dao.UpdateProfileDAO;

/**
 * Servlet implementation class UpdateProfileServlet_2
 */
@WebServlet("/UpdateProfileServlet_2")
public class UpdateProfileServlet_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet_2() {
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

	
		String nameUser = request.getParameter("nameUser");
		String IdUser = request.getParameter("IdUser");
		
		int name2 = Integer.parseInt(IdUser);
		//System.out.print(name);
		

		int num = 0;

       AddProfileDAO addProfile = new AddProfileDAO();
		
     //เอาid ล่าสุด
       
       
       
       
       
     //  int i2 = addProfile.AddUser(name);
        
       //----------------
       
   	int i =0;

	String id2[] = request.getParameterValues("TranID[]");
	
	
	if(id2 != null){
	/*while(i<id2.length){
	System.out.println(i + "=" + id2[i]);
    i++;
		}*/

	//SelectAddTranIDDAO Add = new SelectAddTranIDDAO();
	
	
	
//	String page="ProductListDelete.jsp";
	
	int[] numbers = new int[id2.length];
	for(int j = 0;j < id2.length;j++)
	{
	   
	   numbers[j] = Integer.parseInt(id2[j]);
	}
	
	
	   int h=0;
	   

	
	//int num = addProfile.AddSelectTranUser(numbers,Integer.parseInt(addProfile.getLastAddTranID()));
	    
	
	//int checkDelete = addProfile.DeleteForUpdateSelectTranUser(name2);
	
	
	
	
	
	 num = addProfile.AddSelectTranUser(numbers,name2);
	
	
	}else{
		
		
		
		
	// addProfile.DeleteForUpdateSelectTranUser(name2);
		
	num = 1;	
		
		
		
	}
	//-----------------------------
       
     //  addProfile.addbook(Integer.parseInt(numroom), Integer.parseInt(addProfile.getLastAddTranID()));
       
 //	}
       
       
       
       
   
       
       AddProfileBean user = new AddProfileBean();
       
       
  	// int name2 = updateProfile.SearchUserID(name );
		
	// System.out.print("name2 : " +name2);
	 
	 
       ArrayList<UpdateProfileBean> list = null;
       
	 	  UpdateProfileDAO  updateProfile = new  UpdateProfileDAO();
	 
	 
	 
       //System.out.println(name);
    	if(num != 1){
		//HttpSession session = request.getSession(true);
		//session.setAttribute("status",1);
   		
        user.setValid(true);
        
       
		
		list = updateProfile.ListAdd(nameUser);
    	
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
		request.setAttribute("list",list);
		
		request.setAttribute("nameUser",nameUser);
		request.setAttribute("IdUser",IdUser);
		String statusDelete = "1";
		request.setAttribute("statusDelete",statusDelete);
		
		
		dispatcher.forward(request, response);
		
		
	//	response.sendRedirect("index5.jsp");
		
	}else{
	//	response.sendRedirect("login.jsp");
		

list = updateProfile.ListAdd(nameUser);
    	
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDataSelect_2.jsp");
		request.setAttribute("list",list);
		
		request.setAttribute("nameUser",nameUser);
		request.setAttribute("IdUser",IdUser);
		String statusDelete = "0";
		request.setAttribute("statusDelete",statusDelete);
		
		
		dispatcher.forward(request, response);
		
	}
       
       
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
