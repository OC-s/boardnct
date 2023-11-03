<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	
	<div class="container">
	 <table class="table table-striped">
	 	<form action="search" method="get" name="search-form">
		 	<thead>
				<tr>
					<h1 style="text-align: center;">게시판</h1>
				</tr>
				<tr>
					<td>
						<a href="write" class="btn btn-outline-primary">작성</a>
					</td>
					<td colspan="4" style="text-align: right;">
					 	<div>
					 		<select name="type">
								<option selected value="all">검색 내용 선택</option>	
								<option value="bno">번호</option>	
								<option value="title">제목</option>	
								<option value="contents">내용</option>	
								<option value="nickname">닉네임</option>	
							</select> 
	                      	<input type="text" name="keyword" id="keyword" value="" placeholder="검색어를 입력하세요.">
	                      	<button type="submit" onclick=""><span>검색</span></button>
	                  	</div>
					</td>
				</tr>
			 	<tr>
			      <th scope="col">번호</th>
			      <th scope="col">닉네임</th>
			      <th scope="col">제목</th>
			      <th scope="col">내용</th>
			      <th scope="col">작성시간</th>
		   		</tr>
		 	</thead>
		 	
		 	<!-- body  -->
		 	<tbody>
		 		<c:forEach var="dto" items="${list}">
			 			<tr>
			 				<td>
			 					<span>${dto.bno }</span>
			 				</td>
			 				<td>
			 					<span>${dto.nickname }</span>
			 				</td>
			 				<td>
			 					<a href="detail?bno=${dto.bno}">${dto.title }</a>
			 				</td>
			 				<td>
			 					<span>${dto.contents }</span>
			 				</td>
			 				<td>
			 					<span>${dto.created_time }</span>
			 				</td>
			 			</tr>
		 		</c:forEach>
		 	
		 	
		 	<!-- 페이지네이션 -->
		 	<tr>
				<td colspan="8">
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center" style="margin-bottom: 0; margin-top: 10px;" >
					 	
				 	<c:choose>
					  	<c:when test="${map.isPre }">
					  		<c:choose>
					  			<c:when test="${empty keyword}">
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${map.currentPage-5 }">이전</a></li>
					  			</c:when>
					  			<c:otherwise>
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${map.currentPage-5 }">이전</a></li>
					  			</c:otherwise>
					  		</c:choose>
					  	</c:when>
				 	</c:choose>
					  	
					  	<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
					  		<c:choose>
					  			<c:when test="${empty keyword}">
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${i}">${i }</a></li>
					  			</c:when>
					  			<c:otherwise>
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${i}">${i }</a></li>
					  			</c:otherwise>
					  		</c:choose> 
					  	</c:forEach>
					  	
					<c:choose>
					    <c:when test="${map.isNext }">
					    	<c:choose>
					  			<c:when test="${empty keyword}">
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${map.currentPage+5 }">다음</a></li>
					  			</c:when>
					  			<c:otherwise>
								    <li class="page-item"><a class="page-link" href="search?type=${type}&keyword=${keyword}&cp=${map.currentPage+5 }">다음</a></li>
					  			</c:otherwise>
					  		</c:choose>
					    </c:when>
				    </c:choose>
					    
					  </ul>
					</nav>
				</td>
			</tr>
			
		 	</tbody>
		 	
		 	
		 	
	 	</form>
	 </table>
	 
	</div>
</body>

</html>