<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/vnd.ms-excel;charset=euc-kr" %>
<%
   response.setHeader("Content-Disposition", "attachment; filename=test.xls;");
   response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
<title>�������Ϻ�ȯ</title>
<link rel="shorcut icon" href="../../../resources/static/img/fbgraph.png" type="image/x-icon">
<%
	    int total=0;
		List<StudentDataBean> students;
		if((List<StudentDataBean>)application.getAttribute("students") != null){
			 students = (List<StudentDataBean>)application.getAttribute("students");
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = sdb.listStudent();
		}
		
	%>
</head>
<body>
	<table>
		<tr>
			<th> �й� </th>
			<th> �̸� </th>
			<th> ��/���� </th>
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
			<th>���� </th>
			<td colspan=2><%=total %></td>
		</tr>
	</table>
</body>
</html>