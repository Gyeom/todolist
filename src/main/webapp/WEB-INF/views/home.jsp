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
        <a class="navbar-brand" href="#">To Do List</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <!-- <ul class="nav navbar-nav">
                </ul> -->
        <ul class="nav navbar-nav navbar-right">

          <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                class="glyphicon glyphicon-bullhorn"></span> Notice <span class="badge">5</span></a>
            <ul class="dropdown-menu scrollable-menu" style="border-radius: 1rem;">
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
              <li
                style="width:28rem; padding:1rem; border-style: solid; border-width: 0.2rem; border-color:gainsboro; border-radius: 0.5rem;">
                <span class="glyphicon glyphicon-exclamation-sign"> </span> "강좌 신청하기" 일정이 마감되었습니다. 확인해주세요</li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>


<!-- Contents  -->

  <div class="container">
  
  <!-- Jumbotron -->
  
    <div class="jumbotron">
      <h1>To Do List</h1>
      <p>To Do List를 통해 할 일을 조정해보세요 !</p>
    </div>
    <div class="row">
      <button type="button" class="btn btn-default btn-sm pull-right" data-toggle="modal" data-target="#addBoard"
        style="margin-right:1.8rem; margin-bottom: 0.3rem;"><span class="glyphicon glyphicon glyphicon-plus">
          일정추가</span></button>
    </div>
    
    
    <!-- Modal -->
    
    <div class="modal fade" id="addBoard" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        
        <div class="modal-content" style="margin-top:30%;">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">일정 추가</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" action="/action_page.php">
              <div class="form-group">
                <label class="control-label col-sm-2" for="title">title : </label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title">
                </div>
              </div>
              <div class="form-group">
                <label for="date" class="control-label col-sm-2">due date:</label>
                <div class="col-sm-10">
                  <input class="form-control" type="datetime-local" id="date">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-sm-2" for="content">content :</label>
                <div class="col-sm-10">
                  <textarea class="form-control" rows="5" id="content" placeholder="Enter Content"></textarea>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Submit</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>



<!-- To Do List  -->
<script>
var boardList = new Array;
<c:forEach  var="board" items="${boardList}">
var json = new Object();
json.no="${board.no}";
json.title="${board.title}";
json.content="${board.content}";
json.duedate=<fmt:formatDate value="${board.duedate}" pattern="yyyyMMdd"/>;
boardList.push(json);
</c:forEach>
for (var i = 0; i < boardList.length; i++) {
	if($("."+boardList[i].duedate).length <=0){
		var $group=$("<div class=\'panel-group "+boardList[i].duedate+"\' id=\'accordion\' style=\'margin-bottom: 1rem; border-width: 0.2rem; border-style: solid; border-color: gainsboro; border-radius: 1rem;\'></div>");
		$(".container").append($group);
	    var $list =$("<div style='\margin-left: 46%; margin-right:46%; margin-bottom: 0.5rem; margin-top: 0.5rem;'\>"+boardList[i].duedate+"</div>"
	    	      +"<div class='\panel panel-default'\>"
	    	      +"<div class='\panel-heading'\ style='\height:4rem;'\>"
	    	      +"<div class='\panel-title'\>"
	    	      +"<button data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse"+boardList[i].no+"'\ class='\btn btn-default btn-xs'\ "
	    	      +"style='\margin-bottom: 0.3rem;'\> <span class='\glyphicon glyphicon-star-empty'\></span> </button>"
	    	      +"      <a data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse1'\ "
	    	      +"        style='\margin-left: 0.3rem;'\> "+ boardList[i].title +" </a>"
	    	      +"      <button data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse"+boardList[i].no+"'\ "
	    	      +"       class='\btn btn-default btn-xs pull-right'\><span class='\glyphicon glyphicon-chevron-down'\></span></button>"
	    	      +"     <button type='\button'\ class='\btn btn-danger btn-xs pull-right'\ style='\margin-right: 0.3rem;'\>삭제</button>"
	    	      +"     <button type='\button'\ class='\btn btn-success btn-xs pull-right'\ style='\margin-right:0.3rem;'\>수정</button>"
	    	      +"    </div>"
	    	      +"  </div>"
	    	      +" <div id='\collapse"+boardList[i].no+"'\ class='\panel-collapse collapse'\>"
	    	      +"  <div class='\panel-body'\>"
	    	      +"    <div>"+ boardList[i].content +"</div>"
	    	      +"  </div>"
	    	      +" </div>"
	    	      +"</div>");
	    $("."+boardList[i].duedate).append($list);
	    	      
	}else{
		 var $list =$("<div class='\panel panel-default'\>"
	    	      +"<div class='\panel-heading'\ style='\height:4rem;'\>"
	    	      +"<div class='\panel-title'\>"
	    	      +"<button data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse"+boardList[i].no+"'\ class='\btn btn-default btn-xs'\ "
	    	      +"style='\margin-bottom: 0.3rem;'\> <span class='\glyphicon glyphicon-star-empty'\></span> </button>"
	    	      +"      <a data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse1'\ "
	    	      +"        style='\margin-left: 0.3rem;'\> "+ boardList[i].title +" </a>"
	    	      +"      <button data-toggle='\collapse'\ data-parent='\#accordion'\ href='\#collapse"+boardList[i].no+"'\ "
	    	      +"       class='\btn btn-default btn-xs pull-right'\><span class='\glyphicon glyphicon-chevron-down'\></span></button>"
	    	      +"     <button type='\button'\ class='\btn btn-danger btn-xs pull-right'\ style='\margin-right: 0.3rem;'\>삭제</button>"
	    	      +"     <button type='\button'\ class='\btn btn-success btn-xs pull-right'\ style='\margin-right:0.3rem;'\>수정</button>"
	    	      +"    </div>"
	    	      +"  </div>"
	    	      +" <div id='\collapse"+boardList[i].no+"'\ class='\panel-collapse collapse'\>"
	    	      +"  <div class='\panel-body'\>"
	    	      +"    <div>"+ boardList[i].content +"</div>"
	    	      +"  </div>"
	    	      +" </div>"
	    	      +"</div>");
	    $("."+boardList[i].duedate).append($list);
	}
}


