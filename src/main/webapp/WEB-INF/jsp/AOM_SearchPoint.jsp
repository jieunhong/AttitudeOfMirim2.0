<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <title>선생님 페이지</title>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/AOM_ClassScoreForm.css">
    <link rel="shorcut icon" href="/resources/img/fbgraph.png" type="image/x-icon">


    <script type="text/javascript">
        var curpage = 1;

        $(document).ready(function () {
           searchPointList();

        });
        var searchPointList = function(pageIndex){
            if(pageIndex === undefined){
                pageIndex = curpage;
            }

            var payload = {};
            //payload.pageIndex;

            payload.name = $("#name").val();
            payload.class = $("#class").val();
            payload.grade = $("#grade").val();
            payload.number = $("#number").val();
            alert(payload.toString());
        }
    </script>
</head>
<body>
<%@include file="top_teacher.jsp" %>
<div class="container">
    <div class="subtitle">반별 상/벌점 상세 검색</div>

    <form method="post">

        <i class="fa fa-search" aria-hidden="true"></i>

        <select name="grade" id="grade" required>
            <option value=0>전체</option>
            <option value=1>1</option>
            <option value=2>2</option>
            <option value=3>3</option>
        </select>
        학년 &nbsp; &nbsp;

        <select name="class" id="class" required>
        <option value=1>전체</option>
        <option value=1>1</option>
        <option value=2>2</option>
        <option value=3>3</option>
        <option value=4> 4</option>
        <option value=5> 5</option>
        <option value=6>6</option>
    </select>
        반 &nbsp; &nbsp;

        <select name="class" id="number" required>
            <option value=1>전체</option>
            <option value=1>1</option>
            <option value=2>2</option>
            <option value=3>3</option>
            <option value=4> 4</option>
            <option value=5> 5</option>
            <option value=6>6</option>
            <option value=7> 7</option>
            <option value=8> 8</option>
            <option value=9> 9</option>
            <option value=10> 10</option>
            <option value=11>11</option>
            <option value=12>12</option>
            <option value=13>13</option>
            <option value=14> 14</option>
            <option value=15> 15</option>
            <option value=16>6</option>
            <option value=17> 7</option>
            <option value=18> 8</option>
            <option value=19> 9</option>
            <option value=20> 10</option>
        </select>
        번 &nbsp; &nbsp;

        이름
        <input type="text" id="name">
        &nbsp; &nbsp;

        <input type="submit" class="button" value="검색">

    </form>
    <table>
        <tr>
            <th> 학번</th>
            <th> 이름</th>
            <th> 상/벌점</th>
        </tr>

        <tr>

        </tr>
        <tr>
            <th>총점</th>
            <td colspan=2>
            </td>
        </tr>
    </table>

</div>

<%@include file="bottom_copyright.jsp" %>

</body>
</html>
