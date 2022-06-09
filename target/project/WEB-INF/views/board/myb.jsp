<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>내가만든 월드컵</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-3 row">
<c:forEach var="board" items="${boardList}">
<div class="m-3 col-sm-3">
    <div class="col-xl-6 col-sm-3 col-lg-2 border border-1 border-secondary" style="padding: 2px; width: 200px; height: 330px;">
        <div class="border border-1" style="height: 200px;padding: 0px">

        </div>
        <a>${board.boardName}</a>
        <div class="small">${board.boardExp}</div>
        <a href="" class="btn btn-sm btn-outline btn-danger mb-2">시작하기</a>
        <a href="" class="btn btn-sm btn-outline btn-warning mb-2">랭킹보기</a>
        <button type="button" onclick="location.href='/board/update?b_id=${board.b_id}'" class="btn btn-sm btn-outline btn-info mb-2">수정</button>
    </div>
</div>
</c:forEach>
</div>
</body>
</html>