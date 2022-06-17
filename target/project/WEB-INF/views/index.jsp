<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>이상형 월드컵</title>
    <style>
        .aa{
            background-size: cover;
            background-color: white;
            display: inline-flex;
        }
        .search{
            background-size: cover;
            background-color: rgba(60, 229, 255, 0.37);
            border-radius: 20px 20px 0px 0px;
            margin-top: -61px;
            display: inline-block;

        }
        .searchBox{
            margin-top: 15px;
            margin-left: 20px;
            margin-right: 20px;
        }
        .main1{
            width: 95%;
            background-size: cover;
            border-radius: 20px 0px 20px 20px;
            background-color: rgba(60, 229, 255, 0.37);
            display: inline-block;
        }
        .aa3{
            margin: 50px 100px 100px 100px;
        }
    </style>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
<div class="mt-5 container-xl position-relative">
<div class="main container-xl aa3">
    <p class="text-center h1 m-5" onclick="location.href='/'">이상형 월드컵</p>
</div>
<div class="search position-absolute end-0">
    <div class="searchBox">
    <form action="/board/search" method="get">
        <select name="searchType">
            <option value="boardName">제목</option>
            <option value="memberId">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어 입력">
        <input type="submit" value="검색">
    </form>
    </div>
</div>

    <div class="main1 position-absolute end-0">
        <div class="m-3">
    <c:forEach var="board" items="${boardList}">
        <div class="m-3 aa">
            <div class="border border-1 border-secondary" style="padding: 2px; width: 200px; height: 350px;">
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
                <p class="text-center h5">${board.boardName}&nbsp;</p>
                <div class="text-center small m-1">${board.boardExp}&nbsp;</div>
                <a href="/board/select?b_id=${board.b_id}" class="btn btn-sm btn-outline-success mb-2 ms-2">시작하기</a>
                <a href="/board/comment?b_id=${board.b_id}&i_id=0" class="btn btn-sm btn-outline-warning mb-2 ms-3">랭킹보기</a>
                <c:if test="${sessionScope.memberId eq 'admin'}">
                    <button type="button" onclick="location.href='/board/board-delete?b_id=${board.b_id}'" class="btn btn-sm btn-outline-danger ms-2">삭제하기</button>
                </c:if>
            </div>
        </div>
    </c:forEach>
    </div>
</div>
</div>
</body>
</html>
