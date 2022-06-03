<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-3">
        <form class="row g-3" action="/member/login" method="post">
            <br/>
            <h1 class="col mt-3">로그인</h1>
            <div class="row mb-3">
                <label for="inputmemberId" class="form-label">UserName</label>
                <input type="text" class="form-control" id="inputmemberId" name="memberId" placeholder="UserName">
            </div>
            <div class="row mb-3">
                <label for="inputmemberPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="inputmemberPassword" name="memberPassword" placeholder="Password">
                <p style="font-size: 7px; color: red">${message}</p>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary float-start">Login</button>
                <input type="button" class="btn btn-danger float-end" onclick="location.href='/member/save'" value="회원가입">
            </div>
        </form>
    </div>
</body>
</html>
