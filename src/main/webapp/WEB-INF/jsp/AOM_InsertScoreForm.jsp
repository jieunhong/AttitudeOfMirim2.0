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

    var selectPoint = `<td><select id="point">
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
            </select></td>`

    $(document).ready(function () {

        $("#insertBtn").click(function () {
            insertPoint();
        });

        $("#searchUserBtn").click(function () {

            var currentId = $("#grade").val() + $("#class").val() + $("#num").val();

            var currentUserList =$("#selectUserList tbody span#id ");

            currentUserList.each(function(i){
                if(currentUserList.eq(i).text() == currentId){
                    alert("이미 동일한 학생이 추가되어있습니다.");
                    currentId = '';
                    return false;
                }
            });

            if (currentId != '') {
                searchUser(currentId);
            }
        });


        $('#selectUserList').on("click", "button", function() {
            $(this).closest("tr").remove()
        });

    });
    var insertPoint = function () {

        var payload = [];
        var insertUserList = $("#selectUserList tbody tr ")

        insertUserList.each(function(i){
            var user = {};
            user.ptNum = insertUserList.eq(i).find("#id").text();
            user.ptContent =  insertUserList.eq(i).find("#content").val();
            if(insertUserList.eq(i).find("#point").val() > 0) {
                user.ptPlus = insertUserList.eq(i).find("#point").val() ;
            }else{
                user.ptMinus = insertUserList.eq(i).find("#point").val() ;
            }
            payload.push(user);
        });
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
                    alert("상/벌점 추가가 완료되었습니다");
                    location.href=("/teacher/main");
                }else{
                    alert("["+data.resultCode+"]"+data.resultMessage);
                }
            },
            error: function (e) {
                alert("상/벌점 추가중 에러가 발생했습니다.");
                console.log(e);
            }
        });

    }
    var searchUser = function (currentId) {

        $.ajax({
            type: "POST",
            url: "getUserByCurrentId",
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            mimeType: "application/json",
            data: currentId,
            success: function (data) {
                if(data != null) {

                    var pushContents ="";
                    var totalPoint = 0;
                        pushContents += ("<tr>");
                        pushContents += ("<td><span id='id'>" + data.currentId + "</span></td>");
                        pushContents += ("<td>" + data.name + "</td>");
                        pushContents += ("<td>" + data.total + "</td>");
                        pushContents += selectPoint;
                        pushContents += ('<td><textarea class="textbox" rows="1" cols="20" id="content"></textarea></td>');
                        pushContents += ("<td>" + "<button type='button'> 삭제 </button> </td>");
                        pushContents += ("</tr>");
                    $("#selectUserList").append(pushContents);

                }else{
                    alert(id+": 요청하신 학생의 정보가 없습니다.");
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
<header>
    <%@include file="top_teacher.jsp" %>
    \
</header>
<main>
    <article class="art_insert_score">
        <div class="title">상/벌점 추가</div>
        <section>
            <span>학번</span>
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
            <input type="button" id="searchUserBtn" class="button" value="추가하기" style="width:100px;">
        </section>
        <section>
            <div style=" overflow:auto; margin: auto; padding: 10px; height: 200px; width: 820px; background: white; border-radius: 30px">
                <table id="selectUserList" class="table_user" >
                    <thead>
                    <tr>
                        <th>학번</th>
                        <th>이름</th>
                        <th>현재 상/벌점</th>
                        <th>상/벌점</th>
                        <th>내용</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </section>
        <input type="button" id="insertBtn" class="button" value="상/벌점 추가">
    </article>
</main>
<footer>
    <%@include file="bottom_copyright.jsp" %>
</footer>
</body>
</html>
