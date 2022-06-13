<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 9:20
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
    <title>월드컵</title>
    <style>
        .box{
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            position: relative;
        }
        .box .box_in{
            width: 500px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -250px;
            margin-top: -300px;
            background-color: rgba(199, 238, 255, 0.65);
        }
        .box .btn1{
            position: absolute;
            left: 50%;
            top: 100%;
            margin-left: -30px;
            margin-top: -50px;
        }
    </style>
    <script>
        const mainStart = () => {
            if(${boardDTO.boardSecret != 3}){
                roundCheck.submit();
            }
        }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="box">
        <div class="box_in rounded-3">
            <div class="container text-white text-center">
                <p class="mt-2 text-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-trophy" viewBox="0 0 16 16">
                    <path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935zM3.504 1c.007.517.026 1.006.056 1.469.13 2.028.457 3.546.87 4.667C5.294 9.48 6.484 10 7 10a.5.5 0 0 1 .5.5v2.61a1 1 0 0 1-.757.97l-1.426.356a.5.5 0 0 0-.179.085L4.5 15h7l-.638-.479a.501.501 0 0 0-.18-.085l-1.425-.356a1 1 0 0 1-.757-.97V10.5A.5.5 0 0 1 9 10c.516 0 1.706-.52 2.57-2.864.413-1.12.74-2.64.87-4.667.03-.463.049-.952.056-1.469H3.504z"/>
                </svg>
                </p>
                <p class="h3 text-center mt-2\">${boardDTO.boardName} 월드컵</p>
                <p class="mt-2 border-bottom">총 ${num}개의 항목이 있습니다.<br /> 총 라운드 수를 선택해주세요.</p>
                <form name="roundCheck" action="/board/main" method="post">
                    <select class="form-select" name="round">
                        <c:forEach var="round" items="${roundMap}">
                            <option value="${round.key}">${round.value}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${boardDTO.boardSecret == 3}">
                        비밀번호: <input type="password" name="boardPassword" class="form-text" placeholder="비밀번호 입력">
                        <p class="result"></p>
                    </c:if>
                    <p><input type="button" onclick="" class="btn btn-outline-danger btn1" value="확인"></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
