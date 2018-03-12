package com.polymeetup.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.polymeetup.model.Showmeetup;
import com.polymeetup.repository.MeetupRepository;

/**
 * Servlet implementation class MeetupController
 */

@SuppressWarnings("serial")
public class MeetupController extends HttpServlet {
	private MeetupRepository meetupRepository;
	
	private static String USER_SIGNUP = "content/signup.jsp";
	private static String USER_LOGIN = "content/login.jsp";
	private static String LOGIN_SUCCESS = "content/success.jsp";
	private static String LOGIN_FAILURE = "content/failure.jsp";
    
	@SuppressWarnings("unused")
	private static String CREATE_MEETUP = "content/createmeetup.jsp";
	private static String SHOW_MEETUPS = "content/showmeetups.jsp";
	private static String DISPLAY_MEETUPS = "content/display.jsp";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MeetupController() {
		super();
		meetupRepository = new MeetupRepository();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
		String forward = USER_SIGNUP;
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pageName = request.getParameter("pageName");
		String forward = "";		
		
		if (meetupRepository != null) {
			if (pageName.equals("signup")) {
				if (meetupRepository.findByUserName(request
						.getParameter("userName"))) {
					request.setAttribute("message", "User Name exists. Try another user name");
					forward = USER_SIGNUP;
					RequestDispatcher view = request
							.getRequestDispatcher(forward);
					view.forward(request, response);
					return;
				}

				meetupRepository.save(
						request.getParameter("firstName"),
						request.getParameter("lastName"),
						request.getParameter("streetAddress"),
						request.getParameter("cityName"), 
						request.getParameter("stateName"), 
						request.getParameter("country"), 
						request.getParameter("zipcode"),
						request.getParameter("phoneNo"), 
						request.getParameter("emailAddress"), 
						request.getParameter("userName"),
						request.getParameter("password"));
				forward = USER_LOGIN;
			} else if (pageName.equals("login")) {
				boolean result = meetupRepository.findByLogin(
						request.getParameter("userName"),
						request.getParameter("password"));
				if (result == true) {
					forward = LOGIN_SUCCESS;
				} else {
					forward = LOGIN_FAILURE;
				}
			}
			else if (pageName.equals("createmeetup"))
			{
				meetupRepository.saveMeetup(
						request.getParameter("meetupName"),
						request.getParameter("mDescription"),
						request.getParameter("locationCampus"),
						request.getParameter("locationName"), 
						request.getParameter("userMeet"), 
						request.getParameter("category"), 
						request.getParameter("meetupDate"),
						request.getParameter("timings"));
				forward = LOGIN_SUCCESS;
			}else if (pageName.equals("showmeetups"))
			{
			     List<Showmeetup> result=new ArrayList();

				result = meetupRepository.showMeetupLoc(request.getParameter("locationShowInput"));
				
	            request.setAttribute("meetupinfo", result);
				forward = DISPLAY_MEETUPS;				
			}		
		}		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}
