<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>이상형 월드컵</title>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <div class="container mt-3">
        <h1 class="mt-3">이상형 월드컵</h1>
        num:${sessionScope.m_id}<br />
        id:${sessionScope.memberId}<br />
        name:${sessionScope.memberName}<br />
        <a href="/member/login">로그인</a>
        <a href="/member/save">회원가입</a>
        <a href="/member/logout">로그아웃</a>
    </div>
</body>
</html>
