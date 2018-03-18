
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Bean.AddProfileBean"%>    
   <%@page import="Bean.ListTranIDBean"%>    
 <%@page import="java.util.ArrayList"%>
<%@page import="Dao.ListTranIDDAO2"%>

    

<%@page import="Dao.ListTranIDDAO"%>
<%@page import="Dao.ListModuleDAO"%>


<%@page import="Dao.ListTranIDforDeletebacktopageDAO"%>
<%@page import="Bean.ListModuleBean"%>
<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.ListTranIDBean"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="fonts/Mat_font.css">
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/fontawesome-webfont.woff2">
<link rel="stylesheet" href="dist/sweetalert.css">

<%@page import="Bean.UserLogBean"%>

<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>
    <link rel="stylesheet" href="css/bulma-radio-checkbox.css">


<style type="text/css">
.hero-body {
	-webkit-box-flex: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	padding: 1.25rem 1.5rem;
	padding-top: 0.35rem;
	padding-right: 1.5rem;
	padding-bottom: 0.35rem;
	padding-left: 1.5rem;
	
}

body{
 background-color: #F8F9F9  ;
}html {
   margin: 0px;
   height: 100%;
   width: 100%;
}

body {
   margin: 0px;
   min-height: 100%;
   width: 100%;
}
.menu-list a.is-active {
  background-color: #AED6F1;
  color: #000;
}.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
}

</style>

    
</head>
<body  >


<%
if(session.getAttribute("userLogBean")==null) {
%>
<jsp:include page="Login.jsp"></jsp:include>
<%
} else {
%>







<%String status = (String)request.getAttribute("status"); %>
	
<%if(request.getAttribute("status") != null){
	%>
<%if(Integer.parseInt(status) == 1){
	
	%>

	<script type="text/javascript">
	

	$(document).ready(function () {
		
		swal("successful", "You clicked the button!", "success")

			
			
	});
			</script>
	
	
	
	
	<%} %>
	
<%if(Integer.parseInt(status) == 0){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  'unsuccessful',
				  'ชื่อ ซ้ำ!',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	        <%} %>

  
<%
			UserLogBean A = null;

			try {
				A = (UserLogBean) session.getAttribute("userLogBean");
			} catch (Exception e) {
				A = null;
			}
		%>
		
<section class="hero  is-primary is-bold">
  <div class="hero-body">
   
  <nav class="level">
  <!-- Left side -->
  <div class="level-left">
      
   <img src="img/ntt2.png" width="130px">
    
		</div>
		
		
		 <div class="level-right">
 
<p class="level-item">	<font color="#FFFFF"><B>USER : <%=A.getUsername()%></B></font></p>

<p class="level-item">  





<form action="UserLogoutServlet" method="post" id="from2">


 <button type="submit" class="button is-danger">Logout</button>



 </form>
 
 
 
 
 
 
 
 
 
 
 
 
 
  </p>

  </div>
</nav>

  </div>
</section>


<script>

$(document).ready(function(){
	

       document.querySelector('#from2').addEventListener('click', function(e) {
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to Logout ?",
 
               type: "warning",
               showCancelButton: true,
               confirmButtonColor: '#DD6B55',
               confirmButtonText: 'ตกลง',
               cancelButtonText: "ยกเลิก",
               closeOnConfirm: false,
               closeOnCancel: false
           },
           function(isConfirm) {
               if (isConfirm) {
                   swal({
                       title: 'Logout Success',
                
                       type: 'success'
                   }, function() {
                       form.submit();
                   });

               } else {
                   swal("ยกเลิก");
               }
           });
       });
});
   </script>


<br>
<div class="container ">
   <div class="tile is-ancestor">
  <div class="tile is-2 is-vertical is-parent">
    <div class="tile is-child box">
    

<aside class="menu" >
  
  <ul class="menu-list">
    
    <li>
    
  

      <a class="is-active">Menu</a>
      <ul>
            <%if (A.getStatus() == 1){%>
        <li><a  href="AddTranID.jsp"><i class="fa fa-key" aria-hidden="true"></i> TranID</a></li>
        
        
  
        

  <li><a  href="USER_S1.jsp"><i class="fa fa-user" aria-hidden="true"></i> User</a></li>


        <%} %>
           
       
       
       
       
       
       
        <li><a class="active" href="Add.jsp">  <i class="fa fa-plus-square" aria-hidden="true"></i> Profile</a></li>
        <li><a href="ShowDataSelect.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Update</a></li>
        <li><a href="DeleteProfile.jsp"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a></li>
        <li><a href="Inquiry.jsp"><i class="fa fa-users" aria-hidden="true"></i> Inquiry</a></li>
        <li><a href="ToText.jsp"><i class="fa fa-file-text" aria-hidden="true"></i> To File</a></li>
      </ul>
    </li>
    
  </ul>
  
</aside>




    </div>
  
  </div>
  <div class="tile is-parent">
    <div class="tile is-child box">
    
    
    
      <p class="title">Add Profile</p>
      
      
      <form action="AddProfileServlet" method="post">
  <div class="field">

  <p class="control">
  
   <div class="columns">
     <div class="column is-1">
   <span class="icon is-large">
<i class="fa fa-user-plus" aria-hidden="true"></i>
 
  
</span>
  
  </div>
   <div class="column is-one-third">
    
   


<%String name_ERROR = (String)request.getAttribute("name_ERROR"); %>
	
