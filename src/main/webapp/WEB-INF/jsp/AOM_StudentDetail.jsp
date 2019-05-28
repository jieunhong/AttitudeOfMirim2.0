<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>학생 페이지</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
	<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
<link rel="stylesheet" type="text/css" href="/resources/css/AOM_StudentDetail.css">
<link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
</head>
<body>
<header>
	<%@include file="top_student.jsp" %>
</header>
<main>
	<article>
	<span class="subtitle">
		<c:out value="${user.name}"/>님의 상세 내역
	</span>
		<%--<%
            if (data.pointList == null) {
        %>
        <b>등록된 상/벌점 정보가 없습니다.</b>
        <p>
            <a href="AOM_StudentMain.jsp">첫 화면으로 이동</a>
            <%
                application.setAttribute("num", num);
                } else {
            %>
    --%>
		<section>
			<table class="search">
				<tr>
					<th>날짜</th>
					<th>내용</th>
					<th>상점</th>
					<th>벌점</th>
					<th>선생님</th>
				</tr>

				<c:forEach items="${pointList}" var="list">
					<tr>
						<td><c:out value="${list.regDate}"/></td>
						<td><c:out value="${list.ptContent}"/></td>
						<td><c:out value="${list.ptPlus}"/></td>
						<td><c:out value="${list.ptMinus}"/></td>
						<td><c:out value="${list.regAdmin}"/></td>
					</tr>
				</c:forEach>
			</table>
		</section>
		<%--<%
            }
        %>--%>
	</article>
</main>
<footer>
	<%@include file="bottom_copyright.jsp" %>
</footer>
</body>
</html>
