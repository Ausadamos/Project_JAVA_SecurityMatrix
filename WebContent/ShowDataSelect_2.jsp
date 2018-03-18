
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Bean.UpdateProfileBean"%>

<%@page import="java.util.List"%>
<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.ListUserTranID"%>

<%@page import="Dao.ListTranIDDAO"%>

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

<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>
	    <link rel="stylesheet" href="css/bulma-radio-checkbox.css">

 </script>
  <script type="text/javascript">

function nospaces(t){

if(t.value.match(/\s/g)){

alert('Sorry, you are not allowed to enter any spaces');

t.value=t.value.replace(/\s/g,'');

}

}

</script>
<script>

$(document).ready(function(){
	
	document.querySelector('#AddPasswordForNewUser').addEventListener('submit', function(e) {
	  	   
     	
 	   var OldPassword = $("#OldPassword").val();
        var NewPassword = $("#NewPassword").val();
        var ConfirmNewPassword = $("#ConfirmNewPassword").val();
        
        if (NewPassword != ConfirmNewPassword) {
           // alert("Passwords do not match.");
           
           swal(
					 '',
					 'Passwords do not match.!',
					 'error'
				  )

            e.preventDefault();
        
        }else{
       	
 	   
      	//   console.log("เข้า#form_EditTranIdServlet")
             var form = this;
             e.preventDefault();
             swal({
                 title: "Confirm to EDIT PASSWORD ?",
                 text: "",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonColor: '#d33',
                 confirmButtonText: 'Confirm',
                 cancelButtonText: "Cancel",
                 closeOnConfirm: false,
                 closeOnCancel: false
             },
             function(isConfirm) {
                 if (isConfirm) {
                     swal({
                         title: 'Deleting action ..',
                  
                         type: 'success'
                     }, function() {
                         form.submit();
                     });

                 } else {
                     swal("Cancelled");
                 }
             });
        }
        
   
         });
	 
	
       document.querySelector('#from2').addEventListener('click', function(e) {
           var form = this;
           e.preventDefault();
           swal({
               title: "Confirm to Logout ?",
 
               type: "warning",
               showCancelButton: true,
               confirmButtonColor: '#DD6B55',
               confirmButtonText: 'Confirm',
               cancelButtonText: "Cancel",
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
                   swal("Cancel");
               }
           });
       });
});
   </script>

	<%if(request.getAttribute("statusSearchTranID") != null){
	
	%>
	

	
	<%String statusSearchTranID = (String)request.getAttribute("statusSearchTranID"); %>
	

	
<%if(Integer.parseInt(statusSearchTranID) == 0){
	
	%>

	
	
	<script type="text/javascript">
	

	$(document).ready(function () {
		
	
	swal(
			  '',
			  'please select Module! ',
			  'error'
			)
			
			
	});
			</script>
	
	
	
	
	<%} %>

	
	
	
	
	<% }%>

<%@page import="Bean.UserLogBean"%>
<%
			UserLogBean A = null;

			try {
				A = (UserLogBean) session.getAttribute("userLogBean");
			} catch (Exception e) {
				A = null;
			}
		%>
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
}.menu-list a.is-active {
  background-color: #AED6F1;
  color: #000;
}.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
}
</style>


<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable( {
        scrollY:        '75vh',
        scrollCollapse: true,
        paging:         false
    } );
} );</script>




</head>
<body>
  <script language="javascript">
function fncSubmit()
{

	

	if(document.form1.txtPassword.value != document.form1.txtConPassword.value)
	{
		alert('Confirm Confirm New Password Not Match');
		document.form1.txtConPassword.focus();		
		return false;
	}	


	document.form1.submit();
}
</script>



<form action="AddPasswordForNewUser" method="post" id="AddPasswordForNewUser" >
	<input type="hidden" name="UserName" value="<%=A.getUsername()%>">
	<input type="hidden" name="Key" value="1">

	<div id="myBtnEdit_Password"  class="modal">
	
	<br><br><br>
  <div class="modal-background"></div>
  <div class="modal-content">
    <header class="modal-card-head">
      <p class="modal-card-title"> <i class="far fa-edit"></i>EDIT PASSWORD
      
     
      </p>
     
      <span
						onclick="document.getElementById('myBtnEdit_Password').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
      			
    </header>
    <section class="modal-card-body">
    
    
        <div class="field">
  <label class="label">	Current Password</label>
  <div class="control has-icons-left has-icons-right">
   <input onkeyup="nospaces(this)" class="input" type="password" name="OldPassword" id="OldPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter Current Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
   
        <div class="field">
  <label class="label">New Password</label>
  <div class="control has-icons-left has-icons-right">
   <input onkeyup="nospaces(this)" class="input" type="password" name="NewPassword" id="NewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter New Password"/>
  
    <span class="icon is-small is-left">
      <i class="fas fa-key"></i>
    </span>
    
  </div>
 
 
