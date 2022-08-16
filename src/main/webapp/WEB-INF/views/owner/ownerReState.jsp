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
			width:100%;
			height:100%;
		}
		#content table{
			width:800px;
			margin: 80px auto;
			border-collapse: collapse;
			text-align: center;
		}
		#content caption{
			margin : 40px auto;
		}
		#content tr{
			border-bottom: 1px solid;
			height: 50px;
			width: 100px;
		}
		#content .paging{
			margin-bottom : 80px;
			text-align: center;
		}
		#content .btitle{
			border: none;
			width: 150px;
		}
		#content h2{
			margin-top: 120px;
			text-align: center;
		}
		#content .btn{
			margin:  30px 0;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<h2>Reservation</h2>
		<table>
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
							${res.rtime}:00
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