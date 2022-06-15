<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>${boardDTO.boardName}월드컵</title>
    <style>
        .exp{
            background-color: rgba(60, 229, 255, 0.37);
            background-size: cover;
            margin-left: 100px;
            width: 30%;
            height: 300px;
            display: inline-block;
        }
        .exp2{
            background-color: rgba(60, 229, 255, 0.37);
            background-size: cover;
            margin-left: 500px;
            width: 30%;
            height: 350px;
            display: inline-block;
        }
        .commentBlock{
            background-color: rgba(60, 229, 255, 0.37);
            background-size: cover;
            margin-top: 20px;
            width: 100%;
            height: auto;
        }
        .comment{
            display: inline-block;
        }
        .ranking{
            background-color: rgba(60, 229, 255, 0.37);
            background-size: cover;
            margin-top: -658px;
            width: 68%;
            height: 660px;
            display: inline-block;
        }
        .mainImg{
            width: 100%;
            max-width: 80%;
        }
        .text1{
            margin-top: -10px;
        }
        .text0{
            margin-left: 150px;
        }
        .ms-p0{
            margin-left: 5px;
        }
        .ms-n7{
            margin-left: -70px;
        }
        .img1{
            width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="float-end exp mt-5">
    <p class="h1 mt-1 mb-3 text-center">${boardDTO.boardName}</p>
        <div class="text0 mt-1">
            <p class="text1 ms-p0">제작자: ${boardDTO.memberId}</p>
            <p class="text1 ms-n7">작성일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${boardDTO.boardCreatedDate}"></fmt:formatDate></p>
            <p class="text1 ms-5">진행수: ${boardDTO.boardViews}</p>
        </div>
        <div class="text-center ms-2">
            <p>${boardDTO.boardExp}</p>
        </div>
    </div>
    <br/>
            <div class="float-end exp2 mt-2 text-center">
    <c:choose>
        <c:when test="${imageDTO.i_id != 0}">
                <br />
                <p class="h3">내가 선택한 이미지</p>
                <p class="h5 mt-2 mar">${imageDTO.imageName}</p>
                <img class="mainImg mt-3" src="${pageContext.request.contextPath}/upload/${imageDTO.imageManageName}">
        </c:when>
    </c:choose>
            </div>
    <div class="ranking position-relative">
        <div class="m-3">
            <br />
            <p class="h2 ms-3">Ranking</p>
        </div>
        <div class="m-3">
            <table class="table">
                <tr>
                    <td>순위</td>
                    <td>이미지</td>
                    <td>이름</td>
                    <td>선택횟수</td>
                    <td>비율</td>
                </tr>
                <c:choose>
                    <c:when test="${rankList.size() != 0}">
            <c:forEach var="i" begin="0" end="${rankList.size()-1}">
                <tr>
                    <td>${(i+1)+((paging.page - 1)*4)}</td>
                    <td><img class="img1" src="${pageContext.request.contextPath}/upload/${rankList.get(i).imageManageName}"></td>
                    <td>
                        ${rankList.get(i).imageName}
                    </td>
                    <td>${rankList.get(i).win}</td>
                    <td>${Math.round((rankList.get(i).win / boardDTO.boardViews * 100)*100)/100.0}%</td>
                </tr>
            </c:forEach>
                    </c:when>
                </c:choose>
            </table>
        </div>
        <div class="container position-absolute bottom-0 start-0">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${paging.page<=1}">
                        <li class="page-item disabled">
                            <a class="page-link">[이전]</a>
                        </li>
                    </c:when>
                    <%-- 1페이지가 아닌 경우에는 [이전] 클릭하면 현제페이지보다 1 작은 페이지 요청--%>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/comment?page=${paging.page-1}&b_id=${boardDTO.b_id}&i_id=${imageDTO.i_id}">[이전]</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <%--        for(int i = startPage; i<= endoage;i++)--%>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <c:when test="${i eq paging.page}">
                            <li class="page-item active">
                                <a class="page-link">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/board/comment?page=${i}&b_id=${boardDTO.b_id}&i_id=${imageDTO.i_id}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 마지막 페이지가 아닐 경우에는 다음 버튼으로 현제 페이지의 다음칸으로 이동 --%>
                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        <li class="page-item disabled">
                            <a class="page-link">[다음]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/comment?page=${paging.page+1}&b_id=${boardDTO.b_id}&i_id=${imageDTO.i_id}">[다음]</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <div class="commentBlock mb-3">
        <div class="comment">
            <div class="">
                <p class="h2 m-3">Comment</p>
            </div>
            <div class="m-3">
                asdsad
            </div>
        </div>
    </div>
</div>
</body>
</html>
