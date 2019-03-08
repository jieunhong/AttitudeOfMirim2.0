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
<%@include file="top_teacher.jsp" %>
<style>
    .hand, .button {
        cursor: pointer;
    }
</style>

<div class="container">
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
                     onclick="location.href='AOM_InsertScoreForm.jsp'"></td>
            <td><img src="/resources/img/2.jpg" width=150 height=150 class="hand"
                     onclick="location.href='AOM_GradeScoreForm.jsp'"></td>
            <td><img src="/resources/img/3.jpg" width=150 height=150 class="hand"
                     onclick="location.href='AOM_ClassScoreForm.jsp'"></td>
            <td><img src="/resources/img/4.jpg" width=150 height=150 class="hand"
                     onclick="location.href='AOM_StudentScoreForm.jsp'"></td>
        </tr>
        <tr>
            <td><input type="submit" class="button" value="상/벌점 추가하기"
                       onclick="location.href='/teacher/insertPoint'"></td>
            <td><input type="submit" class="button" value="학년별 상/벌점 상세보기"
                       onclick="location.href='/teacher/searchUser'"></td>
            <td><input type="submit" class="button" value="반별 상/벌점 상세보기"
                       onclick="location.href='AOM_ClassScoreForm.jsp'"></td>
            <td><input type="submit" class="button" value="학생별 상/벌점 상세보기"
                       onclick="location.href='AOM_StudentScoreForm.jsp'"></td>
        </tr>
    </table>
</div>
<%@include file="bottom_copyright.jsp" %>
</body>
</html>
