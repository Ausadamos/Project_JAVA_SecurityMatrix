<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Bean.ListHistoryBean"%>
<%@page import="Bean.ListHistoryDateBean"%>  
<%@page import="Bean.AddProfileBean"%>    
<%@page import="Bean.ListTranIDBean"%>    
<%@page import="Dao.ListTranIDDAO2"%>
<%@page import="Dao.ListTranIDDAO"%>
<%@page import="Dao.ListModuleDAO"%>
<%@page import="Dao.ListTranIDforDeletebacktopageDAO"%>
<%@page import="Bean.ListModuleBean"%>
<%@page import="Bean.AddProfileBean"%>
<%@page import="Bean.ListTranIDBean"%>
<%@page import="Dao.ListTypeHistoryDAO"%>
<%@page import="Bean.ListTypeHistoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.UserLogBean"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




  

  


<link rel="stylesheet" type="text/css" href="css/bulma.css">
<link rel="stylesheet" type="text/css" href="css/bulma.min.css">





   
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
html {
   margin: 0px;
   height: 100%;
   width: 100%;
}

body {
  background-color: #F8F9F9  ;
   margin: 0px;
   min-height: 100%;
   width: 100%;
}.menu-list a.is-active {
  background-color: #AED6F1;
  color: #000;

}
  
</style>
  




<section class="hero  is-primary  is-bold">
  <div class="hero-body">
   
   <nav class="level">

  <div class="level-left">
      
   <img src="img/ntt2.png" width="130px">
    
		</div>
		
		
		 <div class="level-right">
 


<p class="level-item">  <form action="UserLogoutServlet" method="post" id="from2">


 <button type="submit" class="button is-danger">Logout</button>



 </form> </p>

  </div>
</nav>
  
  
</div>
    
  
  </div>
</section>






</body>
</html>