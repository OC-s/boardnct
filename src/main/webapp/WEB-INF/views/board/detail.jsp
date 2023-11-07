<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="container">
		<table class="table table-striped-columns">
			<h1 style="text-align: center;">상세페이지</h1>
			
			 <div class="row g-5">
		        <section class="col-md-3 col-lg-4 order-md-last">
		            <aside>
		            	<input type="hidden" name="detaildto" value="${detaildto.bno}">
		                <p>작성자 : ${detaildto.nickname }</p>
		                <p>작성일 : ${detaildto.created_time }</p>
		                <p>수정일 : ${detaildto.updated_time }</p>
		            </aside>
		        </section>
		
		        <div id="article-content" class="col-md-9 col-lg-8">
		            <h2>제목 : ${detaildto.title }</h2>
		        </div>
		   	 </div>
			 <div class="row g-5">
		        <section class="col-md-3 col-lg-8 order-md-last">
		            <div>
		                <h2>내용 : ${detaildto.contents }</h2>
		            <div>
		        </section>
		   	 </div>
			 <div>
		       	<a href="list" class="btn btn-outline-primary">목록가기</a>
		       	
		       	<!-- 작성자만 수정 가능 -->
		       	<c:if test="${detaildto.nickname eq dto.nickname}">
					<a href="modify?bno=${detaildto.bno}" class="btn btn-outline-primary">수정하기</a>
		       	</c:if>
		       	
		       	<!-- 작성자 or 관리자 삭제가능 -->
				<c:if test="${detaildto.nickname eq dto.nickname or dto.role eq 'ROLE_ADMIN'}">
					<a href="delete?bno=${detaildto.bno}" class="btn btn-outline-primary">삭제하기</a>
				</c:if>		       	
		    </div>
		  	
		  	&ensp;
		  	&ensp;
		   
			<%@ include file="reply.jsp" %>
			
		</table>
	</div>
		 
</body>

</html>