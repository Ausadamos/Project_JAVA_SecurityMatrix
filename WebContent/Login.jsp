<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<link rel="stylesheet" href="dist/sweetalert.css">


<script src="js/jquery-1.12.4.js"></script>

<script src="dist/sweetalert-dev.js">				</script>
<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">

  <link rel="stylesheet" href="css/style_login.css">
  
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">



<style>


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


html {
   margin: 0px;
   height: 100%;
   width: 100%;
}

body {
   margin: 0px;
   min-height: 100%;
   width: 100%;
}

.hero.is-primary.is-bold {
  background-image: -webkit-linear-gradient(309deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%);
  background-image: linear-gradient(141deg, #57a6de 0%, #58a7df   71%, #5baadf   100%);
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 14px;
  }
 .form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 550px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}



</style>

<title>Insert title here</title>
</head>
<body  background="img/logo-n.svg">



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
        
        
        
      
      
      
        </div>
      </div>
    </div>
  </div>
</nav>

<div class="pageloader">


<%String status = (String)request.getAttribute("status"); %>
	
<%if(request.getAttribute("status") != null){
	%>

	
<%if(Integer.parseInt(status) == 0){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  '',
				  'Username or Password not found !',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	
<%if(Integer.parseInt(status) == 3){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  '',
				  'Success.  Please login again.',
				  'success'
				)
	
	});
		</script>
	<%} %>	
	
<%if(Integer.parseInt(status) == 4){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  '',
				  'Please enter password or Username again !',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	
	
	
		
<%if(Integer.parseInt(status) == 88){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  '',
				  'Success.  Please log in again.',
				  'success'
				)
	
	});
		</script>
	<%} %>	
	
<%if(Integer.parseInt(status) == 99){
	
	%>
	
	
		<script type="text/javascript">
		$(document).ready(function () {

		
		swal(
				  '',
				  'Wrong old password !',
				  'error'
				)
	
	});
		</script>
	<%} %>	
	
	
	        <%} %>


	
          
  <div class="login-page">
  <div class="form">
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


        <form class="register-form" name="form1" action="AddPasswordForNewUser" method="post" OnSubmit="return fncSubmit();" >
        
        
      <input type="text" name="name" required pattern="[A-Za-z0-9 -]{5,20}"  placeholder="User Name"/>
      <input type="password" name="Copy" required  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters "  placeholder="Old Password"/>
      <input type="password" name="Password" id="txtPassword" required required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters "  placeholder="New Password"/>
      <input type="password" name="NewPassword" id="txtConPassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters "  placeholder="Confirm New Password "/>
      
      <button type="submit">create</button>
     
    </form>
    
    
 

<form class="login-form" action="LoginServlet" method="post" >

   
   	<h1 class="title"align = 'left'>Login</h1>
	<h6 class="subtitle is-6"align = 'left'>Authentication Required.</h6>
	<input type="text" placeholder="Username" name="UserName" maxlength="20" required pattern="[A-Z0-9 -]{5,20}" title="Please enter at least 5 English letters or numbers."> <br>
	<input type="password" placeholder="Password" name="Password" maxlength="20" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ">
						
						   
						    
						    
						    
							<button class="button button-block" />
							LogIn
							
							
							</button>





					  </form>
					  
					  
  </div>
</div>

</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index_login.js"></script>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<style type="text/css">
body{


font-family: 'Source Sans Pro', sans-serif;
}
</style>

</body>
</html>