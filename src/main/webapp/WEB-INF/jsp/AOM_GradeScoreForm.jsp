<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="mirim.stu.score.ScoreDataBean"%>
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
<link rel="stylesheet" type="text/css" href="css/AOM_GradeScoreForm.css">
<link rel="shorcut icon" href="../../../resources/static/img/fbgraph.png" type="image/x-icon">
	<%
	String id = "" + session.getAttribute("num");            // request에서 id 파라미터를 가져온다


	if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우
    %>
    <script>
      alert("세션이 만료되었습니다. 다시 로그인해주세요.");
    </script>
    <%
	response.sendRedirect("AOM_LoginForm.jsp");    // 로그인 페이지로 리다이렉트 한다.

	}


	int total=0;
		List<StudentDataBean> students;
		if((List<StudentDataBean>)application.getAttribute("students") != null){
			 students = (List<StudentDataBean>)application.getAttribute("students");
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = sdb.listStudent();

		}

		String grade = request.getParameter("grade");
		grade = (grade == null)? "1" : grade;
		System.out.println(grade + "학년");
	%>
</head>
<body>
	<%@include file="top_teacher.jsp"%>

    <div class="container">
	<div class="subtitle">학년별 상/벌점 상세 검색</div>

  	<form method="post" action="AOM_GradeScorePro.jsp">

   		<i class="fa fa-search" aria-hidden="true"></i>

	   <select name="grade" id="grade"  required>
	   	<option value=1 <%=grade.equals("1") ? "selected" : ""%> >1</option>
	   	<option value=2 <%=grade.equals("2") ? "selected" : ""%> >2</option>
	   	<option value=3 <%=grade.equals("3") ? "selected" : ""%> >3</option>
	   </select>
	     학년 &nbsp; &nbsp;

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
				StudentDataBean studentdata = students.get(i);
				total += studentdata.getStu_total();
				%>
	   		<tr>
	   		  <td><%=studentdata.getStu_num() %></td>
	   			<td><%=studentdata.getStu_name() %></td>
	   			<td><%=studentdata.getStu_total()%></td>
	   		</tr>
	   	<%
			}
			%>
			<tr>
				<th>총점 </th>
				<td colspan=2><%=total %></td>
			</tr>
		</table>
 		<i class="fa fa-download" aria-hidden="true"></i>
 		<input type="button" class="button" id="button-excel" value="엑셀로 다운로드" onclick="location.href='ExcelTest.jsp'">
    </div>

    	<%@include file="bottom_copyright.jsp"%>
    <!--  	<%@include file="bottom_copyright.jsp"%>-->
</body>
</html>
