<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 9:07
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
            background-color: rgba(0, 0, 0, 0.6);
        }
        .mainImg{
            width: 650px;
            height: 500px;
        }
        .aa{
            margin-top: -55px;
            background-color: rgba(0,0,0,0.3);
        }
    </style>
    <script>
        var thisRound = 0;
        var idlist1 = [];
        var namelist1 = [];
        var srclist1 = [];
        var idlist2 = [];
        var namelist2 = [];
        var srclist2 = [];
        var img1 = [];
        <c:forEach var="i" items="${list1}">
            var id = '${i.i_id}';
            var name = '${i.imageName}';
            var src = '${i.imageManageName}';
            idlist1.push(id);
            namelist1.push(name);
            srclist1.push(src);
        </c:forEach>
        <c:forEach var="i" items="${list2}">
        var id = '${i.i_id}';
        var name = '${i.imageName}';
        var src = '${i.imageManageName}';
        idlist2.push(id);
        namelist2.push(name);
        srclist2.push(src);
        </c:forEach>
        const roundChange =(i_id)=>{
            img1.push(i_id);
            thisRound += 1;
            const main = document.getElementById("main");
            if(thisRound<${list1.size()}){
                let change = "<p class='h2'>${boardDTO.boardName}월드컵</p> <p class='h4'>${round}강전</p> <p class='h4'>" + (thisRound+1)+ "/" +"${round2}</p>"
                change = change+ "<table> <tr> <td> <img class='mainImg' onclick='roundChange("+ idlist1[thisRound] +")' src='${pageContext.request.contextPath}/upload/"+ srclist1[thisRound] +"'> </td> <td> <img class='mainImg' onclick='roundChange("+ idlist2[thisRound] +")' src='${pageContext.request.contextPath}/upload/"+ srclist2[thisRound] +"'> </td> </tr>";
                change = change+ "<tr><td><div class='aa navbar'><p class='text-center text-white'>"+ namelist1[thisRound] +"</p></div> </td> <td> <div class='aa navbar'><p class='text-center text-white'>"+ namelist2[thisRound] +"</p></div> </td> </tr> </table>"
                main.innerHTML = change;
            }
            else{
                location.href="/board/main?b_id=${boardDTO.b_id}&round=${round2}&img1=" + img1;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="box">
<div class="container text-center text-white">
    <div id="main">
        <p class="h2">${boardDTO.boardName}월드컵</p>
        <p class="h4">${round}강전</p>
        <p class="h4">1/${round2}</p>
        <table>
            <tr>
                <td>
                    <img class="mainImg" onclick="roundChange(${list1.get(0).i_id})" src="${pageContext.request.contextPath}/upload/${list1.get(0).imageManageName}">
                </td>
                <td>
                    <img class="mainImg" onclick="roundChange(${list2.get(0).i_id})" src="${pageContext.request.contextPath}/upload/${list2.get(0).imageManageName}">
                </td>
            </tr>
            <tr>
                <td>
                    <div class="aa navbar"><p class="text-center text-white">${list1.get(0).imageName}</p></div>
                </td>
                <td>
                    <div class="aa navbar"><p class="text-center text-white">${list2.get(0).imageName}</p></div>
                </td>
            </tr>
        </table>
    </div>
</div>
</div>
</body>
</html>
