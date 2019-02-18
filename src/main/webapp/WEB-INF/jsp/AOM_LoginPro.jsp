<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String num = request.getParameter("num").trim();
	String birth = request.getParameter("birth").trim();
	String passwd = request.getParameter("passwd").trim();
	String url = "";
	MirimDBBean sdb = new MirimDBBean();
	int check = sdb.stuCheck(Integer.parseInt(birth), Integer.parseInt(num), passwd);
	if (check == 1) {
		url = "AOM_StudentMain.jsp";
	} else if (check == 2) {
		url = "AOM_TeacherMain.jsp";
	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("일치하는 회원이 존재하지 않습니다");
	history.go(-1);
</script>
<%
	}
	session.setAttribute("birth", birth);
	session.setAttribute("num", num);
	session.setMaxInactiveInterval(1000);
	response.sendRedirect(url);
%>
