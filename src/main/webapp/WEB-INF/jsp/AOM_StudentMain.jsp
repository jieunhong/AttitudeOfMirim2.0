<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    //[뒤로가기]버튼으로 보지 못하도록, no-cache로 설정
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    if (request.getProtocol().equals("HTTP/1.1")) {
        response.setHeader("Cache-Control", "no-cache");
        request.setCharacterEncoding("UTF-8");

    }
%>

<html>
<head>
    <title>학생 페이지</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_StudentMain.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
    <%
        try {

          /*  if (id == null) { // id가 Null 이거나 없을 경우
                response.sendRedirect("https://point.emirim.kr"); // 로그인 페이지로 리다이렉트 한다.
            }*/
        } catch (Exception err) {
            response.sendRedirect("https://point.emirim.kr");
        }
    %>
</head>
<body>
<%@include file="top_student.jsp" %>

<div class="container">
    <div id="info">
        <%--   <% user.setStu_name(num); %> --%>

            <c:out value="${user.name}" />님, <span class="light">환영합니다.</span><br/> <span
            class="light">현재 상벌점 총 합계는</span>
            <c:out value="${user.total}" />점<span class="light">입니다.</span>
    </div>
    <input type="submit" class="button" value="학년별 상/벌점 상세보기"
               onclick="location.href='/student/studentDetail'">
</div>
<%@include file="bottom_copyright.jsp" %>
</body>
</html>
