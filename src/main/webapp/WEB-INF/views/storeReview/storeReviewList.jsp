<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 100%;
    width: 100%;
    background-image: url(assets/img/디저트.jpg);
    background-position: center;
    background-size: cover;
    position: absolute;
} 
</style>
	<link href="conPath/assets/css/style.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<form action="${conPath }/store/writeReview.do?sno=${storeReview.sno}&mid=${member.mid}&mprofile=${member.mprofile}"> 
	<table>
		<tr>
			<td colspan="2"><textarea rows="5" cols="57" name="srcontent"></textarea>
		<tr>
		<tr>
			<td colspan="2">
				<p>리뷰사진 1 <input type="file" name="srimage1"> </p> <br>
				<p>리뷰사진 2 <input type="file" name="srimage2"> </p> <br>
				<p>리뷰사진 3 <input type="file" name="srimage3"> </p> <br>
				<p>리뷰사진 4 <input type="file" name="srimage4"> </p> <br>
				<p>리뷰사진 5 <input type="file" name="srimage5"> </p> <br> 	
			</td>
		</tr>
		<tr>
			<td>
				가게 점수
				<select name="srscore"> 
    					<option value="1">1</option>
    					<option value="2">2</option>
    					<option value="3">3</option>
    					<option value="4">4</option>
  						<option value="5" selected>5</option>
  				</select>
			</td>
			<td align="right">
				<input type="submit" value="리뷰등록" >
			</td>
		</tr>
	</table>
	</form>
	<table style="margin : 0 auto;"> 
		<c:if test="${paging.totCnt eq 0 }">
			<tr> <th colspan="5">등록된 리뷰가 없습니다.</th> </tr>
		</c:if>
		<c:if test="${paging.totCnt != 0 }">
				<c:forEach items="${storeReviewList }" var="storeReview">
				<tr>  
					<td>${storeReview.mid }</td>
					<td> 
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.mprofile }" width = "75px">
					</td>
					<td> 
						${storeReview.srcontent }
					</td>
					<td> 
						평가 점수 : ${storeReview.stscore }
					</td>
				</tr>
				<tr>	
					<td>
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage1}" width = "75px">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage2}" width = "75px">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage3}" width = "75px">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage4}" width = "75px">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage5}" width = "75px"> 
					</td>    
				</tr> 
			</c:forEach>
		</c:if>
	</table>
</body>
</html>