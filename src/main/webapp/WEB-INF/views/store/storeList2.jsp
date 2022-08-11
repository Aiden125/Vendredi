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
       #storeList {
            font-family: 'IBM Plex Sans KR', sans-serif;
            margin-top: 20px;
            text-align: center;
        }
                #storeList .storeList{
                width:80%;
                margin: 0 auto;
                margin-bottom:20px;
                }
                #storeList .hotelticket table{
                border:1px solid lightgray;
                box-shadow:3px 3px 3px 3px gray;
                border-radius:5px;
                margin:0 auto;
                height:100%;

                width:65%;
                padding:15px;

                }
                    #storeList .hotelticket table .w2{
                        font-size:0.9em;
                    }
                    #storeList .hotelticket table .w3 {
                        font-size: 0.9em;
                        width:150px;
                        border-left:1px dashed black;
                    }
                    #storeList .hotelticket table td{
                    width:200px;
                    }
                    #storeList .hotelticket table button {
                        margin-top: 15px;
                        font-family: 'IBM Plex Sans KR', sans-serif;
                        height: 30px;
                        width: 75px;
                        background-color: #3e6170;
                        background-color: #3c5d79;
                        color: white;
                        border: none;
                        border-radius: 5px;
                    }
                    
                    img{
                    width:400px;
                    height:270px;
                    size:100%;
                    }
       
       #storeList table{
       border-collapse: separate;
       }
       #storeList table td{
       }
       
       #storeList table .td-1{
       height:10px;
       text-align: left;
       font-size:1.4em;
       font-weight: bold;
       color: #3c5d79;
       width:60%;
       
        
       }
       #storeList th{
       width:70%;
       padding-left:10px;
       }
        #storeList table .td-2{
       text-align: left;
       font-size:1.1em;
       font-weight: bold;
        color: black;
         padding-left:10px;
       height:5px; 

       }
       
        #storeList table .td-3{
        text-align: left;

       font-size:0.9em;
       font-weight: bold;
        color: black;
         padding-left:10px;
         height:5px;
        }
        
          #storeList table .td-4{
       font-size:1.1em;
       font-weight: bold;
        color: black;
        height:5px;
         padding-right:10px;
    	 text-align: center;
    	 padding-top:30px;
    	 padding-left:15px;
    	 
        }
		 #storeList table .td-5{
         text-align: center;
         height:15px;
         padding-bottom:40px;
        }
</style>
	<link href="${conPath }/assets/css/style.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
		function trclicked(sno) {
			location.href ='${conPath}/store/storeDetail.do?sno='+ sno ;
			
		}
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
	<div class="form-wrap">
	<table class="storeList"> 
		<c:if test="${paging.totCnt eq 0 }">
			<tr><th colspan="5">등록된 가게가 없습니다.</th> </tr>
		</c:if>
		<c:if test="${paging.totCnt != 0 }">
			<c:forEach items="${storeList }" var="store">
				<tr onclick="trclicked(${store.sno })"> 
					<td>
						${store.sno }
						<img alt="가게 이미지" src="${conPath }/storeImgFileUpload/${store.simage}" width = "100px">
					</td>
					<td>${store.sname }</td>
					<td> 
						${store.slocation }
					</td>
					<td> 
						${store.stype }
					</td>
					<td> 
						${store.stscore }
					</td>    
				</tr> 
			</c:forEach>
		</c:if>
	</table> 
		<div id="paging" align="center">
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/store.do?method=storeList&pageNum=${paging.startPage-1}&schItem=${param.schItem }">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color : red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/store.do?method=storeList&pageNum=${i}&schItem=${param.schItem }">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<a href="${conPath }/store.do?method=storeList&pageNum=${paging.endPage +1}&schItem=${param.schItem }">다음</a>]
		</c:if>
		</div>
	</div>
	</div> 

</body>
</html>
