/* alert(JSON.stringify(boardList)); */


</script>
  
<%-- 
<c:forEach  var="board" items="${boardList}">
	<tr>
		<td>${board.no}</td>
		<td>
			<c:if test="${board.priority < 1}">
				<span style="color:red;">( ${board.priority} )</span>
			</c:if>   
		</td>
		<td>${board.title}</td>
		<td><fmt:formatDate value="${board.duedate}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
</c:forEach>
 --%>

<!-- Group (Date 기준) -->
    <div class="panel-group" id="accordion"
      style="margin-bottom: 1rem; border-width: 0.2rem; border-style: solid; border-color: gainsboro; border-radius: 1rem;">

<!-- Date  -->
      <div style="margin-left: 46%; margin-right:46%; margin-bottom: 0.5rem; margin-top: 0.5rem;">
        2019.05.26
      </div>
      
<!-- List  -->
      <div class="panel panel-default">
      
      <!-- Panel header  -->
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse1"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        
        <!-- Panel body  -->
        <div id="collapse1" class="panel-collapse collapse">
          <div class="panel-body">
            <div> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
          </div>
        </div>
      </div>
      
      
      
      
      
      
      <div class="panel panel-default">
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse2"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        <div id="collapse2" class="panel-collapse collapse">
          <div class="panel-body">
            <div> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse3"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        <div id="collapse3" class="panel-collapse collapse">
          <div class="panel-body">
            <div> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
          </div>
        </div>
      </div>
    </div>



    <div class="panel-group" id="accordion"
      style="margin-bottom: 1rem; border-width: 0.2rem; border-style: solid; border-color: gainsboro; border-radius: 1rem;">
      <div style="margin-left: 46%; margin-right:46%; margin-bottom: 0.5rem; margin-top: 0.5rem;">
        2019.05.26
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse4" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse4"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        <div id="collapse4" class="panel-collapse collapse">
          <div class="panel-body">
            <div> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse5" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse5"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        <div id="collapse5" class="panel-collapse collapse">
          <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" style="height:4rem;">
          <div class="panel-title">
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse6" class="btn btn-default btn-xs"
              style="margin-bottom: 0.3rem;"> <span class="glyphicon glyphicon-star-empty"></span> </button>
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6"
              style="margin-left: 0.3rem;">Collapsible Group 1 </a>
            <button data-toggle="collapse" data-parent="#accordion" href="#collapse6"
              class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-chevron-down"></span></button>
            <button type="button" class="btn btn-danger btn-xs pull-right" style="margin-right: 0.3rem;">삭제</button>
            <button type="button" class="btn btn-success btn-xs pull-right" style="margin-right:0.3rem;">수정</button>
          </div>
        </div>
        <div id="collapse6" class="panel-collapse collapse">
          <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
