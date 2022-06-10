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
        let count = 0;
        const updateForm1 = () =>{
            const queryString = $("form[name=updateForm]").serialize();
            const message = document.getElementById("message");
            $.ajax({
                type: 'post',
                url: '/board/update',
                data: queryString,
                dataType: 'json',
                success: function (result){

                },error: function (){
                    alert("error");
                }
            })
        }
        $(document).ready(function(){

            // 라디오버튼 클릭시 이벤트 발생
            $("input:radio[name=boardSecret]").click(function(){

                if($("input[name=boardSecret]:checked").val() == "3"){
                    $("input:text[name=boardPassword]").attr("disabled",false);

                }else if($("input[name=radio]:checked").val() != "3"){
                    $("input:text[name=boardPassword]").val('');
                    $("input:text[name=boardPassword]").attr("disabled",true);
                }
            });
        });

        <%--function subImg() {--%>
        <%--    alert("aa");--%>
        <%--    let formData = new FormData($('#imageForm')[0]);--%>
        <%--    let inputFile = $("input[name = 'file']");--%>
        <%--    let files = inputFile[0].files;--%>
        <%--    console.log(files);--%>
        <%--    for(let i = 0; i < files.length; i++){--%>
        <%--        formData.append("file", files[i]);--%>
        <%--    }--%>
        <%--    alert(formData);--%>
        <%--    /*const queryString = $("form[name=imageForm]").serialize();--%>
        <%--    const file = $('#inputFile').val();*/--%>
        <%--    const fileText = $('#fileText');--%>
        <%--    const b_id = "${updateDTO.b_id};"--%>
        <%--    $.ajax({--%>
        <%--        type : "post",--%>
        <%--        async : false,--%>
        <%--        url : "/board/save-image",--%>
        <%--        contentType : false,--%>
        <%--        processData : false,--%>
        <%--        enctype : "multipart/form-data",--%>
        <%--        data : {--%>
        <%--            formData,--%>
        <%--            "b_id": b_id--%>
        <%--        },--%>
        <%--        dataType    : 'json',--%>
        <%--        success : function (result){--%>
        <%--            let rc = "";--%>
        <%--            if(count == 0){--%>
        <%--                fileText.innerHTML = "";--%>
        <%--            }--%>
        <%--            for(let i in result){--%>
        <%--                rc += "<div class='col m-2'><img src='${pageContext.request.contextPath}/upload/"+result[i].imageManageName+"' alt='' height='100' width='100'></div>";--%>
        <%--            }--%>
        <%--            fileText.innerHTML += rc;--%>
        <%--        },error : function (request,status,error){--%>
        <%--            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);--%>
        <%--        }--%>
        <%--    });--%>
        // }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-3">
    <h2>월드컵 생성</h2>
</div>
    <div class="container-xl mt-5">
        <div class="border border-1 border-dark text-secondary">
            <table class="table table-info">
                <tr onclick="location.href='/board/update2?b_id=${updateDTO.b_id}'">
                    <td class="col-sm-1 table-secondary">
                        <h5 class="mt-3 mb-3">이미지 이름 수정/삭제</h5>
                    </td>
                </tr>
                <tr>
                    <td class="col-sm-1">
                        <h5 class="mt-3 mb-3">이미지 이름 수정/삭제</h5>
                    </td>
                </tr>
            </table>
        </div>
        <div class="border border-1 border-dark text-secondary">
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
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio1" value="1" checked>
                                <label class="form-check-label" for="radio1">
                                    비공개(다른 사용자는 접근할 수 없습니다.)
                                </label>
                            </div>
                            <div class="form-check ms-5">
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio2" value="2">
                                <label class="form-check-label" for="radio2">
                                    전체 공개(모든 사용자가 플레이 할 수 있습니다.)
                                </label>
                            </div>
                            <div class="form-check ms-5">
                                <input class="form-check-input" type="radio" name="boardSecret" id="radio3" value="3">
                                <label class="form-check-label" for="radio3">
                                    친구 공개(비밀번호 입력 후 플레이 할 수 있습니다.)
                                </label>
                            </div>
                            <div class="form-text">
                                <input type="text" class="form-control-sm" name="boardPassword" style="margin-left: 2cm;" placeholder="비밀번호 입력" disabled>
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
        <div class="border border-1 border-black text-secondary">
            <form method="post" id="imageForm" name="imageForm" action="/board/save-image" enctype="multipart/form-data">
                <input type="hidden" name="b_id" id="b_id" value="${updateDTO.b_id}">
                <table class="table table-info">
                    <tr>
                        <td class="col-sm-1">
                            <h5 class="mt-3 mb-3">이상형 월드컵 이미지 업로드</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-1">
                            <div class="container">
                            <label for="file" class="position-relative" style="width: 650px; height: 400px;">
                                <div class="position-absolute top-50 start-50 translate-middle h2 row imgs_wrap" id="fileText">여기에 이미지 넣기<img id="img" /></div>
                            </label>
                            <input type="file" name="file" id="file" multiple>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-sm-1 ms-3">
                                <input type="submit" value="업로드" class="btn btn-danger mt-3 mb-1">
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
