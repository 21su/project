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
    <style>
        .aa{
            display: inline-flex;
        }
        .main{
            margin-top: 60px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main container-xl">
    <p class="text-center h1 m-5">내가 만든 월드컵</p>
<c:forEach var="board" items="${boardList}">
<div class="m-3 aa">
    <div class="border border-1 border-secondary" style="padding: 2px; width: 200px; height: 330px;">
        <div class="border border-1" style="height: 200px;padding: 0px">
            <c:forEach var="i" begin="1" end="2" step="1">
                <c:choose>
                    <c:when test="${listMap.get(board.b_id).get(i-1) == null}">
                        <img src="${pageContext.request.contextPath}/upload/기본프로필.jpg" alt="" height="198" width="93">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/upload/${listMap.get(board.b_id).get(i-1).imageManageName}" alt="" height="198" width="93">
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <a>${board.boardName}&nbsp;</a>
        <div class="small">${board.boardExp}&nbsp;</div>
        <a href="/board/select?b_id=${board.b_id}" class="btn btn-sm btn-outline-success mb-2">시작하기</a>
        <a href="/board/comment?b_id=${board.b_id}&i_id=0" class="btn btn-sm btn-outline-warning mb-2">랭킹보기</a>
        <button type="button" onclick="location.href='/board/update?b_id=${board.b_id}'" class="btn btn-sm btn-outline-info mb-2">수정하기</button>
        <button type="button" onclick="location.href='/board/delete-board?b_id=${board.b_id}&memberId=${memberId}'" class="btn btn-sm btn-outline-danger mb-2">삭제하기</button>
    </div>
</div>
</c:forEach>
</div>
</body>
</html>
