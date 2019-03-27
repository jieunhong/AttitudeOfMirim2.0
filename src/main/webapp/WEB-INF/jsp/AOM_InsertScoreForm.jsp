<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>선생님 페이지</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery.bpopup.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_InsertScoreForm.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">
    <%--  <%
      try{
        String id = session.getAttribute("num").toString(); // request에서 id 파라미터를 가져온다

        if (id == null) { // id가 Null 이거나 없을 경우
          response.sendRedirect("https://point.emirim.kr"); // 로그인 페이지로 리다이렉트 한다.
        }
      }catch(Exception err){
        response.sendRedirect("https://point.emirim.kr");
      }
      %>--%>
</head>
<script type="text/javascript">
    var curpage = 1;

    $(document).ready(function () {

        $("#insertBtn").click(function () {
            insertPoint();
        })


    });
    var insertPoint = function () {

        var id = $("#grade").val() + $("#class").val() + $("#num").val();
        var payload = {};


        payload.ptPlus = 0;
        payload.ptMinus = 0;

        if ($("#point").val() > 0) {
            payload.ptPlus = $("#point").val();
        } else if ($("#point").val() < 0) {
            payload.ptMinus = $("#point").val();
        }
        payload.ptContent = $("#content").val();
        payload.ptNum = id;

        //로그인 기능이 구현이 안되어있으므로 일단은 강제로 넣기
        payload.regAdmin="관리자테스트";
        console.log(payload);
        $.ajax({
            type: "POST",
            url: "insertPoint",
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            mimeType: "application/json",
            data: JSON.stringify(payload),
            success: function (data) {
                console.log(data);
                if(data.resultCode == 1) {
                    alert("추가 완료");
                }else{
                    alert("["+data.resultCode+"]"+data.resultMessage);
                }
            },
            error: function (e) {
                alert("에러남");
                console.log(e);
            }
        });

    }
    var closePopup = function () {
        $('#searchUserDetailPopup').bPopup().close();
    }


</script>
<body>
<%@include file="top_teacher.jsp" %>
<div class="container">
    <div class="subtitle">상/벌점 추가</div>

    <form method="post">
        <div id="insert">
            <table>
                <colgroup>
                    <col width="25%"/>
                    <col width="75%"/>
                </colgroup>
                <tr>
                    <td>학번</td>
                    <td>
                        <select id="grade">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                        학년 &nbsp; &nbsp;
                        <select id="class">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                        반 &nbsp; &nbsp;
                        <select id="num">
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="!8">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                        </select>
                        번 &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea class="textbox" rows="1" cols="20" id="content"></textarea></td>
                </tr>
                <tr>
                    <td>상/벌점</td>
                    <td>
                        <select id="point">
                            <option value="10">10</option>
                            <option value="9">9</option>
                            <option value="8">8</option>
                            <option value="7">7</option>
                            <option value="6">6</option>
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                            <option value="2">2</option>
                            <option value="1">1</option>
                            <option value="0" selected="selected">0</option>
                            <option value="-1">-1</option>
                            <option value="-2">-2</option>
                            <option value="-3">-3</option>
                            <option value="-4">-4</option>
                            <option value="-5">-5</option>
                            <option value="-6">-6</option>
                            <option value="-7">-7</option>
                            <option value="-8">-8</option>
                            <option value="-9">-9</option>
                            <option value="-10">-10</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <input type="button" id="insertBtn" class="button" value="상/벌점 추가">
    </form>
</div>

<%@include file="bottom_copyright.jsp" %>
</body>
</html>
