<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-16
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-2">
    <div class="m-3">
        <table class="table table-info text-center">
            <tr class="table-active">
                <th scope="col">#</th>
                <th scope="col">아이디</th>
                <th scope="col">회원이름</th>
                <th scope="col">이메일</th>
                <th scope="col">삭제</th>
            </tr>
            <c:forEach var="member" items="${memberList}">
                <tr>
                    <th scope="row">${member.m_id}</th>
                    <td>${member.memberId}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberEmail}</td>
                    <td><button class="btn btn-outline-info" onclick="location.href='/member/delete?m_id=${member.m_id}'">삭제</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
