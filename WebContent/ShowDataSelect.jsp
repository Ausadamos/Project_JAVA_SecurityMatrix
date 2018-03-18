
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Bean.AddProfileBean"%>    
   <%@page import="Bean.ListTranIDBean"%>    

<%@page import="Dao.ListTranIDDAO"%>
<%@page import="java.util.ArrayList"%>
    <%@page import="Dao.ListUsersDAO"%>
   <%@page import="Bean.ListusersBean"%> 
   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%@page import="Bean.UserLogBean"%>
<%
			UserLogBean A = null;

			try {
				A = (UserLogBean) session.getAttribute("userLogBean");
			} catch (Exception e) {
				A = null;
			}
		%>
		  <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
 
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js">					</script>
<script src="js/jquery.dataTables.min.js">			</script>
<script src="dist/sweetalert-dev.js">				</script>


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
}.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
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
}
</style>

</head>
<body  >

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
	

<%if(Integer.parseInt(status) == 0){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {
			
		
		
		swal(
				  '',
				  'wrong user!',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	        <%} %>








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
    
    <li>
      <a class="is-active">MENU</a>
      <ul>
          <%if (A.getStatus() == 1){%>
      <li><a class="active" href="AddTranID.jsp"><i class="fa fa-key" aria-hidden="true"></i> TranID</a></li>
   
        

  <li><a  href="USER_S1.jsp"><i class="fa fa-user" aria-hidden="true"></i> User</a></li>


        <%} %>
          
        <li><a class="active" href="AddProfile_1.jsp">  <i class="fa fa-plus-square" aria-hidden="true"></i> Profile</a></li>
        <li><a href="ShowDataSelect.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Update</a></li>
        <li><a href="DeleteProfile.jsp"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a></li>
        <li><a href="Inquiry.jsp"><i class="fa fa-users" aria-hidden="true"></i> Inquiry</a></li>
        
        
									
                        <li><a class="active" href="HistoryForAdminNewFile.jsp">  <i class="fa fa-history" aria-hidden="true"></i> History</a></li>
        
  
         <li><a href="ToText.jsp"><i class="fa fa-file-text" aria-hidden="true"></i> To File</a></li>
      </ul>
    </li>
    
  </ul>
  
</aside>




    </div>
  
  </div>
  <div class="tile is-parent">
    <div class="tile is-child box">
        <i class="fas fa-edit fa-2x fa-pull-left fa-border"></i> <p class="title">UPDATE PROFILE</p><HR>
      
    
      
      <form action="UpdateProfileServlet" method="post">
      
     
      <input type="hidden" name="getId_Company" value="<%=A.getId_Company()%>"> 
      
  <div class="field">

  <p class="control">
  
   <div class="columns">
     
   <div class="column is-one-third">
    
   <label class="label">profile</label>
      <div class="field">
 <div class="control has-icons-left ">
 

   
   

<%String name_ERROR = (String)request.getAttribute("name_ERROR"); %>
	
<%if(request.getAttribute("name_ERROR") != null){
	%>

    
    
    
    
    
    
    
    
    
    
    
    
     <input class="input" onkeyup="nospaces(this)" list="browsers33" name="name"   type="text" placeholder="Enter your profile" required pattern="[A-Z 0-9 -]{5,20}" title="กรุณาใส่อักษรตัวใหญ่ภาษาอังกฤษหรือตัวเลขอย่างน้อย  5 ตัว">
<datalist id="browsers33">
  
  
  
  
								<%
								ListUsersDAO SH123 = new ListUsersDAO();
	
									ArrayList<ListusersBean> RB123 = new ArrayList<ListusersBean>();
								%>


								<%
									int i2 = 0;
	
									RB123 = SH123.ListUsers2(A.getId_Company());
									for (int i = 0; i < RB123.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB123.get(i).getName()%>"> </option>
    
    
    
    <%} %>
    
    

    
    
  </datalist>
  
  <span class="icon is-small is-left">
  <i class="far fa-user"></i>
    </span>
<%} else{%>    

     
  
     <input class="input" onkeyup="nospaces(this)" list="browsers" name="name"   type="text" placeholder="Enter your profile" required pattern="[A-Z 0-9 -]{5,20}" title="กรุณาใส่อักษรตัวใหญ่ภาษาอังกฤษหรือตัวเลขอย่างน้อย  5 ตัว">
<datalist id="browsers">
  
  
  
  
  
								<%
								ListUsersDAO SH123 = new ListUsersDAO();
	
									ArrayList<ListusersBean> RB123 = new ArrayList<ListusersBean>();
								%>


								<%
									int i2 = 0;
	
									RB123 = SH123.ListUsers2(A.getId_Company());
									for (int i = 0; i < RB123.size(); i++) {
								%>
    
    
    
  
    
          <option value="<%=RB123.get(i).getName()%>"> </option>
    
    
    <%} %>
    
      </datalist>
    
    

  
   <%} %>
 <span class="icon is-small is-left">
  <i class="far fa-user"></i>
    </span>
</div>
</div>

    </div>
  </div>
   
   </p>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

		
	
		
		



		

<div class="block">
				

  

<button type="submit" class="button is-success">
						
						<span class="icon is-small">
      <i class="fas fa-check"></i>
    </span>
    <span> Confirm</span>
    
   </button>

						<button type="reset" class="button is-danger">
						
						<span class="icon is-small">
      <i class="fas fa-redo-alt"></i>
    </span>
    <span>Reset</span>
    
    </button>

 
  </div>

</div>

<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
</form>

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