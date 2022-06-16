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
            max-height: 60%;
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
        .commentBox{
            border-radius: 30px;
            background-size: cover;
            background-color: rgba(255, 255, 255, 0.3);
            width: 1085px;
            height: 200px;
            margin-bottom: 5px;
            display: inline-block;
        }
        .commentBox2{
            border-radius: 30px;
            background-size: cover;
            background-color: rgba(255, 255, 255, 1);
            width: 1085px;
            height: 200px;
            margin-bottom: 5px;
            display: inline-block;
        }
        .c{
            position: relative;
        }
        .cContent{
            position: absolute;
            top: 50px;
            width: 900px;
        }
        .cUser{
            top: 0;
            left: 0;
            position: absolute;
            width: 300px;
            font-size: 20px;
        }
        .cDate{
            top: 0;
            left: 900px;
            position: absolute;
            width: 100px;
            font-size: 10px;
        }
        .cButton{
            top:120px;
            left: 900px;
            position: absolute;
        }
        .sand{
            margin-left: 65px;
        }
        .saveUser{
            border: none;
            width: 500px;
            background: transparent;
        }
        .saveContents{
            border: none;
            width: 900px;
            height: 100px;
            background: transparent;
        }
    </style>
    <script>
        const saveComment = () =>{
            const b_id = '${boardDTO.b_id}'
            const memberId = document.getElementById("memberId").value;
            const commentContents = document.getElementById("commentContents").value;
            $.ajax({
                type: "post",
                url: "/comment/comment-save",
                data: {
                    "b_id": b_id,
                    "memberId": memberId,
                    "commentContents": commentContents
                },
                dataType: "json",
                success:function (result){
                    let comment = "";
                    for(let i in result){
                        console.log(result[i].memberId);
                        comment += "<div class='m-3 commentBox'><div class='m-3 c'>";
                        comment += "<input type='hidden' id='c_id"+ result[i].c_id + "'>";
                        comment += "<div class='cUser'><p id='memberId"+result[i].c_id+"'>" + result[i].memberId + "</p></div>";
                        comment += "<div class='cDate'>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm") + "</div>";
                        comment += "<div class='cContent' id='contentsBox" + result[i].c_id + "'  style='display: inline'>" + result[i].commentContents + "</div>";
                        comment += "<div class='cContent' id='textBox" + result[i].c_id + "' style='display: none'> <textarea class='saveContents' id='commentContents" + result[i].c_id + "' name='commentContents' placeholder='내용작성'>"+ result[i].commentContents +"</textarea></div>";
                        comment += `<div class='cButton' id='button1` + result[i].c_id + `' style="display: inline"> <input type='button' onclick='updateContents(`+ result[i].c_id +`)' class='btn btn-outline-warning b1' value='수정'><input type='button' onclick='deleteContents(`+ result[i].c_id +`)'  class='btn btn-outline-danger b1' value='삭제'></div>`;
                        comment += `<div class='cButton' id='button2` + result[i].c_id + `' style="display: none">`;
                        comment += `<input type='button' onclick="updateContents1(` + result[i].c_id + `)" class='btn btn-outline-success' value='변경'>`;
                        comment += `<input type='button' onclick="backContents(` + result[i].c_id + `)" class='btn btn-outline-success' value='뒤로'>`;
                        comment += `</div>`;
                        comment += "</div></div>";
                    }
                    document.getElementById("comment").innerHTML = comment;
                    document.getElementById("commentContents").value = "";
                },
                error:function (){
                    alert("에러");
                }
            });
        }
        const backContents = (c_id) =>{
            document.getElementById("button1"+c_id).style.display = "inline";
            document.getElementById("button2"+c_id).style.display = "none";
            document.getElementById("contentsBox"+c_id).style.display = "inline";
            document.getElementById("textBox"+c_id).style.display = "none";
        }
        const updateContents = (c_id) =>{
            const memberId = document.getElementById("memberId"+c_id).innerHTML;
            const sessionId = '${sessionScope.memberId}';
            if(sessionId == memberId){
                document.getElementById("button1"+c_id).style.display = "none";
                document.getElementById("button2"+c_id).style.display = "inline";
                document.getElementById("contentsBox"+c_id).style.display = "none";
                document.getElementById("textBox"+c_id).style.display = "inline";
            }
            else{
                alert("본인 댓글이 아닐경우 수정/삭제가 불가능합니다.")
            }
        }
        const updateContents1 = (c_id) =>{
            const commentContents = document.getElementById("commentContents"+c_id).value;
            const b_id = '${boardDTO.b_id}';
            location.href="/comment/update?commentContents="+commentContents+"&c_id="+c_id+"&b_id="+b_id;

        }
        function deleteContents(c_id){
            const memberId = document.getElementById("memberId"+c_id).innerHTML;
            const sessionId = '${sessionScope.memberId}';
            const b_id = '${boardDTO.b_id}';
            if(sessionId == memberId || sessionId == 'admin'){
                location.href="/comment/comment-delete?c_id="+c_id+"&b_id="+b_id;
            }else{
                alert("본인 댓글이 아닐경우 수정/삭제가 불가능합니다.")
            }
        }
    </script>
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
            <div id="comment">
            <c:choose>
                <c:when test="${commentList.size() == 0}">
                    <div class='m-3 commentBox'>
                        <div class='m-3 c'>
                            <div class='cUser'>아이디</div>
                            <div class='cDate'>
                                작성시간
                            </div>
                            <div class='cContent'>
                                    내용
                            </div>
                            <div class='cButton'>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="comment" items="${commentList}">
                        <div class='m-3 commentBox'>
                            <div class='m-3 c'>
                                <input type="hidden" id="c_id${comment.c_id}">
                                <div class='cUser'><p id="memberId${comment.c_id}">${comment.memberId}</p></div>
                                <div class='cDate'>
                                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${comment.commentCreatedDate}"></fmt:formatDate>
                                </div>
                                <div class='cContent' id='contentsBox${comment.c_id}' style="display: inline">
                                    ${comment.commentContents}
                                </div>
                                <div class='cContent' id='textBox${comment.c_id}' style="display: none">
                                    <textarea class="saveContents" id="commentContents${comment.c_id}" name="commentContents" placeholder="내용작성">${comment.commentContents}</textarea>
                                </div>
                                <div class='cButton' id="button1${comment.c_id}" style="display: inline">
                                    <input type='button' onclick="updateContents('${comment.c_id}')" class='btn btn-outline-warning b1' value='수정'>
                                    <input type='button' onclick="deleteContents('${comment.c_id}')" class='btn btn-outline-danger b1' value='삭제'>
                                </div>
                                <div class="cButton" id="button2${comment.c_id}" style="display: none">
                                    <input type='button' onclick="updateContents1('${comment.c_id}')" class='btn btn-outline-success' value='변경'>
                                    <input type='button' onclick="backContents('${comment.c_id}')" class='btn btn-outline-success' value='뒤로'>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </div>
            <c:choose>
                <c:when test="${sessionScope.memberName != null}">
                    <form method="post" name="commentSave" action="/comment/comment-save">
                        <div class='m-3 commentBox2'>
                            <div class='m-3 c'>
                                <div class="cUser"><input type="text" id="memberId" class="saveUser" name="memberId" value="${sessionScope.memberId}"  readonly></div>
                                <div class="cContent">
                                    <textarea class="saveContents" id="commentContents" name="commentContents" placeholder="내용작성"></textarea>
                                </div>
                                <div class="cButton">
                                    <input type="button" onclick="saveComment()" class="sand btn btn-outline-success" value="전송">
                                </div>
                            </div>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>