</div>
  
    <div class="field">
  <label class="label">New Password again</label>
  <div class="control has-icons-left has-icons-right">
   
      <input onkeyup="nospaces(this)" class="input" type="password" name="ConfirmNewPassword" id="ConfirmNewPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="ต้องประกอบด้วยตัวเลขอย่างน้อยหนึ่งตัวอักษรและตัวพิมพ์ใหญ่และตัวพิมพ์เล็กและตัวอักษรอย่างน้อย 8 ตัวขึ้นไป"  placeholder="Enter New Password again"/>
      
  
    <span class="icon is-small is-left">
<i class="fas fa-key"></i>
    </span>
    
  </div>
 
</div>
  
  
  
  
    </section>
    <footer class="modal-card-foot">
     
      
  <button type="submit" class="button is-success">
    <span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span>Save changes</span>
  </button>
      
      <button class="button" type="reset">Reset</button>
    </footer>
  </div>
</div>
	

	


	</form>




          
<%String id2[] = (String[]) request.getAttribute("listoo"); 
         String id3[] = (String[]) request.getAttribute("listoo2");	%>
<%
if(session.getAttribute("userLogBean")==null) {
%>
<jsp:include page="Login.jsp"></jsp:include>
<%
} else {
%>



	

<style>
.navbar {
	  background-color: #58a7df;
min-height: 3.25rem;
position: relative;
}.navbar-link::after {
    border: 1px solid #111;
    border-right: 0;
    border-top: 0;
    content: " ";
    display: block;
    height: 0.5em;
    pointer-events: none;
    position: absolute;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
    width: 0.5em;
    margin-top: -0.375em;
    right: 1.125em;
    top: 50%;
  }

</style>





<nav class="navbar is-transparent">
  <div class="navbar-brand">
    <a class="navbar-item">
      <img src="img/55.jpeg" width="35px">  &nbsp;
  <img src="img/ntt2.png" width="130px"> 
    </a>
    <div class="navbar-burger burger" data-target="navbarExampleTransparentExample">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>

  <div id="navbarExampleTransparentExample" class="navbar-menu">
    <div class="navbar-start">
  
 
 
 
 
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="field is-grouped">
        
        
        
               <div class="navbar-item has-dropdown is-hoverable is-right" >
        <a class="navbar-link" >
    <font color="#FFFFF"> <b> <%=A.getUsername()%> </b> </font>
        </a>
        <div class="navbar-dropdown is-boxed is-right">
          <a class="navbar-item" onclick="document.getElementById('myBtnEdit_Password').style.display='block'">
          Edit Password
          </a>
          
          
          
      
          
          
          
          
          
       <form class="navbar-item is-active" action="UserLogoutServlet" method="post" id="from2">   
           Logout
          </form>
        </div>
      </div>
      
      
      
      
      
        </div>
      </div>
    </div>
  </div>
</nav>

	<br>
	<div class="container ">
		<div class="tile is-ancestor">
			<div class="tile is-2 is-vertical is-parent">
				<div class="tile is-child box">


					<aside class="menu">

					<ul class="menu-list">

						<li><a class="is-active">MENU</a>
							<ul>
							
							  <%if (A.getStatus() == 1){%>
								<li><a class="active" href="AddTranID.jsp"><i
										class="fa fa-key" aria-hidden="true"></i> TranID</a></li>

        

  <li><a  href="USER_S1.jsp"><i class="fa fa-user" aria-hidden="true"></i> User</a></li>


        <%} %>
         
								<li><a class="active" href="AddProfile_1.jsp"> <i
										class="fa fa-plus-square" aria-hidden="true"></i> Profile
								</a></li>
								<li><a href="ShowDataSelect.jsp"><i
										class="fa fa-pencil" aria-hidden="true"></i> Update</a></li>
								<li><a href="DeleteProfile.jsp"><i class="fa fa-trash"
										aria-hidden="true"></i> Delete</a></li>
								<li><a href="Inquiry.jsp"><i class="fa fa-users"
										aria-hidden="true"></i> Inquiry</a></li>
										
									
                        <li><a class="active" href="HistoryForAdminNewFile.jsp">  <i class="fa fa-history" aria-hidden="true"></i> History</a></li>
        
         
										
										
										
								<li><a href="ToText.jsp"><i class="fa fa-file-text"
										aria-hidden="true"></i> To File</a></li>
							</ul></li>

					</ul>

					</aside>




				</div>

			</div>
			<div class="tile is-parent">
				<div class="tile is-child box">


					<div class="columns">
						

						<%String nameUser = (String)request.getAttribute("nameUser"); %>
						
						<%String IdUser = (String)request.getAttribute("IdUser"); %>
						
						
<%if(request.getAttribute("status") != null){
	
	%>
	
	
	
	<%String status = (String)request.getAttribute("status"); %>
	

	
<%if(Integer.parseInt(status) == 0){
	
	%>

	<script type="text/javascript">
	

	$(document).ready(function () {
		
	
	swal(
			  'unsuccessful',
			  'ไม่มี TranId ที่เลือก!',
			  'error'
			)
			
			
	});
			</script>
	
	
	
	
	<%} %>
	
<%if(Integer.parseInt(status) == 1){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {
			
		
		
		swal(
				  'unsuccessful',
				  'มี TranID ที่เลือก อยู่แล้ว!',
				  'error'
				)
	
	});
		</script>
	<%} %>
	
<%if(Integer.parseInt(status) == 2){
	
	%>
	
		<script type="text/javascript">
	
	
	$(document).ready(function () {
		
	
		
		swal("successful", "You clicked the button!", "success")
			
			
	});
			</script>
	
	
	
	
	<%} %>
	
	
	
	
	<% }%>



	
	
	
	
	<%if(request.getAttribute("statusAddTran") != null){
	
	%>
	
	
	
	<%String statusAddTran = (String)request.getAttribute("statusAddTran"); %>
	

	
<%if(Integer.parseInt(statusAddTran) == 0){
	
	%>
	
	<script type="text/javascript">
	

	$(document).ready(function () {
		
	
	swal(
			  '',
			  'Error!',
			  'error'
			)
			
			
	});
			</script>
	
	
	
	
	<%} %>

	
<%if(Integer.parseInt(statusAddTran) == 1){
	
	%>
	
		<script type="text/javascript">
	
	
	$(document).ready(function () {
		
	
		
		swal("", "successful", "success")
			
			
	});
			</script>
	
	
	
	
	<%} %>
	
	
	
	
	<% }%>
	
	
	
	



	
	<%if(request.getAttribute("statusDelete") != null){
	
	%>
	
	
	
	<%String statusDelete = (String)request.getAttribute("statusDelete"); %>
	

	
<%if(Integer.parseInt(statusDelete) == 0){
	
	%>
	
	<script type="text/javascript">
	

	$(document).ready(function () {
		
	
	swal(
			  '',
			  'please select TranID! ',
			  'error'
			)
			
			
	});
			</script>
	
	
	
	
	<%}else{ %>

	
	<script type="text/javascript">
	

	$(document).ready(function () {
		
	
	swal(
			  '',
			  'successful',
			  'success'
			)
			
			
	});
			</script>
	
	
	
	
	
		<% }%>
	<% }%>

	
	
	
	
	
	
	

						<div class="column is-half">


					  <i class="fas fa-edit fa-2x fa-pull-left fa-border"></i> 		<h1 class="title">Update Profile</h1>
							<h2 class="subtitle">
								Name : <%=nameUser %></h2>

						</div>
					</div>
					

						<div class="field">

							<p class="control">
							<div class="tile is-ancestor">

								<div class="tile is-parent is-vertical">

									<div class="tile is-child box">

												
