<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content{
			width:1000px;
			height:500px;
			margin:0 auto;
		}
		#content table{
			margin:100px auto;
			text-align: center;
		}
		#content th{
			margin:50px;
		}
	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
			<caption>Reservation</caption>
			<tr>
				<th>가게명</th>
				<th>예약자 ID</th>
				<th>예약자 번호</th>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>인원수</th>
			<c:forEach var="res" items="${reState }">
					<tr>
						<td>
							${res.sname }
						</td>
						<td>
							${res.mid }
						</td>
						<td>
							${res.mtel }
						</td>
						<td>
							${res.rdate}
						</td>
						<td>
							${res.rtime}
						</td>
						<td>
							${res.rmember}
						</td>
					</tr>
			</c:forEach>
		</table>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>