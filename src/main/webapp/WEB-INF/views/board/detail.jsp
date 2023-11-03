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
		
		        <article id="article-content" class="col-md-9 col-lg-8">
		            <h2>제목 : ${detaildto.title }</h2>
		        </article>
		   	 </div>
			 <div class="row g-5">
		        <section class="col-md-3 col-lg-4 order-md-last">
		            <aside>
		                <h2>내용 : ${detaildto.contents }</h2>
		            </aside>
		        </section>
		   	 </div>
			 <div>
		       	<a href="list" class="btn btn-outline-primary">목록가기</a>
				<a href="modify?bno=${detaildto.bno}" class="btn btn-outline-primary">수정하기</a>
				<a href="delete?bno=${detaildto.bno}" class="btn btn-outline-primary">삭제하기</a>
		    </div>
		  	
		  	&ensp;
		  	&ensp;
		   
		
		    <div class="row 9-5">
		        <sectoin>
		            <form class="row g-3">
		                <div class="col-md-9 col-lg-8">
		                    <label for="articleComment" hidden>댓글</label>
		                    <textarea class="form-control" id="articleComment" placeholder="댓글 쓰기.." rows="3"
		                              required></textarea>
		                </div>
		                <div class="col-md-3 col-lg-4">
		                    <label for="comment-submit" hidden>댓글 쓰기</label>
		                    <button class="btn btn-primary" id="comment-submit" type="submit">쓰기</button>
		                </div>
		
		            </form>
		
		            <ul id="article-comments" class="row col-md-10 col-lg-8 pt-3">
		                <li>
		                    <form>
		                        <input hidden class="article-id">
		                        <div class="row">
		                            <div class="row col-md-10 col-lg-9">
		                                <strong>닉네임</strong>
		                                <small>
		                                    <time>2022-01-01</time>
		                                </small>
		                                <p>
		                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
		                                    Lorem ipsum dolor sit amet
		                                </p>
		                            </div>
		                        </div>
		                    </form>
		                </li>
		                <li>
		                    <form>
		                        <input hidden class="article-id">
		                        <div class="row">
		                            <div class="row col-md-10 col-lg-9">
		                                <strong>닉네임</strong>
		                                <small>
		                                    <time>2022-01-01</time>
		                                </small>
		                                <p>
		                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
		                                    Lorem ipsum dolor sit amet
		                                </p>
		                            </div>
		                        </div>
		                    </form>
		                </li>
		            </ul>
		
		        </sectoin>
		    </div>
			
		</table>
	</div>
	
	
		<!--
			<tr>
				<th>제목</th>
			</tr>
			<tr>
				<th>내용 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
			</tr>
			<tr>
				<td><input type="hidden" name="list" value="${list.number}">${list.number }</td>
				<td>${list.nickname}</td>
				<td>${list.title}</td>
				<td>${list.contents}</td>
			</tr> 
			 <tr>
				<td colspan="4">
					<a href="list" class="btn btn-outline-primary">목록가기</a>
					<a href="modify?number=1" class="btn btn-outline-primary">수정하기</a>
					<a href="delete?number=1" class="btn btn-outline-primary">삭제하기</a>
				</td>
			</tr> -->
</body>

</html>