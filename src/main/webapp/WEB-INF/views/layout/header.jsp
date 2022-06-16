<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 3:17
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
    <script>
        const created = () =>{
            if(${sessionScope.memberId != null}){
                location.href="/board/save?memberId=${sessionScope.memberId}";
            }else{
                location.href="/member/login";
            }
        }
        const myworld = () =>{
            if(${sessionScope.memberId != null}){
                location.href="/board/myb?memberId=${sessionScope.memberId}";
            }else{
                location.href="/member/login";
            }
        }
        const memberCheck = () =>{
            if(${sessionScope.memberId == 'admin'}){
                location.href="/member/findAll";
            }
        }
    </script>
</head>
<body>
<header class="shadow navbar navbar-expand-lg navbar-dark bg-info text-white sticky-top">
    <nav class="container-xxl flex-wrap flex-lg-nowrap">
        <a class="navbar-brand p-0 me-0 me-lg-2" href="/" aria-label="부트스트랩">
            <svg xmlns="http://www.w3.org/2000/svg" width="46" height="40" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
            </svg>
            <span class="h4 mt-4">이상형 월드컵</span>
        </a>
        <div class="navbar-nav flex-row flex-wrap bd-navbar-nav">
            <button type="button" onclick="created()" class="btn btn-info ms-3 text-white">월드컵 만들기</button>
            <button type="button" onclick="myworld()" class="btn btn-info ms-3 text-white">내가 만든 월드컵</button>
            <c:if test="${sessionScope.memberId == 'admin'}">
                <button type="button" onclick="memberCheck()" class="btn btn-info ms-3 text-danger">회원관리</button>
            </c:if>
        </div>
        <div class="navbar-nav flex-row flex-wrap ms-md-auto">
            <c:choose>
                <c:when test="${sessionScope.memberId != null}">
                    <span class="text-white mt-2">${sessionScope.memberName}님 환영합니다.</span>
                    <button type="button" onclick="location.href='/member/detail?m_id=${sessionScope.m_id}'" class="btn btn-info ms-3 text-white">내정보</button>
                    <button type="button" onclick="location.href='/member/logout'" class="btn btn-info ms-3 text-white">로그아웃</button>
                </c:when>
                <c:otherwise>
                    <button type="button" onclick="location.href='/member/login'" class="btn btn-info text-white">로그인</button>
                    <button type="button" onclick="location.href='/member/save'" class="btn btn-info ms-3 text-white">회원가입</button>
                </c:otherwise>
            </c:choose>

        </div>
    </nav>
</header>
</body>
</html>
