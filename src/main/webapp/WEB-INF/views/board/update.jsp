<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <title>월드컵 만들기</title>
    <script>
        const updateForm1 = () =>{
            alert("aa");
            const queryString = $("form[name=updateForm]").serialize();
            const message = document.getElementById("message");
            $.ajax({
                type: 'post',
                url: '/board/update',
                data: queryString,
                dataType: 'json',
                success: function (result){
                    alert(result);
                },error: function (){
                    alert("error");
                }
            })
        }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-3">
    <h2>월드컵 생성</h2>
</div>
    <div class="container mt-5">
        <div class="border border-1 border-white text-secondary">
            <form name="updateForm" action="/board/update" method="post">
                <input type="hidden" name="b_id" value="${updateDTO.b_id}">
                <input type="hidden" name="memberId" value="${sessionScope.memberId}">
                <table class="table table-info">
                    <tr class="container">
                        <td class="col-sm-1">
                            <h5 class="mt-3 mb-3">이상형 월드컵 기본정보</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-1">
                            <h6 class="ms-3 mt-2">제목</h6>
                            <input type="text" name="boardName" class="form-control mt-2" placeholder="제목입력" value="${updateDTO.boardName}" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-1">
                            <h6 class="ms-3 mt-2">내용</h6>
                            <input type="text" name="boardExp" class="form-control mt-2" placeholder="내용입력" value="${updateDTO.boardExp}" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-1">
                            <h6 class="ms-3 mt-2">공개여부</h6>
                            <div class="form-check ms-5">
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio1" value="1" required>
                                <label class="form-check-label" for="radio1">
                                    비공개(다른 사용자는 접근할 수 없습니다.)
                                </label>
                            </div>
                            <div class="form-check ms-5">
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio2" value="2" required>
                                <label class="form-check-label" for="radio2">
                                    전체 공개(모든 사용자가 플레이 할 수 있습니다.)
                                </label>
                            </div>
                            <div class="form-check ms-5">
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio3" value="3" required>
                                <label class="form-check-label" for="radio3">
                                    친구 공개(비밀번호 입력 후 플레이 할 수 있습니다.)
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="ms-3">
                                <input type="button" onclick="updateForm1()" value="저장하기" class="btn btn-primary mt-3 mb-1">
                                <p id="message"></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
