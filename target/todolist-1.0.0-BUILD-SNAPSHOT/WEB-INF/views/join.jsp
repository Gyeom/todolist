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
      <h1>Join</h1>
      <p>회원가입을 통해 To Do List를 이용해 보세요!</p>
    </div>
   <form class="form-horizontal" action="${pageContext.request.contextPath}/join.do" method="POST" name="joinForm">
              <div class="form-group">
                <label class="control-label col-sm-2" for="title">아이디 : </label>
                <div class="col-sm-10">
                  <input type="text" class="form-control"  placeholder="아이디를 입력하세요" name="userid">
                </div>
              </div>
                            <div class="form-group">
                <label class="control-label col-sm-2" for="title">이름 : </label>
                <div class="col-sm-10">
                  <input type="text" class="form-control"  placeholder="이름을 입력하세요" name="name">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-sm-2" for="content">패스워드 :</label>
                <div class="col-sm-10">
                 <input type="password" class="form-control"placeholder="패스워드를 입력하세요" name="password">
                </div>
              </div>

                 <div class="form-group">
                <label class="control-label col-sm-2" for="content">자기소개 :</label>
                <div class="col-sm-10">
                  <textarea class="form-control" rows="5"  name="introduce" placeholder="자기소개를 해주세요"></textarea>
                </div>
              </div>
              <div class="form-group ">
                <div class="col-sm-offset-2 col-sm-10 ">
                  <button type="submit" class="btn btn-default pull-right">회원가입</button>
                </div>
              </div>
            </form>
                        <c:if test="${message == 'error' }">
				<div class="well" style="color:red;">
					<h4 style="text-align:center;">회원정보를 올바르게 입력하세요</h4>
				</div>				
			</c:if>
			<c:if test="${message == 'duplicate' }">
				<div class="well" style="color:red;">
					<h4 style="text-align:center;">아이디가 중복됩니다.</h4>
				</div>
			</c:if>
	
    </div>
</body>
</html>