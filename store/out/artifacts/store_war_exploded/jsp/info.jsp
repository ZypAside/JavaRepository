<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
	<head></head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>个人信息</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

<style>
  body{
   margin-top:20px;
   margin:0 auto;
 }
 .carousel-inner .item img{
	 width:100%;
	 height:300px;
 }
 .container .row div{ 
	 /* position:relative;
	 float:left; */
 }
 
font {
    color: #3164af;
    font-size: 18px;
    font-weight: normal;
    padding: 0 10px;
}
 </style>
</head>
<body>
	<%@include file="/jsp/head.jsp" %>
 <script type="text/javascript">

      function reloadCheckImg()
      {
          $("img#sss").attr("src", "image/img.jsp?t="+(new Date().getTime()));  //<img src="...">
      }
      </script>



<div class="container" style="width:100%;background:url('${pageContext.request.contextPath}/image/regist_bg.jpg');">
<div class="row"> 

	<div class="col-md-2"></div>
	
	


	<div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
<a href="${pageContext.request.contextPath }/jsp/updateInfo.jsp"><h3>修改信息</h3></a>
		<form class="form-horizontal" style="margin-top:5px;" method="post" action="${pageContext.request.contextPath }/user">
			<input type="hidden" name="method" value="regist">
			 <div class="form-group">
			    <label for="username" class="col-sm-2 control-label" >用户名:</label>
			    <div class="col-sm-6">
			       <h4>${user.username}</h4> 
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">Email:</label>
			    <div class="col-sm-6">
			     <h4> ${user.email}</h4>
			
			    </div>
			  </div>
			 <div class="form-group">
			    <label for="usercaption" class="col-sm-2 control-label">姓名:</label>
			    <div class="col-sm-6">
			    <h4> ${user.name}</h4>
			      
			    </div>
			  </div>
			  <div class="form-group opt">  
			  <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>  
			  <div class="col-sm-6">
			   <h4> ${user.sex}</h4> 
			  
			</div>
			  </div>		
			  <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">出生日期</label>
		
			    <div class="col-sm-6">
			 <h4>  ${user.birthday}</h4>
			    </div>
			  </div>
			  
			<%--   <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">验证码</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" placeholder="请输入验证码" name="checkcode" size="4" >
			      
			    </div>
			    <div class="col-sm-2">
			     <a href="javascript:reloadCheckImg();"> <img id="sss" src="${pageContext.request.contextPath}/image/img.jsp"/></a>
			    </div>
			    
			  </div>
			 
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <input type="submit"  width="100" value="注册" name="submit" border="0"
				    style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
			    </div>
			  </div> --%>
			</form>
	</div>
	
	<div class="col-md-2"></div>
  
</div>
</div>

	  
	
	<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>
</body>
<script type="text/javascript">

	var val = "${user.username}";
	document.getElementById("username").value=decodeURI(val);
</script>
</html>




