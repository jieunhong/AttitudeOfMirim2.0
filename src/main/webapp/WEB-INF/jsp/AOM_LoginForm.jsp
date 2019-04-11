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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery.bpopup.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_LoginForm.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
    <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };


        var loginType = "user";

        $(document).ready(function () {

            console.log("© Copyright NEWMEDIA CONTENTS MIRIM MEISTER SCHOOL , Jieun Hong 2018. ALL RIGHTS RESERVED");
            console.log("페이지에 관한 문의사항은 hyy0786@e-mirim.hs.kr으로 연락 부탁드립니다.");

            $("#loginBtn").click(function () {
                loginUser();
            });
            $("ul li").click(function () {
                $("ul li").removeClass("active").css("color", "#333");
                $(this).addClass("active").css("color", "darkred");
                if(this.id == "loginUser"){
                    $("#currentId").css("display","inline");
                    loginType = "user";
                }else{
                    $("#currentId").css("display","none");
                    loginType = "admin";
                }
            });
        });

        var loginUser = function () {



            var payload = {};


            if(loginType == "user") {
                if ($("#currentId").val() == "") {
                    $('#loginErrorContent').html("학번을 입력해주세요");
                    $('#loginErrorPopup').bPopup();
                    return false
                }

                payload.currentId = $("#currentId").val();
            }

            if( $("#id").val() == "") {
                $('#loginErrorContent').html("비밀번호를 입력해주세요");
                $('#loginErrorPopup').bPopup();
                return false
            }else if($("#pwd").val() == ""){
                $('#loginErrorContent').html("비밀번호를 입력해주세요");
                $('#loginErrorPopup').bPopup();
                return false

            }

            payload.id = $("#id").val();
            payload.pwd = $("#pwd").val();

            alert(payload);
            console.log(payload);

            $.ajax({
                type: "POST",
                url: "login",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                mimeType: "application/json",
                data: JSON.stringify(payload),
                success: function (data) {
                    console.log(data);
                    if(data.resultCode == 1){
                        window.location = data.resultUrl;
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });

        }

        var closePopup = function(){
            $('#loginErrorPopup').bPopup().close();
        }

    </script>
    <%session.invalidate(); %>
</head>
<body>
<div class="top"></div>
<!--<div id="login-body"></div>-->
<div class="container">

    <div class="login-title">
        <a class="title-anim">Attitude</a>
        <a class="title-anim">
            <span class="title-anim">of Mirim</span>
        </a>
    </div>
    <div class="login-content">
        <ul id="loginType">
            <li class="active" id="loginUser" value="user"> 학생 로그인</li>
            <li id="loginAdmin" value="admin"> 선생님 로그인</li>
        </ul>
        <div id="loginUserForm"  class="login-user">
            <form method="post" >
                <input type="text" class="textbox" id="currentId" maxlength="50" placeholder="학번 입력"
                       required/>
                <input type="text" class="textbox" id="id" maxlength="50" placeholder="아이디 입력"
                       required/>
                <input type="password" class="textbox" id="pwd" maxlength="16" placeholder="비밀번호 입력"
                       required/>
                <input type="button" class="button-login" id="loginBtn" value="SIGN IN">
            </form>
        </div>

    </div>
</div>

<!--popup-->
<div id="loginErrorPopup" class="popup">
    <a onclick="closePopup()">
        <img class="close-button" src="/resources/img/icon_close.png">
    </a>
    <center>
        <div id="loginErrorContent"></div>
    </center>
</div>
</div>
<%@include file="bottom_copyright.jsp"%>
</body>
</html>