<%if(request.getAttribute("name_ERROR") != null){
	%>
     <input class="input " value="<%=name_ERROR%>"   name="name" type="text" placeholder="Enter your name" maxlength="20" required pattern="[A-Z0-9 - ]{5,20}" title="กรุณาใส่อักษรตัวใหญ่ภาษาอังกฤษหรือตัวเลขอย่างน้อย  5 ตัว">

<%} else{%>
        <input class="input " name="name" type="text" placeholder="Enter your name" maxlength="20" required pattern="[A-Z0-9 -]{5,20}" title="กรุณาใส่อักษรตัวใหญ่ภาษาอังกฤษหรือตัวเลขอย่างน้อย  5 ตัว">
   
   <%} %>





    </div>
  </div>
   </div>

  
				
<script type="text/javascript">

    function do_this(){

        var checkboxes = document.getElementsByName('TranID22[]');
        var button = document.getElementById('toggle');

        if(button.value == 'Select All'){
            for (var i in checkboxes){
                checkboxes[i].checked = 'FALSE';
            }
            button.value = 'Deselect'
        }else{
            for (var i in checkboxes){
                checkboxes[i].checked = '';
            }
            button.value = 'Select All';
        }
    }
</script>
 
<div class="tile is-ancestor">
  
  <div class="tile is-parent">
    <div class="tile is-child box">

   	

<br>



<%if(((ArrayList<ListTranIDBean>)request.getAttribute("list") != null) ) {%>

					<script type="text/javascript">
						$(document).ready(function() {
							$('#example').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
							
						
								
						});
					</script>



     
										
     	<%ArrayList<ListTranIDBean> List2 = (ArrayList<ListTranIDBean>)request.getAttribute("list"); %>


		
					

						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>TRAN ID</th>
										<th>MODULE</th>
								
								</tr>
							</thead>

							<tbody>


	<%
						

	ListTranIDBean bean;

							for (int i = 0; i < List2.size(); i++) {
								bean = null;
								bean = (ListTranIDBean) List2.get(i);
								
						
							     
							     
							     
						%>



								<tr>





									<td>
									
									
<div class="field">
    <p class="control">
        <div class="b-checkbox is-danger  is-circular">
        
               <input id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" checked="checked"	value="<%=bean.getIdTranID()%>">
            
            
            
            
            <label for="checkboxp<%=i%>">

          <%=bean.getCode()%>   
              	
            </label>
            
            
            
           
										
										
										
										
										
										
        </div>
    </p>
</div>
									
									
									
								</td>


									<td>
									    <%=bean.getNameModule()%>   
									</td>
								

								</tr>



								<%
									}
								%>





							</tbody>
						</table>




						<button type="submit" class="button is-success">Confirm
							To Add</button>

						<button type="reset" class="button is-danger">Reset</button>


					</form>



					<!-- The Modal -->


		





<%} 




}%>
		    
		    
		    
					</form>
		   <br> 
		    <br>
		    
		  <div class="box">  
		    
		    
		    
       <form action="SearchFromEditDeleteTranID_PageAddProfile" method="post">
        
        <nav class="level">

  <div class="level-left">
      
    <h2 class="subtitle is-5">Select to search Module</h2>
    
		</div>
		
		
		 <div class="level-right">
        
        
<input  class="button is-small is-info is-outlined" type="button" id="toggle" value="Select All" onClick="do_this()" />
        
    </div>
        
        </nav>
        
        
        
        
        <div class="columns">
					
					


        
        
    
    

        
        
        

  
	<%
									ListModuleDAO SH9 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB9 = new ArrayList<ListModuleBean>();
								%>


								<%
									int i2 = 0;
	
									RB9 = SH9.ListTranID();
									for (int i = 0; i < RB9.size(); i++) {
								%>
								
								<%if(i<6){ %>
								  <div class="column">
    <div class="field">
    <p class="control">
        <div class="b-checkbox is-success ">

               <input id="checkbox8888<%=i%>" name="TranID22[]" class="styled" type="checkbox" 	value="<%=RB9.get(i).getIdModule()%>">
            <label for="checkbox8888<%=i%>">
      <span class="tag is-light is-medium">      <%=RB9.get(i).getNameModule()%> </span>   
            </label>
            
     		        
        						
										
        </div>
    </p>
</div>
			  </div>
    
    <%} %>
    <%} %>
    


	
       

 
</div>
         <div class="columns">

    

        
        
        

  
	<%
									ListModuleDAO SH10 = new ListModuleDAO();
	
									ArrayList<ListModuleBean> RB10 = new ArrayList<ListModuleBean>();
								%>


								<%
								
	
									RB10 = SH10.ListTranID();
									for (int i = 0; i < RB10.size(); i++) {
								%>
								
								<%if(i>=6){ %>
								  <div class="column">
    <div class="field">
    <p class="control">
        <div class="b-checkbox is-success ">

               <input id="checkbox8889<%=i%>" name="TranID22[]" class="styled" type="checkbox" 	value="<%=RB10.get(i).getIdModule()%>">
            <label for="checkbox8889<%=i%>">
      <span class="tag is-light is-medium"><%=RB10.get(i).getNameModule()%> </span>   
            </label>
            
     		        
        						
										
        </div>
    </p>
</div>
			  </div>
    
    <%} %>
    <%} %>
    


	
       

 
</div>     




<input  class="button is-success is-outlined" type="submit" value="Next" />


				



</form>
</div>
		</div>
			</div>
		</div>



	</div>
	
<!--  -----------------------------   footer  - ------------------------------ -->

</body>

      <script type="text/javascript" src="js/materialize.min.js"></script>
</html>