<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的订单</title>
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
					<h3>亲快去下单吧~~</h3>
					</c:if>
					<c:if test="${not empty pb.data }">
		<div class="container">
			<div class="row">
				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">
						<c:forEach items="${pb.data }" var="o">
							<tbody>
								<tr class="success">
									<th colspan="2">订单编号:${o.oid } </th>
									<th colspan="1">
										<c:if test="${o.state == 0 }"><a href="${pageContext.request.contextPath }/order?method=getById&oid=${o.oid}">去付款</a></c:if>
										<c:if test="${o.state == 1 }">已付款</c:if>
										<c:if test="${o.state == 2 }"><a href="${pageContext.request.contextPath}/adminOrder?method=updateState&oid=${o.oid}&action=querenshouhuo">确认收货</a></c:if>
										<c:if test="${o.state == 3 }">已完成</c:if>
										<c:if test="${o.state == 4 }">退款中</c:if>
										<c:if test="${o.state == 5 }">成功退款</c:if>
									</th>
									<th colspan="1">金额:${o.total }元 </th>
									<th colspan="1">
									<c:if test="${o.state==1||o.state==2 }">
									<a href="javascript:void(0);"onclick="removeFromCart('${o.oid}')">退款 </a>
									</c:if>
									<c:if test="${o.state==0||o.state==3||o.state==5 }">
									<a href="javascript:void(0);"onclick="deleteFromCart('${o.oid}')">删除订单 </a>
									</c:if>
									</th>
								</tr>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
								<c:forEach items="${o.items }" var="oi">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/${oi.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a href="${pageContext.request.contextPath}/product?method=getById&pid=${oi.product.pid}">${oi.product.pname}</a>
										</td>
										<td width="20%">
											￥${oi.product.shop_price}
										</td>
										<td width="10%">
											${oi.count }
										</td>
										<td width="15%">
											<span class="subtotal">￥${oi.subtotal }</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:forEach>
						
					</table>
				</div>
			</div>
			<%@include file="/jsp/page.jsp" %>
		</div>
 </c:if>
		<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>

		<script type="text/javascript">
		function removeFromCart(oid){
			if(confirm("亲您忍心退掉我吗?")){
				location.href="${pageContext.request.contextPath}/adminOrder?method=updateState&action=qutuikuan&oid="+oid;
			}
		}
		function deleteFromCart(oid){
			if(confirm("确认要删除已完成的订单吗？")){
				location.href="${pageContext.request.contextPath}/order?method=delete&oid="+oid;
			}
		}
	</script>
	</body>

</html>