<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
	request.setCharacterEncoding("utf-8");
	try{
		String id = session.getAttribute("num").toString(); // request에서 id 파라미터를 가져온다

		if (id == null) { // id가 Null 이거나 없을 경우
			response.sendRedirect("https://point.emirim.kr"); // 로그인 페이지로 리다이렉트 한다.
		}
	}catch(Exception err){
		response.sendRedirect("https://point.emirim.kr");
	}
%>


<%
	String teacherNum = "" + session.getAttribute("num").toString(); // request에서 id 파라미터를 가져온다
	String teacherBirth = "" + session.getAttribute("birth").toString();

	String grade = request.getParameter("grade");
	String stuClass = request.getParameter("class");
	String num = request.getParameter("num");
	String content = request.getParameter("content");
	String plus = request.getParameter("plus");
	String minus = request.getParameter("minus");
	String real_Num = grade + stuClass + num;

	MirimDBBean sdb = new MirimDBBean();
	StudentDataBean student = sdb.searchStudent(real_Num, "");
	StudentDataBean teacher = sdb.searchStudent(teacherNum, teacherBirth);

	ScoreDataBean score = new ScoreDataBean();
	score.setSc_num(Integer.parseInt(real_Num));
	score.setSc_content(content);
	score.setSc_birth_name((student.getStu_birth() + student.getStu_name()).trim());
	score.setSc_minus(Integer.parseInt(minus));
	score.setSc_plus(Integer.parseInt(plus));
	score.setSc_teacher(teacher.getStu_name());
	sdb.insertScore(score);
%>
<html>
<head>
<script>

var i = 0;
var txt = '상/벌점 추가중입니다. 잠시만 기다려주세요.';
$(document).ready(function() {
loadingType();
});

function loadingType() {
  if (i < txt.length) {
    var str = document.getElementById("loadingText").value;
    document.getElementById("loadingText").innerHTML=txt.substring(0,i);
    document.getElementById("loadingText").innerHTML += txt.charAt(i)+"_";
    i++;
    setTimeout(loadingType, 80);
  }else{
    document.getElementById("loadingText").innerHTML=txt;
		setTimeout(function() {
  location.href='AOM_TeacherMain.jsp';}, 1500);

  }
}
</script>
</head>
<body>
	<a href="#"> <%@include file="top_teacher.jsp"%>
	</a>
	<center>
		<div id="loadingText" style=" margin: 100px auto; font-size:25px; font-weight:100; color: #484848;"></div>
	</center>
</body>
</html>
