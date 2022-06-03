<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원가입</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script>
        const idexp = /^[a-z]+[a-z0-9]{5,19}$/g;
        const pwexp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
        const emailexp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        const IdCheck = () => {
            const id = document.getElementById("inputId").value;
            $.ajax({
                type:"post",
                url:"/member/memberIdCheck",
                data:{"memberId": id},
                dataType:"json",
                success:function (result){
                    const idcheck = document.getElementById("idcheck");
                    if(id.match(idexp)){
                        console.log("되?")
                        if(!result){
                            idcheck.style.color = "red";
                            idcheck.innerHTML = "아이디가 중복됩니다."
                        }else{
                            idcheck.style.color = "green";
                            idcheck.innerHTML = "사용 가능한 아이디입니다.";
                        }
                    }else{
                        idcheck.style.color = "red";
                        idcheck.innerHTML = "영문자로 시작하는 영어또는 숫자 6~20자";
                    }
                }, error: function (){
                    alert("오류");
                }
            })
        }
        function pwCheck(){
            const pw = document.getElementById("inputPw").value
            const pwcheck = document.getElementById("pwcheck");
            if(pw.match(pwexp)){
                pwcheck.style.color = "green";
                pwcheck.innerHTML = "사용 가능한 비밀번호입니다.";
            }else{
                pwcheck.style.color = "red";
                pwcheck.innerHTML = "8 ~ 16자 영문, 숫자를 조합해서 만들어주세요.";
            }
        }
        const emailCheck = () => {
            const email = document.getElementById("inputEmail").value;
            const emailcheck = document.getElementById("emailcheck");
            if(email.match(emailexp)){
                emailcheck.style.color = "green";
                emailcheck.innerHTML = "사용가능한 이메일입니다.";
            }else{
                emailcheck.style.color = "red";
                emailcheck.innerHTML = "이메일 형식을 확인해주세요";
            }
        }
        const nameCheck = () =>{
            const name = document.getElementById("inputName").value;
            const namecheck = document.getElementById("namecheck");
            if(name == ""){
                namecheck.style.color = "red";
                namecheck.innerHTML = "필수 항목입니다.";
            }else{
                namecheck.innerHTML = "";
            }
        }
        const submitId = () =>{
            const id = document.getElementById("inputId").value;
            const pw = document.getElementById("inputPw").value;
            const name = document.getElementById("inputName").value;
            const email = document.getElementById("inputEmail").value;
            if(id.match(idexp)){
                if(pw.match(pwexp)){
                    if(name != ""){
                        if(email.match(emailexp)){
                            saveForm.submit();
                        }else{
                            $('#inputEmail').focus();
                            alert("이메일을 확인해주세요.");
                        }
                    }else{
                        $('#inputName').focus();
                        alert("필수 항목입니다.");
                    }
                }else{
                    $('#inputPw').focus();
                    alert("비밀번호를 확인해주세요.");
                }
            }else{
                $('#inputId').focus()
                alert("아이디를 확인해주세요.");
            }
        }
    </script>
    <style>
        .check{
            font-size: 7px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mt-3">
        <form class="row g-3" name="saveForm" action="/member/save" method="post">
            <br/>
            <h1 class="col mt-3">회원가입</h1>
            <div class="row mb-3 mt-3">
                <label for="inputId" class="form-label">UserName</label>
                <input type="text" class="form-control" onblur="IdCheck()" id="inputId" name="memberId" placeholder="UserName">
                <p id="idcheck" class="check"></p>
            </div>
            <div class="row mb-3">
                <label for="inputPw" class="form-label">Password</label>
                <input type="password" onblur="pwCheck()" class="form-control" id="inputPw" name="memberPassword" placeholder="Password">
                <p id="pwcheck" class="check"></p>
            </div>
            <div class="row mb-3">
                <label for="inputName" class="form-label">Name</label>
                <input type="text" onblur="nameCheck()" class="form-control" id="inputName" name="memberName" placeholder="Name">
                <p id="namecheck" class="check"></p>
            </div>
            <div class="row mb-3">
                <label for="inputEmail" class="form-label">Email</label>
                <input type="email" onblur="emailCheck()" class="form-control" id="inputEmail" name="memberEmail" placeholder="Email">
                <p id="emailcheck" class="check"></p>
            </div>
            <div class="col-12">
                <input type="button" onclick="submitId()" class="btn btn-primary float-start" value="회원가입">
                <input type="button" onclick="location.href='/'" class="btn btn-danger float-end" value="메인으로">
            </div>
        </form>
    </div>
</body>
</html>
