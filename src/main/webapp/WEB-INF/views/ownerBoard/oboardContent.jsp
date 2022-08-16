<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#content{
			width: 600px;
	        height : 500px;
	        margin: 0 auto;
	        max-width: 500px;
	        margin-top: 100px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content table{
			overflow: hidden;
		}
		#content table tr td{
			width:300px;
			text-align: center;
			padding-top:10px;
		}
		#content textarea{
			width:230px;
			padding-top:10px;
			margin-left: 30px;
		}
		#content input(not .btn){
			border-left:none;
			border-right:none;
			border-top:none;
		}
		#content input[type='file']{
			margin-left: 60px;
		}
		#content .btn{
			margin-top:30px;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content img{
			width:80px;
			height:80px;
			float: left;
			margin-right: 5px;
			margin-bottom: 5px;
		}
		#comment{
			width: 600px;
	        height : 100%;
	        margin: 0 auto;
	        max-width: 500px;
	        margin-bottom:80px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#comment .btn{
            background: #fff;
            border-color: black;
            padding:2px 5px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#comment .ccontent{
			width:200px;
		}
		#comment .td{
			margin:20px;
		}
	</style>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function func() {
		answer = confirm('해당글을 삭제하시겠습니까?');
		if (answer == true) {
			location.href = '${conPath}/oboard/Delete.do?bno=${oboard.bno }&pageNum=${param.pageNum }';
		} else {
			history.go(0);
		}
	}
	function func1(cno) {
		answer = confirm('해당 댓글을 삭제하시겠습니까?');
		if (answer == true) {
			location.href = '${conPath}/oboard/ComDelete.do?cno='+cno+'&bno=${oboard.bno }&pageNum=${param.pageNum }';
		} else {
			history.go(0);
		}
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
			<tr>
				<th>작성자</th>
				<td>${oboard.oid }</td>
			</tr>
			<tr>
				<th>가게명</th>
				<td>${oboard.sname }</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>${oboard.bloc }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${oboard.btitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre>${oboard.bcontent}</pre></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><c:if test="${not empty oboard.bphoto1 }">
						<img src="${conPath }/oboardImg/${oboard.bphoto1}" class="img">
					</c:if> <c:if test="${not empty oboard.bphoto2 }">
						<img src="${conPath }/oboardImg/${oboard.bphoto2}" class="img">
					</c:if> <c:if test="${not empty oboard.bphoto3 }">
						<img src="${conPath }/oboardImg/${oboard.bphoto3}" class="img">
					</c:if> <c:if test="${not empty oboard.bphoto4 }">
						<img src="${conPath }/oboardImg/${oboard.bphoto4}" class="img">
					</c:if> <c:if test="${not empty oboard.bphoto5 }">
						<img src="${conPath }/oboardImg/${oboard.bphoto5}" class="img">
					</c:if> <c:if
						test="${empty oboard.bphoto1 and empty oboard.bphoto2 and empty oboard.bphoto3 and empty oboard.bphoto4 and empty oboard.bphoto5 }">
						사진없음
					</c:if></td>
			</tr>
		</table>
		<c:if test="${owner.oid eq oboard.oid }">
			<input type="button" value="수정" class="btn"
				onclick="location.href='${conPath}/oboard/ModifyForm.do?bno=${oboard.bno }&pageNum=${param.pageNum }'">
			<input type="button" value="삭제"  class="btn" onclick="func()">
			<%-- <input type="button" value="삭제" onclick="location.href='${conPath}/oboard/Delete.do?bno=${oboard.bno }&pageNum=${param.pageNum }'"> --%>
			<input type="button" value="목록" class="btn"
				onclick="location.href='${conPath}/oboard/List.do?bno=${oboard.bno }&pageNum=${param.pageNum }'">
		</c:if>
		<c:if test="${! (owner.oid eq oboard.oid) }">
			<input type="button" value="목록" class="btn"
				onclick="location.href='${conPath}/oboard/List.do?bno=${oboard.bno }&pageNum=${param.pageNum }'">
		</c:if>
		<br> <br>
		</div>
		<div id="comment">
			<form
				action="${conPath }/oboard/ComWrite.do?bno=${oboard.bno}&pageNum=${param.pageNum}"
				method="post">
				<input type="hidden" name="oid" value="${owner.oid }">

				<table>
					<tr>
						<td><textarea rows="2" cols="40" name="ccontent"></textarea>
						</td>
						<td><input type="submit"  class="btn" value="댓글달기"></td>
					</tr>
				</table>
			</form>
			<table>
				<c:if test="${empty commentList}">
					<p>댓글 없음</p>
				</c:if>
				<c:if test="${not empty commentList}">
					<c:forEach var="comments" items="${commentList }">
						<tr>
							<td class="td">${comments.oid }</td>
							<td class="ccontent"><pre>${comments.ccontent }</pre></td>
							<td class="td">${comments.cdate }</td>
							<c:if test="${comments.oid eq owner.oid }">
								<td colspan="2"><input type="button" value="삭제" class="btn"
									onclick="func1('${comments.cno}')">
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>