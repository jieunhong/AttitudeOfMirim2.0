
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String searchType = request.getParameter("searchType");
	String searchStudent = request.getParameter("searchStudent");

	System.out.println(searchType + searchStudent);
	MirimDBBean sdb = new MirimDBBean();
	StudentDataBean user;
	List<ScoreDataBean> scores = null;
	try {
		if(searchType.equals("stuNum")){
			user = sdb.searchStudent(searchStudent, "");
			scores = sdb.listScore_search(user.getStu_num(), (user.getStu_birth() + user.getStu_name()).trim());
		}else if(searchType.equals("stuName")){
			scores = sdb.listScore_search_byName(searchStudent);
		}
		System.out.println(scores.toString());
	} catch (NullPointerException e) {
		System.out.println("엑");
	}

	application.setAttribute("students_score", scores);

	response.sendRedirect("AOM_StudentScoreForm.jsp?searchStudent="+searchStudent+"&searchType="+searchType);
%>
