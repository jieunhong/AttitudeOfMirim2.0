<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <title>선생님 페이지</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery.bpopup.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_ClassScoreForm.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">


    <style>
        #searchUserDetailPopup {
            display: none;
            background: white;
            width: 70%;
            height: 50%;
        }
    </style>
    <script type="text/javascript">
        var curpage = 1;

        $(document).ready(function () {
            searchPointList();

            $("#searchBtn").click(function () {
                searchPointList();
            })




        });
        var searchPointList = function (pageIndex) {
            if (pageIndex === undefined) {
                pageIndex = curpage;
            }

            var payload = {};
            //payload.pageIndex;

            if ($("#grade").val() == "0") {
                payload.currentId = "^.{1}";
            } else {
                payload.currentId = "^" + $("#grade").val();
            }

            if ($("#class").val() == "0") {
                payload.currentId += ".{1}";
            } else {
                payload.currentId += $("#class").val();
            }

            if ($("#number").val() == "0") {
                payload.currentId += ".{2}$"
            } else {
                payload.currentId += $("#number").val() + "$";
            }

            if ($("#name").val() !== "" && $("#name").val() !== undefined) {
                payload.name = $("#name").val();
            }

            alert(payload);
            console.log(payload);
            $.ajax({
                type: "POST",
                url: "searchUserList",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                mimeType: "application/json",
                data: JSON.stringify(payload),
                success: function (data) {
                    console.log(data);
                    // TODO :: List부분 Jsp 분리해야함
                    onSuccessList(data);
                    return false;
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }

        onSuccessList = function (data) {
            var pushContents = [];
            var totalPoint = 0;
            pushContents.push("<table>");
            pushContents.push("<tr>");
            pushContents.push("<th> 학번 </th>");
            pushContents.push("<th> 이름 </th>");
            pushContents.push("<th> 상/벌점</th>");
            pushContents.push("</tr>");

            $.each(data.userList, function (i, item) {
                pushContents.push("<tr>");
                pushContents.push("<td>" + item['currentId'] + "</td>");
                pushContents.push("<td>" + "<a href='javascript: searchStudentDetail(" + item['id'] + ")'>" + item['name'] + "</a> </td>");
                pushContents.push("<td>" + (item['total']) + "</td>");
                pushContents.push("</tr>");

                totalPoint += item["total"];
            });

            pushContents.push("<tr>");
            pushContents.push("<th> 총점 </th>");
            pushContents.push("<td colspan='2'>" + totalPoint + "</td>");
            pushContents.push("</tr>");
            pushContents.push("</table>");
            $("#searchUserList").html(pushContents);
        }

        var searchStudentDetail = function (userId) {

            alert(userId);
            $.ajax({
                type: "POST",
                url: "searchUserDetail",
                dataType: "text",
                contentType: 'application/json; charset=utf-8',
                mimeType: "application/json",
                data: JSON.stringify(userId),
                success: function (data) {
                    console.log(data);
                    $("#searchUserDetailContent").html(data);
                    $('#searchUserDetailPopup').bPopup();
                },
                error: function (e) {
                    alert("에러남");
                    console.log(e);
                }
            });

        }
        var closePopup = function(){
            $('#searchUserDetailPopup').bPopup().close();
        }


    </script>
</head>
<body>
<%@include file="top_teacher.jsp" %>
<div class="container">

    <div class="subtitle">반별 상/벌점 상세 검색</div>

    <form method="post" action="">

        <i class="fa fa-search" aria-hidden="true"></i>

        <select name="grade" id="grade" required>
            <option value="0">전체</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        학년 &nbsp; &nbsp;

        <select name="class" id="class" required>
            <option value="0">전체</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4"> 4</option>
            <option value="5"> 5</option>
            <option value="6">6</option>
        </select>
        반 &nbsp; &nbsp;

        <select name="class" id="number" required>
            <option value="0">전체</option>
            <option value="01"> 1</option>
            <option value="02"> 2</option>
            <option value="03"> 3</option>
            <option value="04"> 4</option>
            <option value="05"> 5</option>
            <option value="06"> 6</option>
            <option value="07"> 7</option>
            <option value="08"> 8</option>
            <option value="09"> 9</option>
            <option value="10"> 10</option>
            <option value="11"> 11</option>
            <option value="!2"> 12</option>
            <option value="13"> 13</option>
            <option value="!4"> 14</option>
            <option value="15"> 15</option>
            <option value="!6"> 16</option>
            <option value="!7"> 17</option>
            <option value="18"> 18</option>
            <option value="19"> 19</option>
            <option value="20"> 20</option>
        </select>
        번

        <br>

        이름
        <input type="text" id="name">
        &nbsp; &nbsp;

        <input type="button" id="searchBtn" class="button" value="검색">

        <br>

    </form>
    <div id="searchUserList"></div>
    <div id="searchUserDetailPopup">
        <a onclick="closePopup()">
            <img class="close-button" src="/resources/img/icon_close.png">
        </a>
        <center>
            <div id="searchUserDetailContent"></div>
        </center>
    </div>


</div>

<%@include file="bottom_copyright.jsp" %>

</body>
</html>
