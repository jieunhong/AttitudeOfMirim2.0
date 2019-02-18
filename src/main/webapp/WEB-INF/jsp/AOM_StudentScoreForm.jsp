<%@page import="mirim.stu.score.ScoreDataBean"%>
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
<link rel="stylesheet" type="text/css" href="css/AOM_StudentScoreForm.css">
<link rel="shorcut icon" href="../../../resources/static/img/fbgraph.png" type="image/x-icon">
	<%

    request.setCharacterEncoding("utf-8");
	    int total=0;
		List<ScoreDataBean> students;
		if((List<ScoreDataBean>)application.getAttribute("students_score") != null){
			 students = (List<ScoreDataBean>)application.getAttribute("students_score");

   		String searchStudent =(String) request.getParameter("searchStudent");
   		String  searchType = (String)request.getParameter("searchType");

			 System.out.println(students.toString());
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = new ArrayList();
		}
    %>
</head>
<body>
	<%@include file="top_teacher.jsp"%>
  <div class="container">
  	<div class="subtitle">학생별 상/벌점 상세 검색</div>

	<form method="post" action="AOM_StudentScorePro.jsp">

		<i class="fa fa-search" aria-hidden="true"></i>
	  	<select name="searchType" value="stuName">
        <option value="stuNum">학번</option>
        <option value="stuName">이름</option>
      </select>
		  <input type="text" name="searchStudent" id="searchStudent" value="${searchStudent}">
		  <input type="submit" class="button" value="검색">

	</form>
		<table>
		<tr>
			<th> 학번 </th>
      <th> 이름 </th>
			<th> 날짜 </th>
			<th> 내용 </th>
			<th> 선생님 </th>
			<th> 상점 </th>
			<th> 벌점 </th>
		</tr>

		<%

		for(int i=0; i<students.size(); i++){
			ScoreDataBean scoredata = students.get(i);
			total += scoredata.getSc_plus()+scoredata.getSc_minus();
			%>
   		<tr>
   			<td><%=scoredata.getSc_num() %></td>
        <td><%=scoredata.getSc_birth_name().substring(6)%></td>
   			<td><%=scoredata.getSc_date().toString() %></td>
   			<td><%=scoredata.getSc_content() %></td>
   			<td><%=scoredata.getSc_teacher() %></td>
   			<td><%=scoredata.getSc_plus()%></td>
   			<td><%=scoredata.getSc_minus()%></td>
   		</tr>
   	<%
		}
		%>
		<tr>
			<th>총점 </th>
			<td colspan=6><%=total %></td>
		</tr>
		</table>

  </div>

    <%@include file="bottom_copyright.jsp"%>
        <!--  	<%@include file="bottom_copyright.jsp"%>-->
</body>
</html>