<script type="text/javascript">

    function do_this(){

     
        
        var checkboxes = document.getElementsByName('TranID22[]');
        var button = document.getElementById('toggle');

        if(button.value == 'Select All'){
            for (var i in checkboxes){
            	
            	if(   checkboxes[i].value != ( 159 )){
            	   	 checkboxes[i].checked = 'TRUE';
            		
            }else if( checkboxes[i].value != ( 160 )){
            	
              	 checkboxes[i].checked = 'TRUE';
            }else if( checkboxes[i].value != ( 114 )){
            	
             	 checkboxes[i].checked = 'TRUE';
           }else{
            	
            	 checkboxes[i].checked = 'FALSE';
            }
            	
            button.value = 'Deselect'
            }
        }else{
            for (var i in checkboxes){
            	
              	if(   checkboxes[i].value == ( 159) ){
                    
            		
            		
                }else if(  checkboxes[i].value == ( 160)){
                	
                	
                }else if(  checkboxes[i].value == ( 114)){
                	
                	
                }else{
                	
                	checkboxes[i].checked = '';
                }
              	
              	
             
            }
            button.value = 'Select All';
        }
        
    }
</script>
<script type="text/javascript">

    function do_this2(){

     
        
        var checkboxes = document.getElementsByName('TranID[]');
        var button = document.getElementById('toggle2');

        if(button.value == 'Select All'){
            for (var i in checkboxes){
            	
            	if(   checkboxes[i].value != ( 159 )){
            	   	 checkboxes[i].checked = 'TRUE';
            		
            }else if( checkboxes[i].value != ( 160 )){
            	
              	 checkboxes[i].checked = 'TRUE';
              	 
            }else if( checkboxes[i].value != ( 114 )){
            	
             	 checkboxes[i].checked = 'TRUE';
           }else{
            	
            	 checkboxes[i].checked = 'FALSE';
            }
            	
            button.value = 'Deselect'
            }
        }else{
            for (var i in checkboxes){
            	
              	if(   checkboxes[i].value == ( 159) ){
                    
            		
            		
                }else if(  checkboxes[i].value == ( 160)){
                	
                	
                }else if(  checkboxes[i].value == ( 114)){
                	
                	
                }else{
                	
                	checkboxes[i].checked = '';
                }
              	
              	
             
            }
            button.value = 'Select All';
        }
        
        
    }
