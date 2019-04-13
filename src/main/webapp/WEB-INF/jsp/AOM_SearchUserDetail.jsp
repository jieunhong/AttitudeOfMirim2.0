<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
</head>
<body>
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
            <td><c:out value="${list.regDate}" /></td>
            <td><c:out value="${list.ptContent}" /></td>
            <td><c:out value="${list.ptPlus}" /></td>
            <td><c:out value="${list.ptMinus}" /></td>
            <td><c:out value="${list.regAdmin}" /></td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
