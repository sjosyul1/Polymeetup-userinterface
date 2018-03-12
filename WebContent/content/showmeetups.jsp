<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Meetups</title>
<link href="/polymeetup/assets/css/bootstrap-united.css" rel="stylesheet" />

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
				<li><a href="signup.jsp">Signup</a></li>
				<li class="active"><a href="login.jsp">Login</a></li>
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
				<h1>ASU Polytechnic MeetUPs!</h1>			
			</div>
		</div>

		<div></div>
	</div>
 	<div></div> 
	<div></div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form id="myForm" method="post" class="bs-example form-horizontal"
							action="../MeetupController">
							<fieldset>
								<legend>Show meetups Form</legend>
								
								<input type="hidden" name="pageName" value="showmeetups">

						 <div class="form-group">
								<label for="locationShowInput" class="col-lg-3 control-label">Location Campus
								</label>
								<div class="col-lg-9">				    
								<select class="form-control" id="ddls" name="locationShowInput" ">
								<option value=""></option>
								<option value="Tempe">Tempe</option>
								<option value="West">West</option>
								<option value="Downtown">Downtown</option>
								<option value="Poly">Poly</option>
								</select>
						</div>
						</div>								
													<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>

									<button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Submit</button>
									<div id="themodal" class="modal fade" data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>MeetUP Show Form Submission</h3>
												</div>
												<div class="modal-body">
													<p>Are you sure you want to do this?</p>
													<div class="progress progress-striped active">
														<div id="doitprogress" class="progress-bar"></div>
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
													<input type="submit" value="Yes" id="yesbutton"
														class="btn btn-primary" data-loading-text="Saving.."
														data-complete-text="Submit Complete!">
												</div>
											</div>
										</div>
									</div>

								</div>			
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="form-group"> </div>

	<script type="text/javascript">
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};

				setTimeout(countDown, 100);
			});

		});
	</script>
	
</body>
</html>