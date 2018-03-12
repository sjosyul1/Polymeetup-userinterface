<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Meetup Creation</title>
<link href="/polymeetup/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/polymeetup/datepicker/css/datepicker.css" rel="stylesheet" />
<link href="/polymeetup/assets/css/bootstrap-united.css" rel="stylesheet" />

<style>
.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>

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
				<!-- <li><a href="content/login.jsp">MeetUPs</a></li> -->
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

	<script src="/polymeetup/jquery-1.8.3.js">
		
	</script>

	<script src="/polymeetup/bootstrap/js/bootstrap.js">
		
	</script>

	<script src="/polymeetup/datepicker/js/bootstrap-datepicker.js">
		
	</script>


	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Start a new Meetup</h1>
				<p>Its absolutely quick!</p>
			</div>
		</div>

		<div></div>
	</div>

	<c:if test="${not empty message}">
		<div class="message green">${message}</div>
	</c:if>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form id="myForm" method="post" class="bs-example form-horizontal"
							action="../MeetupController">
							<fieldset>
								<legend>MeetUP Creation Form</legend>
								
								<input type="hidden" name="pageName" value="createmeetup">

								<div class="form-group">
									<label for="meetupNameInput" class="col-lg-3 control-label">Meetup
										Name</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="meetupName"
											id="meetupNameInput" placeholder="MeetUP Name" />
									</div>
								</div>								

								<div class="form-group">
									<label for="mDescriptionInput" class="col-lg-3 control-label">Description
									</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="mDescription"
											id="mDescriptionInput" placeholder="Description" />
									</div>
								</div>

						 <div class="form-group">
								<label for="locationCampusInput" class="col-lg-3 control-label">Location Campus
								</label>
								<div class="col-lg-9">				    
								<select class="form-control" id="ddl" name="locationCampus" onchange="configureDropDownLists(this,document.getElementById('ddl2'))">
								<option value=""></option>
								<option value="Tempe">Tempe</option>
								<option value="West">West</option>
								<option value="Downtown">Downtown</option>
								<option value="Poly">Poly</option>
								</select>
						</div>
						</div>			
						
						<div class="form-group">
								<label for="locationNameInput"  class="col-lg-3 control-label">Location Name
								</label>
								<div class="col-lg-9">			
								<select class="form-control" name="locationName" id="ddl2">
								</select>
						</div>
						</div>	
									<div class="form-group">
									<label for="userMeetInput" class="col-lg-3 control-label">User Name
										</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="userMeet"
											id="userMeetInput" placeholder="User Name" />
									</div>
								</div>	
								<div class="form-group">
									<label for="categoryNameInput" class="col-lg-3 control-label">Category Name
										</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="category"
											id="categoryNameInput" placeholder="Category Name" />
									</div>
								</div>
									<div class="form-group">
									<label for="meetupDateInput" class="col-lg-3 control-label">MeetUP Date
										</label>
									<div class="date form_date col-lg-9"
										data-date-format="mm/dd/yyyy" data-date-viewmode="years">
										<input type="text" class="form-control" name="meetupDate"
											id="meetupDateInput" placeholder="MeetUP Date" />
									</div>
								</div>

								<div class="form-group">
									<label for="timingsInput" class="col-lg-3 control-label">Timings
										</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="timings"
											id="timingsInput" placeholder="Timings" />
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
													<h3>MeetUP Creation Form Submission</h3>
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

	<script>
		$(function() {
			$('#meetupDateInput').datepicker();
		});
	</script>
<script type="text/javascript">
     function configureDropDownLists(ddl1,ddl2) {
    var tempe = ['Memorial Union', 'Payne Hall', 'Murdock Hall', 'Wexler Hall', 'ISDB2'];
    var west = ['Sands Hall', 'University Center', 'Fetcher Library'];
    var downtown = ['University Center', 'Health North', 'Health South'];
    var poly = ['Student Union', 'Peraltha Hall', 'AGBC', 'Sutton Hall'];
    switch (ddl1.value) {
        case 'Tempe':
            ddl2.options.length = 0;
            for (i = 0; i < tempe.length; i++) {
                createOption(ddl2, tempe[i], tempe[i]);
            }
            break;
        case 'West':
            ddl2.options.length = 0; 
        for (i = 0; i < west.length; i++) {
            createOption(ddl2, west[i], west[i]);
            }
            break;
        case 'Downtown':
            ddl2.options.length = 0;
            for (i = 0; i < downtown.length; i++) {
                createOption(ddl2, downtown[i], downtown[i]);
            }
            break;
        case 'Poly':
            ddl2.options.length = 0;
            for (i = 0; i < poly.length; i++) {
                createOption(ddl2, poly[i], poly[i]);
            }
            break;
            default:
                ddl2.options.length = 0;
            break;
    }

}

    function createOption(ddl, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        ddl.options.add(opt);
    }
</script>
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