</script>





									  <form action="SearchFromEditDeleteTranID_PageEditPro" method="post">
									  	<input type="hidden" name="nameUser" value="<%=nameUser%>">
					                    <input type="hidden" name="IdUser" value="<%=IdUser%>">
					
					
        
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






  <button type="submit" class="button is-success is-outlined">
    <span class="icon is-small">
      <i class="fas fa-chevron-circle-right"></i>
    </span>
    <span>Next</span>
  </button>

				



</form> 

<br>


	
										
									</div>


	<%if((id3 == null)){ %>


  
							

                 	<%ArrayList<UpdateProfileBean> List = (ArrayList<UpdateProfileBean>)request.getAttribute("list"); %>
										
										
							
										<%int ii = 1; %>




									



										<%if(List != null){ %>

<% 

} %>
									


<%}else{ %>


		<div class="tile is-child box">

  
	<%
	ListTranIDforDeletebacktopageDAO SH12 = new ListTranIDforDeletebacktopageDAO();
	ArrayList<ListTranIDBean> RB12 = new ArrayList<ListTranIDBean>();

	
	ListTranIDforDeletebacktopageDAO SH16 = new ListTranIDforDeletebacktopageDAO();
	
	
	ArrayList<ListUserTranID> RB16 = new ArrayList<ListUserTranID>();
	
								%>
	  
	   <% 
	   
	                              List<String> list55 = new ArrayList<String>();
	   
	   
									RB16 = SH16.ListTranIDforArray(Integer.parseInt(IdUser));
									
									
									for (int i55 = 0; i55 < RB16.size(); i55++) {
										
										list55.add(Integer.toString(RB16.get(i55).getId_TranID()));
										
								%>
								
								
								
		       <%} %>
		
		
		
						<script type="text/javascript">
						$(document).ready(function() {
							$('#example2').DataTable({
								scrollY : '75vh',
								scrollCollapse : true,
								paging : false
							});
							document.querySelector('#AddTranID_ForProfile_Servlet_Page2').addEventListener('submit', function(e) {
							   	   
								 if( $('input[type=search]').val() != ""){
						    		  alert("กรุณาล้างค่าการค้นหา !");
						    	
						    		        e.preventDefault();
						    		 
						    		  
						    	  }else{
						         var form = this;
						         e.preventDefault();
						         swal({
						             title: "Confirm to Edit Profile ?",

						             type: "warning",
						             showCancelButton: true,
						             confirmButtonColor: '#DD6B55',
						             confirmButtonText: 'Confirm',
						             cancelButtonText: "Cancel",
						             closeOnConfirm: false,
						             closeOnCancel: false
						         },
						         function(isConfirm) {
						             if (isConfirm) {
						                 swal({
						                     title: 'Editing action ..',
						              
						                     type: 'success'
						                 }, function() {
						                     form.submit();
						                 });

						             } else {
						                 swal("Cancel");
						             }
						         });
						    	  }
						     });
						     
						     //--------------------------
							
						
								
						});
					</script>		  

								<%
								int[] numbers = new int[id3.length];
								
								for(int j = 0;j < id3.length;j++)
								{
								   
								   numbers[j] = Integer.parseInt(id3[j]);
								}
								   %>
								  
							
								   
							
						
		
		
					<form action="AddTranID_ForProfile_Servlet_Page2" id="AddTranID_ForProfile_Servlet_Page2" method="post">
					
					<input type="hidden" name="getId_CompanyUserLogin" value="<%=A.getId_Company()%>"> 
					
<input type="hidden" name="getNamePersonal" value="<%=A.getFname()%> <%=A.getLname()%>">
					
					
					
					<input type="hidden" name="NameUserLog" value="<%=A.getUsername()%>">  
					
				
					<input type="hidden" name="NameProfile" value="<%=nameUser%>"> 
					
					 
      <input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
					     
					<% for (String s : id3) {%>
  <input value="<%=s%>" name="id3[]" type="hidden"/>
<%}%>
					<input type="hidden" name="nameUser" value="<%=nameUser%>">
					<input type="hidden" name="IdUser" value="<%=IdUser%>">
					
					<input  class="button is-small is-info is-outlined" type="button" id="toggle2" value="Select All" onClick="do_this2()" />
					
					
						<table id="example2" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>

									<th>TRAN ID</th>
									<th>MODULE</th>
							
								</tr>
							</thead>

							<tbody>
							
							
									   <% 
							
								
	
									RB12 = SH12.ListTranIDforDeletebacktopage(numbers);
									
									
									for (int i = 0; i < RB12.size(); i++) {
								%>
		
		
	
		
<tr>





									<td>
		
     
        
       <%   
       
       
       String str = Integer.toString(RB12.get(i).getIdTranID());
       
       if(list55.contains(str)){
    	  
			%>
			
<div class="field">
<p class="control">
<div class="b-checkbox is-danger  is-circular">

 <%if(RB12.get(i).getCode().equals("SSSN") || RB12.get(i).getCode().equals("SSSF") || RB12.get(i).getCode().equals("SSSR")){ %>
            
                           <input  onclick="return false;"  id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" checked="checked"  	  value="<%=RB12.get(i).getIdTranID()%>">
            
            
            <%}else{ %>
            
                           <input id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" checked="checked"	value="<%=RB12.get(i).getIdTranID()%>">
            
            <%} %>



<label for="checkboxp<%=i%>">

<%=RB12.get(i).getCode()%>
  	
</label>

					
</div>
</p>
</div>
					
					
    	<%    
    	}else{
    	    %>
    	    
    	    			
<div class="field">
<p class="control">
<div class="b-checkbox is-danger  is-circular">


 <%if(RB12.get(i).getCode().equals("SSSN") || RB12.get(i).getCode().equals("SSSF")  || RB12.get(i).getCode().equals("SSSR") ){ %>
            
                           <input  onclick="return false;"  id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" checked="checked"  	  value="<%=RB12.get(i).getIdTranID()%>">
            
            
            <%}else{ %>
            
                           <input id="checkboxp<%=i%>" name="TranID[]" class="styled" type="checkbox" 	value="<%=RB12.get(i).getIdTranID()%>">
            
            <%} %>
            
            
            
<label for="checkboxp<%=i%>">

<%=RB12.get(i).getCode()%>
  	
</label>

					
</div>
</p>
</div>
			
    	    
    	    <% 
    		
    		
    	}
       
      
       
     %>
        
        	  
         	
									
									
								</td>


									<td>
									<%=RB12.get(i).getNameModule()%>
									</td>
								


								</tr>



								<%
									}
								%>





							</tbody>
						</table>





						<br>


					
<button type="submit" class="button is-success">
						
						<span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span> Confirm to edit</span>
    
   </button>

						<button type="reset" class="button is-danger">
						
						<span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
    
    </button>

					</form>



					<!-- The Modal -->


				</div>







<%} %>





									</div>
								</div>
							</div>



<BR><BR><BR><BR><BR><BR><BR>
						</div>


				



				</div>
			</div>
		</div>
	</div>


	<!--  -----------------------------   footer  - ------------------------------ -->
<%
}%>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<style type="text/css">
body{


font-family: 'Source Sans Pro', sans-serif;
}
</style>
</body>

<script type="text/javascript" src="js/materialize.min.js"></script>
</html>