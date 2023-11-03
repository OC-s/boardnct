<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>


<!-- check  -->
<script type="text/javascript">
	function Check(){
		if(username.value == ""){
			username.focus();
			alert('아이디를 입력하세요');
			return false
		}else if (password.value == ""){
			password.focus();
			alert('비밀번호를 입력하세요');
			return false
		}
	}
</script>


</head>
<body>
    <div class="wrapper">
        	
        <form class="p-3 mt-3" action="/login" method="post" onsubmit="return Check()">
        	<div class="text-center mt-1 name">
	    		<a href="/"><h2>로그인</h2></a>
	 	   	</div>
	        
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span>
                <input type="text" name="username" id="username" placeholder=ID autocomplete="off">
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="password" placeholder="비밀번호">
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />	
            </div>
            
            <span>
            	<c:if test="${error}">
	            	<p id="valid" class="alert alert-danger" style="font-size: 12px;">
	            	${exception }
	            	</p>
            	</c:if>
            </span>
            
            <button type="submit" class="btn mt-3" id="btnlogin" style="cursor:pointer; ">로그인</button>
        </form>
        
        <div class="text-center fs-6">
            <a href="/sign">회원가입</a>
        </div>
        
        
     </div>
</body>



<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    body {
        background: #ecf0f3;
    }
    .wrapper {
        max-width: 380px;
        min-height: 400px;
        margin: 350px auto;
        padding: 40px 30px 30px 30px;
        background-color: #ecf0f3;
        border-radius: 15px;
        box-shadow: 13px 13px 20px #cbced1, -13px -13px 20px #fff;
    }
    .logo {
        width: 80px;
        margin: auto;
    }
    .logo img {
        width: 100%;
        height: 80px;
        object-fit: cover;
        border-radius: 50%;
        box-shadow: 0px 0px 3px #5f5f5f,
            0px 0px 0px 5px #ecf0f3,
            8px 8px 15px #a7aaa7,
            -8px -8px 15px #fff;
    }

    .wrapper .name {
        font-weight: 600;
        font-size: 1.4rem;
        letter-spacing: 1.3px;
        margin-bottom: 20px;
        color: #555;
    }
    
    input:autofill,
	input:autofill:hover,
	input:autofill:focus,
	input:autofill:active {
	-webkit-text-fill-color: #666;
    -webkit-box-shadow: 0 0 0px 1000px #fff inset;
    box-shadow: 0 0 0px 1000px #fff inset;
    transition: background-color 5000s ease-in-out 0s;
    
}

    .wrapper .form-field input {
        width: 100%;
        display: block;
        border: none;
        outline: none;
        background: none;
        font-size: 1.2rem;
        color: #666;
        padding: 10px 15px 5px 10px;
        /* border: 1px solid red; */
    }

    .wrapper .form-field {
        padding-left: 10px;
        margin-bottom: 20px;
        border-radius: 20px;
        box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff;
    }

    .wrapper .form-field .fas {
        color: #555;
    }
    
    .wrapper .btn {
        box-shadow: none;
        width: 100%;
        height: 40px;
        /* background-color: #03A9F4; */
        color: #fff;
        border-radius: 25px;
        box-shadow: 3px 3px 3px #b1b1b1,
            -3px -3px 3px #fff;
        letter-spacing: 1.3px;
        border: none;
        font-size: large;
    }

    .wrapper .btn:hover {
        background-color: #039BE5;
    }
    
    #btnlogin {
    	background-color: #03A9F4;
    }
    #btnlogin:hover {
        background-color: #039BE5;
    }
    
    .wrapper a {
        text-decoration: none;
        font-size: 0.8rem;
        color: #03A9F4;
    }

    .wrapper a:hover {
        color: #039BE5;
    }

    @media(max-width: 380px) {
        .wrapper {
            margin: 30px 20px;
            padding: 40px 15px 15px 15px;
        }
    }

</style>

</html>