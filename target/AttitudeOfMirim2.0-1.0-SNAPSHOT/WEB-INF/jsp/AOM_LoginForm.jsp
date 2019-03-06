<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
    //[뒤로가기]버튼으로 보지 못하도록, no-cache로 설정
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    if (request.getProtocol().equals("HTTP/1.1")) {
        response.setHeader("Cache-Control", "no-cache");
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Attitude of Mirim</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_LoginForm.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
    <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
        console.log("© Copyright NEWMEDIA CONTENTS MIRIM MEISTER SCHOOL , Jieun Hong 2018. ALL RIGHTS RESERVED");
        console.log("페이지에 관한 문의사항은 hyy0786@e-mirim.hs.kr으로 연락 부탁드립니다.");
    </script>
    <%session.invalidate(); %>
</head>
<body>
<div class="top"></div>
<!--<div id="login-body"></div>-->
<div class="container">
    <div id="login-padding">
        <div  id="login-content">
            <div id="login-title" >
                <a>Attitude</a>
                <a>
                    <span>of Mirim</span>
                </a>
            </div>
            <form method="post" action="AOM_LoginPro.jsp">
                <input type="text" class="textbox" name="num" maxlength="50" placeholder="학번 입력" required/><br />
                <input type="number" class="textbox" name="birth" maxlength="50" placeholder="생년월일 입력(6자리)" required/><br />
                <input type="password" class="textbox" name="passwd" maxlength="16" placeholder="비밀번호 입력" required /><br />
                <input type="submit" id="button-login" value="SIGN IN">
            </form>
        </div>
    </div>
</div>
<%@include file="bottom_copyright.jsp"%>
</body>
</html>
