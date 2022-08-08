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
    background-image: url('${conPath}/assets/img/디저트.jpg');
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 600px; 
    height : 2000px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    box-shadow: 0 0 600px 9px #fcae8f;
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border-radius: 30px;
    transition: .5s;
}
.social-icons {
    margin: 30px auto;
    text-align: center;
}
.social-icons img {
    width: 30px ;
    cursor: pointer;
}
.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border: 0;
    outline: none;
    border-radius: 30px;
}
.checkbox {
    margin: 30px 10px 30px 0;
}
span {
    color: #777;
    font-size: 12px;
    bottom: 68px;
    position: absolute;
}
#login {
    left: 50px;
}
#register {
    left: 450px;
}
</style>
	<link href="${conPath }/assets/css/style.css" rel="stylesheet"> 
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	

</head>
<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e603db168d967f3b35b2916c4eaf88a"></script>
	<c:if test="${writeRequestResult != null }">
		<script type="text/javascript">
		alert("가게 등록이 완료되었습니다.");
		</script> 
	</c:if>
	<c:if test="${storeModifyResult == 1 }">
		<script type="text/javascript">
		alert("가게 정보 수정이 완료되었습니다.");
		</script> 
	</c:if>
	<c:if test="${storeModifyResult == 0 }">
		<script type="text/javascript">
		alert("가게 정보 수정에 실패하였습니다.");
		</script> 
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
	<div class="form-wrap">
		<table style="margin : 0 auto;" >
		<tr>
			<td colspan="2">  
				<img alt="가게 이미지" src="${conPath }/storeImgFileUpload/${store.simage }" width = "75px">
			</td>
		</tr>
		<tr> 	  
			<td>
				<h1>${store.sname }</h1>
			</td>
			<td style="color:orange;">
				<fmt:formatNumber value="${store.sscore/store.sreplycnt }" pattern=".0"/>
			 </td>
		</tr> 
		<tr>
			<td colspan="2"> 
				
		<div id="map" style="width:500px;height:400px; margin:0 auto;"></div> 
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${store.slati}, ${store.slongti}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${store.slati}, ${store.slongti}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
	    	position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">${store.sname} <br><a href="https://map.kakao.com/link/map/${store.sname},${store.slati},${store.slongti}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${store.sname},${store.slati},${store.slongti}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(${store.slati}, ${store.slongti}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);   
</script>
			</td>
		</tr>
		<tr>
			<th>
				주소
			</th>	
			<td> 
				${store.saddress }
			</td>
		</tr>
		<tr>
			<th>
				가게 지역
			</th>	
			<td> 
				${store.slocation }
			</td>
		</tr>
		<tr>
			<th>
				가게 종류
			</th>	
			<td> 
				${store.stype }
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>	
			<td> 
				${store.stel }
			</td>
		</tr>
		<tr>
			<th>
				가격대
			</th>	
			<td> 
				${store.sprice }
			</td>
		</tr>
		<tr>
			<th>
				운영시간
			</th>	
			<td> 
				${store.stime }
			</td>
		</tr>
		<tr>
			<th>
				휴무
			</th>	
			<td> 
				${store.sholiday }
			</td>
		</tr> 
		<tr>	
			<th colspan="2" align="center">
				대표 메뉴 
			</th>
		</tr>  
		<tr>
			<th>
				${store.smenu1}
			</th>	
			<td> 
				${store.smenu1cost }
			</td>
		</tr>
		<tr>
			<th>
				${store.smenu2}
			</th>	
			<td> 
				${store.smenu2cost }
			</td>
		</tr>
		<tr>
			<th>
				${store.smenu3}
			</th>	
			<td> 
				${store.smenu3cost }
			</td>
		</tr>
		<tr>
			<th colspan="2">
				추후 owner, admin 적용하게 바꿀예정 <br>
				<input type="button" value="예약 페이지" onclick="location='${conPath}/request/writeRequest.do?sno=${param.sno }&oid=aaa&sname=${store.sname }'">
				<input type="button" value="등록 요청" onclick="location='${conPath}/request/writeRequest.do?sno=${param.sno }&oid=aaa&sname=${store.sname }'">
				<input type="button" value="가게 정보 수정" onclick="location='${conPath}/store/storeModifyView.do?sno=${param.sno }&oid=aaa'">
			</th>
		</tr>
		</table>		
		<br> 
	<form action="${conPath }/storeReview/writeReview.do" method="POST" enctype="multipart/form-data"> 
	<input type="hidden" value="${store.sno}" name="sno">
	<input type="hidden" value="aaa" name="mid">
	<input type="hidden" value="noimg.png" name="mprofile">
	<table>
		<tr>
			<td colspan="2"><textarea rows="5" cols="57" name="srcontent"></textarea>
		<tr>
		<tr>
			<td colspan="2">
				<p>리뷰사진 1 <input type="file" name="srimg1"> </p> <br>
				<p>리뷰사진 2 <input type="file" name="srimg2"> </p> <br>
				<p>리뷰사진 3 <input type="file" name="srimg3"> </p> <br>
				<p>리뷰사진 4 <input type="file" name="srimg4"> </p> <br>
				<p>리뷰사진 5 <input type="file" name="srimg5"> </p> <br> 	
			</td>
		</tr>
		<tr>
			<td> 
				<select name="srscore"> 
    					<option value="1">★☆☆☆☆</option>
    					<option value="2">★★☆☆☆</option>
    					<option value="3">★★★☆☆</option>
    					<option value="4">★★★★☆</option>
  						<option value="5" selected>★★★★★</option>
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
					<td>
						${storeReview.mid } <br>
						<img alt="프로필 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.mprofile }" width = "75px">
				    </td>
					<td> 
						평가 점수 : ${storeReview.srscore }
					</td>
				</tr>
				<tr>	
					<td> 
						${storeReview.srcontent }
					</td> 
				</tr>
				<tr>	
					<td>
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage1}" width = "75px">
						<c:if test="${storeReview.srimage2 != null} ">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage2}" width = "75px">
						</c:if>
						<c:if test="${storeReview.srimage3 != null} ">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage3}" width = "75px">
						</c:if>
						<c:if test="${storeReview.srimage4 != null} ">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage4}" width = "75px">
						</c:if>
						<c:if test="${storeReview.srimage5 != null} ">
						<img alt="리뷰 이미지" src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage5}" width = "75px"> 
						</c:if>
					</td>    
				</tr> 
			</c:forEach>
		</c:if>
	</table> 
	<div id="paging" align="center">
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/store/storeDetail.do?sno=${param.sno}&pageNum=${paging.startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color : red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/store/storeDetail.do?sno=${param.sno}&pageNum=${i}">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<a href="${conPath }/store/storeDetail.do?sno=${param.sno}&pageNum=${paging.endPage +1}">다음</a>]
		</c:if>
	</div>
	</div>	 
	</div> 
</body>
</html>