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
</head>
<body>
	
	<sec:authorize access="isAuthenticated()">
	    <a href="/logout" onclick="return confirm('로그아웃을 하시겠습니까?');">로그아웃</a>
	</sec:authorize>
	
 	<sec:authorize access="isAnonymous()">
 		 <a href="/login">로그인</a>
 	</sec:authorize>

</body>
</html>