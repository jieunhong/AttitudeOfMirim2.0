<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--
//[뒤로가기]버튼으로 보지 못하도록, no-cache로 설정
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
if (request.getProtocol().equals("HTTP/1.1")) {
response.setHeader("Cache-Control", "no-cache");
}
--%>

<html>
<head>
    <title>선생님 페이지</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery.bpopup.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_TeacherMain.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
    <%--
    <%

    try{
      String id = session.getAttribute("num").toString(); // request에서 id 파라미터를 가져온다

      if (id == null) { // id가 Null 이거나 없을 경우
        response.sendRedirect("https://point.emirim.kr"); // 로그인 페이지로 리다이렉트 한다.
      }
    }catch(Exception err){
      response.sendRedirect("https://point.emirim.kr");
    }
    %>--%>

    <script>

    </script>
</head>
<body>
<header>
    <%@include file="top_teacher.jsp" %>
</header>
<style>
    .hand, .button {
        cursor: pointer;
    }
</style>
<main>
    <table>
        <tr>
            <br>
            <br>
            <br>
        </tr>
        <tr>
        </tr>
        <tr>
            <td><img src="/resources/img/1.jpg" width=150 height=150 class="hand"
                     onclick="location.href='/teacher/manageUser'"></td>
            <td><img src="/resources/img/2.jpg" width=150 height=150 class="hand"
                     onclick="location.href='/teacher/searchUser'"></td>
        </tr>

        <tr>
            <td><input type="submit" class="button" value="상/벌점 관리하기"
                       onclick="location.href='/teacher/manageUser'"></td>
            <td><input type="submit" class="button" value="학년별 상/벌점 상세보기"
                       onclick="location.href='/teacher/searchUser'"></td>
        </tr>
    </table>
</main>
<footer>
<%@include file="bottom_copyright.jsp" %>
</footer>
</body>
</html>
