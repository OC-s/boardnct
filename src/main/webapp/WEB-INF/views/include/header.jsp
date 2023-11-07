 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="../resources/assets/css/nucleo-icons.css" rel="stylesheet" />
<style type="text/css">
#header{
    font-weight: bold;
    background-color: aqua;
    font-size: 30px;
    color: white;
}
#header a{
	text-decoration: none; /* 링크의 밑줄 제거 */  
	color: inherit; /* 링크의 색상 제거 */
}

.wrapper{
    width: 100%;
    min-height: 100px;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
}
.lists{
    display: flex;
    margin-right: 60px;
    list-style-type: none;
}
.lists li{
    margin-right: 20px;
}
.title{
    font-size: 40px;
    margin-left: 30px;
}
.log{
    margin-right: 30px;
}
</style>
</head>
<body>
	
	<sec:authorize access="isAuthenticated()">
		 <section id="header">
		        <div class="wrapper">
		            <a href="/list"><div class="title"><i class="fas fa-kiss-wink-heart"></i>게시판</div></a>
		            <ul class="lists">
		                <a href="/list"><li>community</li></a>
		            </ul>
		            <div class="log"><a href="/logout" onclick="return confirm('로그아웃을 하시겠습니까?');">logout</a></div>
		        </div>
		    </section>
	</sec:authorize>
	
 	<sec:authorize access="isAnonymous()">
 		 <a href="/login">로그인</a>
 	</sec:authorize>

</body>
</html>