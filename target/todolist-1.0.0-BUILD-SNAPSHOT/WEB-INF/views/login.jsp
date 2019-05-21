<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width" ,intital-scal="1">
  <title>To Do List</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>

<body>
        
        	
   
<!-- Navigation  -->

  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/board">To Do List</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <!-- <ul class="nav navbar-nav">
                </ul> -->
        <ul class="nav navbar-nav navbar-right">

         <li><a href="${pageContext.request.contextPath}/join"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    <c:choose>
		<c:when test="${sessionScope.userid == null }">
			<!-- 로그인하지 않은 상태 -->
 			 <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</c:when>
		<c:otherwise>
  			<li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</c:otherwise>
	</c:choose>
        </ul>
      </div>
    </div>
  </nav>


<!-- Contents  -->

  <div class="container">
  
  <!-- Jumbotron -->
  
    <div class="jumbotron">
      <h1>Login</h1>
      <p>로그인을 통해 To Do List를 이용해 보세요!</p>
    </div>
   <form class="form-horizontal" action="${pageContext.request.contextPath}/login.do" method="GET" name="loginForm">
              <div class="form-group">
                <label class="control-label col-sm-2" for="title">아이디 : </label>
                <div class="col-sm-10">
                  <input type="text" class="form-control"  placeholder="아이디를 입력하세요" name="userid">
                </div>
              </div>
     
              <div class="form-group">
                <label class="control-label col-sm-2" for="content">패스워드 :</label>
                <div class="col-sm-10">
                 <input type="password" class="form-control"placeholder="패스워드를 입력하세요" name="password">
                </div>
              </div>
			
              <div class="form-group ">
                <div class="col-sm-offset-2 col-sm-10 ">
                  <button type="submit" class="btn btn-default pull-right">로그인</button>
                </div>
              </div>
            </form>
             <c:if test="${param.message == 'nologin' }">
				<div class="well" style="color:red;">
					<h4 style="text-align:center;">로그인 하신 후 사용가능합니다.</h4>
				</div>				
			</c:if>
			<c:if test="${message == 'error' }">
				<div class="well" style="color:red;">
					<h4 style="text-align:center;">아이디 또는 비밀번호가 일치하지 않습니다.</h4>
				</div>
			</c:if>
			<c:if test="${message == 'logout' }">
				<div class="well" style="color:blue;">
					<h4 style="text-align:center;">로그아웃 처리되었습니다.</h4>
				</div>
			</c:if>
    </div>
</body>
</html>