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
    <div class="container mt-5">
        <div class="border border-1 border-dark text-secondary">
            <table class="table table-info">
                <tr onclick="location.href='/board/update?b_id=${updateDTO.b_id}'">
                    <td class="col-sm-1 table-secondary">
                        <h5 class="mt-3 mb-3">기본정보 수정/이미지 업로드</h5>
                    </td>
                </tr>
                <tr onclick="">
                    <td class="col-sm-1">
                        <h5 class="mt-3 mb-3">이미지 수정/이미지 이름변경</h5>
                    </td>
                </tr>
            </table>
        </div>
        <div class="border border-1 border-dark text-secondary">
            <table class="table table-info">
                <tr class="container">
                    <td class="col-sm-1">
                        <h5 class="mt-3 mb-3">이상형 월드컵 기본정보</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                        <table class="table table-light border-dark border border-1">
                            <tr>
                                <th class="col-sm-1" style="width: 110px;">
                                    <h6 class="ms-3 mt-2">이미지</h6>
                                </th>
                                <th class="col-sm-1" style="width: 250px;">
                                    <h6 class="ms-3 mt-2">이름</h6>
                                </th>
                                <th class="col-sm-1" style="width: 400px;">
                                    <h6 class="ms-3 mt-2">이미지 변경</h6>
                                </th>
                                <th class="col-sm-1">
                                    <h6 class="ms-3 mt-2">이미지 삭제</h6>
                                </th>
                            </tr>
                            <c:forEach var="image" items="${imageList}">
                                <tr>
                                    <td class="col-sm-1">
                                        <img src="${pageContext.request.contextPath}/upload/${image.imageManageName}" alt="${image.imageName}" height="100" width="100">
                                    </td>
                                    <td class="col-sm-1">
                                        <input type="text" name="imageName" class="" value="${image.imageName}" required>
                                    </td>
                                    <td class="col-sm-1">
                                        <label for="file" class="position-relative" style="width: 400px; height: 100px;">
                                            <div class="position-absolute top-50 start-50 translate-middle h4 row imgs_wrap" id="fileText">여기에 이미지 넣기</div>
                                        </label>
                                        <input type="file" name="file" id="file" style="display: none;">
                                    </td>
                                    <td class="col-sm-1">
                                        <input type="button" class="btn-outline-warning" onclick="location.href='/board/image-delete?i_id=${image.i_id}&b_id=${image.b_id}'" value="삭제 하기">
                                    </td>
                                </tr>
                             </c:forEach>
                        </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
