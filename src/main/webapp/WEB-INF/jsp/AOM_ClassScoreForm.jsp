<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>선생님 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_ClassScoreForm.css">
<link rel="shorcut icon" href="../../../resources/static/img/fbgraph.png" type="image/x-icon">
	<%
	String id = ""+session.getAttribute("num");            // request에서 id 파라미터를 가져온다


	if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우

	response.sendRedirect("AOM_LoginForm.jsp");    // 로그인 페이지로 리다이렉트 한다.

	}


	    int total=0;
		List<StudentDataBean> students;
		if((List<StudentDataBean>)application.getAttribute("students_class") != null){
			 students = (List<StudentDataBean>)application.getAttribute("students_class");
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = sdb.listStudent();

		}


		String grade = request.getParameter("grade");
		String class1 = request.getParameter("class");
		grade = (grade == null)? "1" : grade;
		class1 = (class1 == null)? "1" : class1;
		System.out.println("선택값" + grade + class1);
	%>
</head>
<body>

	<%@include file="top_teacher.jsp"%>
<div class="container">
  	<div class="subtitle">반별 상/벌점 상세 검색</div>

  	<form method="post" action="AOM_ClassScorePro.jsp">

   		<i class="fa fa-search" aria-hidden="true"></i>

	   <select name="grade" id="grade"  required>
	   	<option value=1 <%=grade.equals("1") ? "selected" : ""%> >1</option>
	   	<option value=2 <%=grade.equals("2") ? "selected" : ""%> >2</option>
	   	<option value=3 <%=grade.equals("3") ? "selected" : ""%> >3</option>
	   </select>
	     학년 &nbsp; &nbsp;

	     <select name="class" id="class"  required>
	   	<option value=1 <%=class1.equals("1") ? "selected" : ""%> >1</option>
	   	<option value=2 <%=class1.equals("2") ? "selected" : ""%> >2</option>
	   	<option value=3 <%=class1.equals("3") ? "selected" : ""%> >3</option>
	   	<option value=4 <%=class1.equals("4") ? "selected" : ""%> >4</option>
	   	<option value=5 <%=class1.equals("5") ? "selected" : ""%> >5</option>
	   	<option value=6 <%=class1.equals("6") ? "selected" : ""%> >6</option>
	   </select>
	     반 &nbsp; &nbsp;

	   <input type="submit" class="button" value="검색">

   </form>
		<table>
		<tr>
			<th> 학번 </th>
			<th> 이름 </th>
			<th> 상/벌점 </th>
		</tr>

		<%

		for(int i=0; i<students.size(); i++){
			StudentDataBean student = students.get(i);
			total += student.getStu_total();
			%>
   		<tr>
   			<td><%=student.getStu_num() %></td>
   			<td><%=student.getStu_name() %></td>
   			<td><%=student.getStu_total()%></td>
   		</tr>
   	<%
		}
		%>
		<tr>
			<th>총점 </th>
			<td colspan=2><%=total %></td>
		</tr>
		</table>

  </div>

    <%@include file="bottom_copyright.jsp"%>

</body>
</html>
