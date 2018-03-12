<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display</title>
<link href="/polymeetup/assets/css/bootstrap-united.css" rel="stylesheet" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.polymeetup.model.Showmeetup" %>

</head>
<body>
	<script src="/polymeetup/jquery-1.8.3.js">
		
	</script>

	<script src="/polymeetup/bootstrap/js/bootstrap.js">
		
	</script>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/polymeetup">Home</a></li>
				<li><a href="content/signup.jsp">Signup</a></li>
				<li class="active"><a href="content/login.jsp">Login</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Explore<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Contact us</a></li>
						<li class="divider"></li>
						<li><a href="#">Further Actions</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

  <div class="container">
		<div class="jumbotron">
			<div>
				<h1>ASU MeetUPs Info!</h1>			
			</div>
		</div>
		<div></div>
	</div>
 	<div></div> 
 <div>
<% List<Showmeetup> res = (List<Showmeetup>) request.getAttribute("meetupinfo"); %>
<div align="center">
        <table border="1"  class="table table-striped" cellpadding="5">
            <caption><h2>MeetUPs</h2></caption>
            <tr>
                <th>MeetUP Name</th>
                <th>Description</th>
                <th>Date</th>
                <th>Timings</th>
                <th>Location Name</th>
                <th>Location Campus</th>
                <th>Category</th>
                <th>Organizer</th>                
            </tr>
            
            <tr>
<% 
				 if(res!=null){
				   for(Showmeetup show: res){
				   out.println("<td>" + show.getMeetName() +"</td>"+
						       "<td>" + show.getMeetDescription() +"</td>"+
						       "<td>" + show.getMmeetupDate() +"</td>"+
						       "<td>" + show.getMeettimings() +"</td>"+
						       "<td>" + show.getMeetlocationCampus() +"</td>"+
						       "<td>" + show.getMeetlocationName() +"</td>"+
						       "<td>" + show.getMeetcategory() +"</td>"+
						       "<td>" + show.getMeetuserMeet() +"</td>"+ "</tr>"
						   );
						     }
						  }
%>
            </tr>
        </table>
   </div>
    
 </div>
	
</body>
</html>