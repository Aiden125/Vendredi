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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<style>
		#content{
			margin: 100px auto;
			width:800opx;
			height:500px;
			background-color: yellow;
		}
		input[type='text']{
			border:none;
		}
		h3{
			cursor: pointer;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script>
	$(function() {
			 var resList = ${resList}; 
		   $("#selectDate").datepicker({
		            dateFormat : 'yy-mm-dd',
		            changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
		            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
		                  '7월', '8월', '9월', '10월', '11월', '12월' ],
		            showMonthAfterYear : true,
		            yearSuffix : '년', // "2020년 3월"
		            showOtherMonths : true,
		            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		            changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
		            minDate : 0, // 지난날 선택불가
		        	onSelect : function (dateText, inst){
		        		$('.rdate').val(dateText);
		        		for(var i = 9; i<= 22; i++){
		        			$('#' + i).attr('disabled', false);
		        			$('#' + i).css('color', '#000000');
		        		}
		        		var today = new Date(); // 오늘 날짜
		        		var year = today.getFullYear();
		        		var month = today.getMonth() + 1;
		        		if(month < 10){ // 2월 -> 02월
		        			month = '0' + month;
		        		}
		        		var day = today.getDate();
		        		if(day < 10){
		        			day = '0' + day; // 1일 -> 01일
		        		}
		        		temp = year + '-' + month + '-' + day;
		        		if(dateText == temp){
		        			for(var i = 0; i <=today.getHours()+1; i++){
		        				$('#' + i).attr('disabled', true);
		        				$('#' + i).css('color', '#cccccc');
		        			}
		        		}
		         $(resList).each(function(idx, item){
		        	 if(item.rdate == dateText){
		        		 for(var i=0; i<=24; i++){
		        			 if(item.rtime == i){
		        				 $('#' + i).attr('disabled', true);
		        				 $('#' + i).css('color', '#cccccc');
		        			 }
		        		 }
		        	 }
		         })
		        	}
		         });
		   $('form').submit(function(){
				var rdate = $('.rdate').text().trim();
				var rtime = $('.time').text().trim();
				var rmember = $('.rmember').text().trim();
				if(rdate == ''){
					alert('예약날짜를 입력하세요');
					return false;
				}
				if(rtime == ''){
					alert('예약시간을 입력하세요');
					return false;
				}
				if(rmember == ''){
					alert('예약인원을 입력하세요');
					return false;
				}
			 });
		});
	function func(i) {
		var i1 = i+':00'
		$('.time').val(i1);
		$('.rtime').val(i);
	}
	function dis() {
		if ($('#selectDate').css('display') == 'none') {
			$('#selectDate').show();
		} else {
			$('#selectDate').hide();
		}
	}
	function dis1() {
		if ($('#selectTime').css('display') == 'none') {
			$('#selectTime').show();
		} else {
			$('#selectTime').hide();
		}
	}
	
	
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="reservation.do">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="sno" value="${param.sno }">
		<input type="hidden" name="rtime" class="rtime">
		<input type="text" name="sname" value="${store.sname }">예약하기
		<h3 onclick="dis()">날짜선택</h3>
		<div id="selectDate" style="display: none">
			<p><b>선택한 날짜: </b>
				<input type="text" name="rdate"
					class="rdate" readonly="readonly"></p>
		</div>
		<h3 onclick="dis1()">시간선택</h3>
		<div id="selectTime" style="display: none">
			<p><b>선택한 시간: </b>
				<input type="text" name="time"
					class="time" readonly="readonly"></p>
			<c:forEach var="i" begin="${store.sstart }" end="${store.send }" >  <!-- 오픈, 마감시간으로 대체 -->
					<input type="button" id="${i }" value="${i }:00" onclick="func(${i})"/> 
			</c:forEach>
		</div>
		<h3>
			예약인원<input type="number" name="rmember" class="rmember">
		</h3>
		<br>
		<input type="submit" value="예약">
		<input type="button" value="뒤로" onclick=history.back()>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>