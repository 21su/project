<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>내정보</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script>
        const pwCheck = () =>{
            var result = false;
            const num = document.getElementById("inputM_id").value;
            const pw = document.getElementById("inputPw").value;
            $.ajax({
                type:"post",
                url:"/member/pwCheck",
                async: false,
                data:{
                    "m_id": num,
                    "memberPassword": pw
                },
                dataType:"json",
                success:function (data){
                    result = data;
                },error:function (){
                    alert("에러");
                }
            })
            return result;
        }
        const submitupdate = () =>{
            let result = pwCheck();
            if(result){
                updateForm.submit();
            }else{
                document.getElementById("pwchk").innerHTML = "비밀번호를 확인해주세요."
            }
        }
        const deleteId = () =>{
            let result = pwCheck();
            if(result){
                location.href="/member/deleteId?m_id=${memberDTO.m_id}"
            }else{
                document.getElementById("pwchk").innerHTML = "비밀번호를 확인해주세요."
            }
        }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mt-5">
        <div class="">
            <form class="row g-3" name="updateForm" method="post" action="/member/update">
                <div class="col mt-3">내 정보</div>
                <br/>
                <input type="hidden" id="inputM_id" name="m_id" value="${memberDTO.m_id}">
                <div class="row mb-3 mt-3">
                    <label for="inputId" class="form-label">UserName</label>
                    <input type="text" class="form-control" id="inputId" name="memberId" value="${memberDTO.memberId}" readonly>
                </div>
                <div class="row mb-3">
                    <label for="inputPw" class="form-label">PasswordCheck</label>
                    <input type="password" class="form-control" id="inputPw" name="memberPassword" placeholder="Password">
                    <a style="color: red;font-size: 7px" id="pwchk"></a>
                </div>
                <div class="row mb-3">
                    <label for="inputName" class="form-label">Name</label>
                    <input type="text" class="form-control" id="inputName" name="memberName" value="${memberDTO.memberName}">
                </div>
                <div class="row mb-3">
                    <label for="inputEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="inputEmail" name="memberEmail" value="${memberDTO.memberEmail}">
                </div>
                <div class="col-12">
                    <p>
                    <input type="button" onclick="submitupdate()" class="btn btn-primary float-start" value="회원정보 수정">
                    <input type="button" onclick="deleteId()" class="btn btn-danger float-end" value="회원 탈퇴">
                    </p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
