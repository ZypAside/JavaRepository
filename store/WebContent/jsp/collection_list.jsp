<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的收藏</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>

			<%@include file="/jsp/head.jsp" %>
			 <c:if test="${empty pb || empty pb.data }">
					<h3>亲快去收藏吧~~</h3>
					</c:if>
					<c:if test="${not empty pb.data }">
		<div class="container">
			<div class="row">
				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的收藏</strong>
					<table class="table table-bordered">
					<tr class="warning">
									<th>图片</th>
									<th>书名</th>
									<th>价格</th>
									<th>热门</th>
									<th>删除</th>
								</tr>
								
								<c:forEach items="${pb.data }" var="p">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/${p.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.pid}">${p.pname}</a>
										</td>
										<td width="20%">
											￥${p.shop_price}
										</td>
										<td width="10%">
										<c:if test="${p.is_hot==1 }">是</c:if>
												<c:if test="${p.is_hot!=1 }">否</c:if>
										</td>
										<td width="15%">
											<!-- <span class="subtotal"> -->
											<a href="javascript:void(0);"onclick="removeFromCart('${p.pid}')">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</span>
										</td>
									</tr>
								</c:forEach>
						
					</table>
				</div>
			</div>
		<!--分页 -->
		<div style="width:380px;margin:0 auto;margin-top:50px;">
			<ul class="pagination" style="text-align:center; margin-top:10px;">
				
				<!-- 判断是否是第一页 -->
				<c:if test="${pb.pageNumber == 1 }">
					<li class="disabled">
						<a href="javascript:void(0)" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				
				<!-- 不是第一页 -->
				<c:if test="${pb.pageNumber != 1 }">
					<li>
						<a href="${pageContext.request.contextPath }/collection?method=findMyCOllectionByPage&pageNumber=${pb.pageNumber-1}&pid=${param.pid}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				
				<!-- 展示所有页码 -->
				<c:forEach begin="1" end="${pb.totalPage }" var = "n">
					<!-- 判断是否是当前页 -->
					<c:if test="${pb.pageNumber == n }">
						<li class="active"><a href="javascript:void(0)">${n }</a></li>
					</c:if>
					<c:if test="${pb.pageNumber != n }">
						<li><a href="${pageContext.request.contextPath }/collection?method=findMyCOllectionByPage&pid=${param.pid}&pageNumber=${n}">${n }</a></li>
					</c:if>
				</c:forEach>
				
				<!-- 判断是否是最后一页 -->
				<c:if test="${pb.pageNumber == pb.totalPage }">
					<li  class="disabled">
						<a href="javascript:void(0)" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pb.pageNumber != pb.totalPage }">
					<li>
						<a href="${pageContext.request.contextPath }/collection?method=findMyCOllectionByPage&pid=${param.cid}&pageNumber=${pb.pageNumber+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				
			</ul>
		</div>
		<!-- 分页结束=======================        -->
		</div>
 </c:if>
		<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>

		<script type="text/javascript">
		
		function removeFromCart(pid){
			if(confirm("确定要取消收藏吗？")){
				location.href="${pageContext.request.contextPath}/collection?method=delete&pid="+pid;
			}
		}
	</script>
	</body>

</html>