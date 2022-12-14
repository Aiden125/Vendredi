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
			width: 600px;
	        height : 100%;
	        margin: 0 auto;
	        max-width: 500px;
	        margin-top: 100px;
	        margin-bottom: 100px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content input:not(.btn) {
			border-left:none;
			border-right:none;
			border-top:none;
			margin:20px;
		}
		#content input[type='number']{
			width:80px;
		}
		#content input[type='text']:not(.sname){
			width:100px;
		}
		#content input[type='button']:not(.btn){
			border: none;
			background-color: #80ff00;
		}
		#content .btn{
			margin:30px 10px;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content .sname{
			font-size: 1.5em;
			border: none;
		}
		#content .rdate{
			margin-bottom: 50px;
		}
		#content h3{
			margin:20px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script>
	$(function() {
			 var resList = ${resList}; 
		   $("#selectDate").datepicker({
		            dateFormat : 'yy-mm-dd',
		            changeMonth : true, // ?????? ?????? ??? ?????? ????????? ?????? ??????
		            monthNamesShort : [ '1???', '2???', '3???', '4???', '5???', '6???',
		                  '7???', '8???', '9???', '10???', '11???', '12???' ],
		            showMonthAfterYear : true,
		            yearSuffix : '???', // "2020??? 3???"
		            showOtherMonths : true,
		            dayNamesMin : [ '???', '???', '???', '???', '???', '???', '???' ],
		            changeYear : true, // ?????? ?????? ??? ?????? ????????? ?????? ??????
		            minDate : 0, // ????????? ????????????
		        	onSelect : function (dateText, inst){
		        		$('.rdate').val(dateText);
		        		for(var i = 9; i<= 22; i++){
		        			$('#' + i).attr('disabled', false);
		        			$('#' + i).css('color', '#000000');
		        		}
		        		var today = new Date(); // ?????? ??????
		        		var year = today.getFullYear();
		        		var month = today.getMonth() + 1;
		        		if(month < 10){ // 2??? -> 02???
		        			month = '0' + month;
		        		}
		        		var day = today.getDate();
		        		if(day < 10){
		        			day = '0' + day; // 1??? -> 01???
		        		}
		        		temp = year + '-' + month + '-' + day;
		        		if(dateText == temp){
		        			for(var i = 0; i <=today.getHours()+1; i++){
		        				$('#' + i).attr('disabled', true);
		        				$('#' + i).css('background-color', '#495057');
		        			}
		        		}
		         $(resList).each(function(idx, item){
		        	 if(item.rdate == dateText){
		        		 for(var i=0; i<=24; i++){
		        			 if(item.rtime == i){
		        				 $('#' + i).attr('disabled', true);
		        				 $('#' + i).css('background-color', '#495057');
		        			 }
		        		 }
		        	 }
		         })
		        	}
		         });
		    $('form').submit(function(){
				var rdate = $('.rdate').val().trim();
				var rtime = $('.time').val().trim();
				var rmember = $('.rmember').val().trim();
				if(rdate == ''){
					alert('??????????????? ??????????????????');
					return false;
				}
				if(rtime == ''){
					alert('??????????????? ??????????????????');
					return false;
				}
				if(rmember == ''){
					alert('??????????????? ??????????????????');
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
			<h1>Reservation</h1>
			<input type="hidden" name="mid" value="${member.mid }">
			<input type="hidden" name="sno" value="${param.sno }">
			<input type="hidden" name="rtime" class="rtime">
			????????? : <input type="text" name="sname" class="sname" value="${store.sname }" readonly="readonly">
			<h3 onclick="dis()" style="cursor: pointer">????????????</h3>
			<div id="selectDate" style="display: none">
				<p><b>????????? ??????: </b>
				<input type="text" name="rdate"
					class="rdate" readonly="readonly" ></p>
			</div>
			<h3 onclick="dis1()" style="cursor: pointer">????????????</h3>
				<div id="selectTime" style="display: none">
					<p><b>????????? ??????: </b>
					<input type="text" name="time"
						class="time" readonly="readonly"></p>
				<c:forEach var="i" begin="${store.sstart }" end="${store.send }" >  <!-- ??????, ?????????????????? ?????? -->
						<input type="button" id="${i }" value="${i }:00" onclick="func(${i})"/> 
				</c:forEach>
			</div>
			<h3>
				????????????<input type="number" name="rmember" class="rmember">???
			</h3>
			<br>
			<input type="submit" value="??????" class="btn">
			<input type="button" value="??????" class="btn" onclick=history.back()>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>