-- Store Dummy Sql
------------ 여기부터는 새로운 더미 --------------------------
commit; 
SELECT * FROM STORE;
------------ 가로수길 TOP 5 -------------------------------

insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'garosu001_1.jpg', 'garosu001_2.jpg', 'garosu001_3.jpg', '미라이', 
        '서울특별시 강남구 논현로153길 24 끌레르빌 1F' ,'강남', '010-1117-1171', 
        '일식, 이자까야, 오뎅', '2만원 - 5만원', '오후 6시 - 오전 12시', 
        '월요일, 화요일', '사시미8종 (2인)', '41000원', '마구로치즈아에', '19000원', 
        '양갈비 스미비 야끼', '23500원',
        '#강남#이자까야#청담동#논현#가로수길', 18, 24);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'garosu002_1.jpg', 'garosu002_2.jpg', 'garosu002_3.jpg', '상진식당', 
        '서울특별시 강남구 도산대로11길 31-10 B1' ,'강남', '	02-6439-2735', 
        '돈까쓰, 생선까쓰, 새우까쓰', '2만원 - 5만원', '오전 11시 - 오후 9시', 
        '월요일', '모둠까쓰(3인분)', '41000원', '히레까스', '14000원', 
        '연어까스', '32000원',
        '#돈까쓰#청담동#압구정#가로수길', 11, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'garosu003_1.jpg', 'garosu003_2.jpg', 'garosu003_3.jpg', '인딕 슬로우', 
        '서울특별시 강남구 압구정로4길 13 1F' ,'강남', '02-511-0139', 
        '그외, 인도 음식', '1만원 - 3만원', '오전 11시 - 오후 8시', 
        '휴일 없음', '브런치 탈리', '14000원', '인딕커리', '14500원', 
        '포도 블루치즈', '16200원',
        '#그외#인도음식#카레#압구정#가로수길', 11, 20);
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'garosu004_1.jpg', 'garosu004_2.jpg', 'garosu004_3.jpg', '빼아프', 
        '서울특별시 강남구 논현로175길 109 1F' ,'강남', '02-511-0139', 
        '디저트, 초콜렛', '2만원 - 5만원', '오후 12시 - 오후 7시', 
        '일요일', '봉봉 4구 세트', '14000원', '봉봉 6구 세트', '20000원', 
        '봉봉 15구 세트', '45000원',
        '#디저트#수제초콜렛#논현#가로수길', 12, 19);
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'garosu005_1.jpg', 'garosu005_2.jpg', 'garosu005_3.jpg', '콴안다오', 
        '서울특별시 강남구 강남대로156길 28-2 1F' ,'강남', '	02-512-1651', 
        '그외, 베트남 음식', '1만원 - 3만원', '오전 11시 - 오후 10시', 
        '일요일', '짜조', '6000원', '반미', '8000원', 
        '양지쌀국수', '11000원',
        '#그외#베트남#신사동#가로수길', 11, 22);
         
        

------------ 강남역 TOP 5 -------------------------------

insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gangnam001_1.jpg', 'gangnam001_2.jpg', 'gangnam001_3.jpg', '농민백암왕순대', 
        '서울특별시 강남구 역삼로3길 20-4' ,'강남', '02-512-3312', 
        '한식, 순댓국, 수육', '1만원 - 3만원', '오전 11시 - 오후 9시', 
        '일요일', '국밥', '9000원', '수육', '27800원', 
        '토종 순대', '10000원',
        '#순댓국#수육#강남#역삼역#강남역', 11, 21); 
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gangnam004_1.jpg', 'gangnam004_2.jpg', 'gangnam004_3.jpg', '로리스더프라임립', 
        '서울특별시 서초구 서초대로 411 GT타워 3F' ,'강남', '02-590-2800', 
        '양식, 스테이크, 바베큐', '7만원 이상', '오전 11시 - 오후 10시', 
        '일요일', '캘리포니아 컷 (170g)', '69000원', '잉글리쉬 컷 (200g)', '80000원', 
        '브레디 컷 (470g)', '129500원',
        '#양식#스테이크#프라임립#강남#강남역', 8, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gangnam005_1.jpg', 'gangnam005_2.jpg', 'gangnam005_3.jpg', '정돈', 
        '서울특별시 강남구 강남대로110길 26 1F' ,'강남', '02-590-2800', 
        '일식, 돈까스, 새우까스', '1만원 - 2만원', '오후 12시 - 오후 9시', 
        '일요일', '등심 돈카츠 (220g)', '16500원', '안심 돈카츠 (220g)', '17000원', 
        '프리미엄 부타도로 돈카츠 (180g)', '21500원',
        '#일식#등심까스#안심까스#강남#강남역', 12, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gangnam006_1.jpg', 'gangnam006_2.jpg', 'gangnam006_3.jpg', '강남명전', 
        '서울특별시 서초구 강남대로65길 12 1F' ,'강남', '070-4348-3371', 
        '한식 / 전, 막걸리', '2만원 - 3만원', '오전 11시 - 오전 12시', 
        '일요일', '치즈감자전', '21500원', '마늘수육과 보쌈김치', '27000원', 
        '맑은조개탕', '23500원',
        '#한식#해물파전#감자전#서초#강남역', 11, 24);       
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gangnam010_1.jpg', 'gangnam010_2.jpg', 'gangnam010_3.jpg', '장꼬방', 
        '서울특별시 서초구 강남대로61길 27' ,'강남', '02-597-5511', 
        '디저트 / 팥빙수', '1만원대', '오전 9시 - 오후 9시', 
        '공휴일', '팥빙수', '9000원', '찹쌀떡', '6000원', 
        '단팥죽', '11000원',
        '#디저트#팥빙수#찹쌀떡#단팥죽#강남#강남역', 9, 21);          
        
        

------------ 도산공원 TOP 5 -------------------------------
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'dosanpark001_1.jpg', 'dosanpark001_2.jpg', 'dosanpark001_3.jpg', 
        '시라카와', '서울특별시 강남구 선릉로161길 7 1F', '강남', '02-597-5511',  
        '일식 / 이자카야, 꼬치, 튀김', '2만원 - 3만원', '오전 9시 - 오후 9시', 
        '월요일', '덴푸라 10종오마카세', '32000원', '네기도로 김튀김', '16000원', '모듬꼬치 5종', '25000원',
        '#일식#이자카야#튀김#꼬치#압구정로데오역#도산공원', 9, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'dosanpark002_1.jpg', 'dosanpark002_2.jpg', 'dosanpark002_3.jpg', 
        '비스트로 드 윤뜨빌', '서울특별시 강남구 선릉로158길 13-7 이안빌딩 1F' ,'강남', '02-522-5121', 
        '양식 / 프랑스요리, 스테이크', '4만원 - 7만원', '오전 9시 - 오후 9시', 
        '월요일', '안심 스테이크', '45000원', '점심 코스', '46000원', '디너코스', '75000원',
        '#양식#프렌치#프랑스요리#스테이크#압구정로데오역#도산공원', 9, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'dosanpark003_1.jpg', 'dosanpark003_2.jpg', 'dosanpark003_3.jpg', 
        '소이연남마오', '서울특별시 강남구 도산대로53길 30' ,'강남', '02-545-5130', 
        '그외 / 태국, 똠양꿍, 쌀국수', '2만원 - 3만원', '오전 11시 - 오후 10시', 
        '월요일', '똠양쌀국수', '15000원', '소고기쌀국수', '11000원', '쏨땀', '15000원',
        '#그외#똠양꿍#쌀국수#압구정로데오역#도산공원', 11, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'dosanpark004_1.jpg', 'dosanpark004_2.jpg', 'dosanpark004_3.jpg', 
        '키겐', '서울특별시 강남구 언주로150길 51 B1' ,'강남', '02-542-5565', 
        '일식 / 스키야키, 솥밥', '10만원 이상' ,'오전 11시 - 오후 10시', 
        '일요일', '특상한우 스키야키코스', '155000원', '살치살 스테이크솥밥', '65000원', '자연산 도미솥밥', '55000원',
        '#일식#스키야키#솥밥#압구정로데오역#도산공원', 11, 22); 
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'dosanpark005_1.jpg', 'dosanpark005_2.jpg', 'dosanpark005_3.jpg', 
        '세시셀라', '서울특별시 강남구 도산대로45길 10-4 삼경빌딩 1F' ,'강남', '02-3448-7100', 
        '디저트 / 케익, 밀크티', '1만원 대', '오전 11시 - 오후 11시', 
        '월요일', '오늘의 밀크티', '7500원', '당근케이크', '8000원', '아이스크림', '8500원',
        '#디저트#케이크#밀크티#압구정로데오역#도산공원', 11, 23);         
        
        


------------ 청담 TOP 5 ------------------------------- 

insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'cheongdam001_1.jpg', 'cheongdam001_2.jpg', 'cheongdam001_3.jpg', 
        '스시카나에', '서울특별시 강남구 도산대로75길 15 노노빌딩 2F' ,'강남', '02-516-3350', 
        '일식 / 스시, 회', '7만원 이상', '오후 12시 - 오후 10시', 
        '공휴일', '런치 오마카세', '77500원', '디너 오마카세', '178000원', '런치 정식', '58500원',
        '#일식#스시#오마카세#청담역#청담', 12, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'cheongdam002_1.jpg', 'cheongdam002_2.jpg', 'cheongdam002_3.jpg', 
        '권숙수', '서울특별시 강남구 언주로170길 27 4F' ,'강남', '02-542-6268', 
        '한식 / 한정식', '10만원 이상', '오후 12시 - 오후 10시', 
        '일요일', '런치 정식', '135000원', '디너 숙수 정식', '179000원', '디너 수라 정식', '215000원',
        '#일식#스시#오마카세#청담역#청담', 12, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'cheongdam003_1.jpg', 'cheongdam003_2.jpg', 'cheongdam003_3.jpg', 
        '밍글스', '서울특별시 강남구 선릉로 757 힐탑빌딩 2F' ,'강남', '02-515-7306', 
        '한식 / 퓨전한식', '10만원 이상', '오후 12시 - 오후 10시', 
        '일요일', '런치 코스', '125000원', '디너 코스', '239000원', '디너 셰프 코스', '315000원',
        '#한식#퓨전한식#청담역#청담', 12, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'cheongdam004_1.jpg', 'cheongdam004_2.jpg', 'cheongdam004_3.jpg', 
        '리사르커피', '서울특별시 강남구 선릉로 757 힐탑빌딩 1F' ,'강남', '02-515-7306', 
        '디저트 / 커피', '1만원 - 3만원', '오전 11시 - 오후 10시', 
        '월요일', '생크림딸기쇼트케이크', '11500원', '얼그레이 팬케이크', '19000원', '로얄 티', '10000원',
        '#한식#퓨전한식#청담역#청담', 11, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'cheongdam005_1.jpg', 'cheongdam005_2.jpg', 'cheongdam005_3.jpg', 
        '라 티지', '서울특별시 강남구 선릉로134길 5 1F' ,'강남', '070-8828-0101', 
        '디저트 / 크림 브륄레, 타르트', '1만원대', '오전 10시 - 오후 7시', 
        '일요일', '까눌레', '3500원', '크림 브륄레', '11000원', '바닐라 타르트', '10500원',
        '#디저트#까눌레#타르트#크림브륄레#강남구청역#청담', 10, 19);          


------------ 여기까지 작업 --------------------------
------------ 성수 TOP 5 ----------------------------

insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'sungsoo001_1.jpg', 'sungsoo001_2.jpg', 'sungsoo001_3.jpg', 
        '미오도쿄다이닝', '서울특별시 성동구 연무장5가길 7 현대테라스타워 117호' ,'강북', '02-2223-2120', 
        '일식 / 일본 가정식', '1만원-2만원', '오전 11시 - 오후 8시', 
        '일요일', '도쿄수제함바그고젠 ', '13500원', '도쿄키마카레고젠', '11000원', '치킨스테이크고젠', '12500원',
        '#일식#일본가정식#성수역#성수', 11, 20);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'sungsoo002_1.jpg', 'sungsoo002_2.jpg', 'sungsoo002_3.jpg', 
        '세스크멘슬', '서울특별시 성동구 성수이로14길 7' ,'강북', '02-6082-0393', 
        '양식 / 햄, 소시지, 샌드위치', '1만원-2만원', '오전 11시 - 오후 9시', 
        '월요일', '콜드컷 샌드위치', '8500원', '스페셜플래터', '18000원', '보스나 샌드위치', '9500원',
        '#양식#수제햄#수제소시지#샌드위치#뚝섬역#성수', 11, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'sungsoo003_1.jpg', 'sungsoo003_2.jpg', 'sungsoo003_3.jpg', 
        '발렁스', '서울특별시 성동구 성수이로14길 7' ,'강북', '010-2510-7228', 
        '디저트 / 타르트, 치즈케이크', '1만원대', '오후 12시 - 오후 7시', 
        '월요일, 화요일', '피스타시에', '8500원', '코코플럼', '8000원', '케이크 플래터', '15500원',
        '#디저트#마들렌#수제타르트#성수역#성수', 12, 19);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'sungsoo004_1.jpg', 'sungsoo004_2.jpg', 'sungsoo004_3.jpg', 
        '마하차이', '서울특별시 성동구 뚝섬로 399 2F' ,'강북', '02-468-5678', 
        '그외 / 태국음식, 샌드위치', '1만원-2만원', '오전 11시 - 오후 9시', 
        '연중무휴', '오믈렛팟타이', '10000원', '톰얌꿍', '11000원', '푸팟퐁커리덮밥', '13500원',
        '#그외#태국#팟타이#푸팟퐁커리#성수역#성수', 11, 21);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'sungsoo005_1.jpg', 'sungsoo005_2.jpg', 'sungsoo005_3.jpg', 
        '원기옥', '서울특별시 성동구 아차산로17길 48 성수SK1CENTER 109호' ,'강북', '02-468-2999', 
        '한식 / 한정식, 백반', '1만원-2만원', '오전 11시 - 오후 9시', 
        '화요일', '홍탕', '12000원', '스지수육', '28000원', '고기국수', '11000원',
        '#한식#한정식#백반#수육#성수역#성수', 11, 21);        


------------ 건대 TOP 5 ------------------------------
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gundae001_1.jpg', 'gundae001_2.jpg', 'gundae001_3.jpg', 
        '오코노미야키식당하나', '서울특별시 광진구 능동로13길 111' ,'강북', '02-469-8884', 
        '일식 / 철판 요리', '1만원-2만원', '오전 11시 - 오후 11시', 
        '화요일', '오코노미야끼 (돼지타마)', '11000원', '오코노미야끼 (스페셜타마)', '12000원', '야키소바', '11000원',
        '#일식#철판요리#야끼소바#오코노미야키#건대입구역#건대', 11, 23);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gundae002_1.jpg', 'gundae002_2.jpg', 'gundae002_3.jpg', 
        '시홍쓰', '서울특별시 광진구 능동로13길 111' ,'강북', '0507-1491-4333', 
        '중식 / 기타 중식', '1만원-2만원', '오전 11시 - 오후 8시', 
        '일요일', '토마토계란덮밥', '9000원', '마파두부밥', '12000원', '창잉터우밥', '9000원',
        '#중식#중국요리#건대입구역#건대', 11, 20);


insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gundae003_1.jpg', 'gundae003_2.jpg', 'gundae003_3.jpg', 
        '얼땅쟈', '서울특별시 광진구 동일로18길 68' ,'강북', '02-467-2886', 
        '중식 / 기타 중식, 훠궈', '1만원-2만원', '오후 12시 - 오전 12시', 
        '연중무휴', '홍탕', '14000원', '홍탕+백탕', '12000원', '홍탕+토마토탕', '12000원',
        '#중식#훠궈#홍탕#백탕#건대입구역#건대', 12, 24);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gundae001_1.jpg', 'gundae001_2.jpg', 'gundae001_3.jpg', 
        '플록', '서울특별시 광진구 자양로19길 8 광석빌딩 1F' ,'강북', '070-7797-7700', 
        '양식 / 프랑스 음식', '3만원-5만원', '오전 11시 - 오후 10시', 
        '월요일', '어니언스프', '11000원', '비프타르타르', '23000원', '립아이스테이크', '51000원',
        '#프랑스#양파스프#립아이스테이크#비프필레스테이크#건대입구역#건대', 11, 22);
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'gundae001_1.jpg', 'gundae001_2.jpg', 'gundae001_3.jpg', 
        '민정식당', '서울특별시 광진구 아차산로42길 41-4 1F' ,'강북', '02-452-3574', 
        '한식 / 곰탕, 도가니탕, 전골', '1만원-3만원', '오전 11시 - 오후 10시', 
        '일요일', '도가니탕', '13000원', '꼬리곰탕', '18000원', '수육 (중)', '31000원',
        '#한식#도가니탕#꼬리곰탕#수육#건대입구역#건대', 11, 22);
 


------------ 이태원 TOP 5 -----------------------------
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'itaewon001_1.jpg', 'itaewon001_2.jpg', 'itaewon001_3.jpg', 
        '바위파스타바', '서울특별시 용산구 이태원로 254 B2' ,'강북', '02-423-3654', 
        '양식 / 이탈리안 파스타', '4만원 이상', '오후 5시 - 오후 11시', 
        '일요일, 월요일', '화이트 트러플 파스타', '53000원', '화이트 라구', '38000원', '파스타 테이스팅 코스', '71000원',
        '#양식#이탈리안#파스타코스#한강진역#이태원', 17, 23);
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'itaewon002_1.jpg', 'itaewon002_2.jpg', 'itaewon002_3.jpg', 
        '브라이리퍼블릭', '서울특별시 용산구 이태원로14길 19' ,'강북', '070-8879-1967', 
        '양식 / 바베큐', '3만원 이상', '오후 5시 - 오후 11시', 
        '월요일', '뱅 플래터', '18000원', '램 페테이토', '28000원', '미트 플래터', '40000원',
        '#양식#바베큐#녹사평역#이태원', 17, 23);
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'itaewon003_1.jpg', 'itaewon003_2.jpg', 'itaewon003_3.jpg', 
        '시칠리', '서울특별시 용산구 이태원로55가길 13' ,'강북', '02-6951-4250', 
        '양식 / 이탈리안 요리', '5만원 이상', '오전 11시 - 오후 10시', 
        '월요일', '오늘의 파스타', '33000원', '런치 코스', '58000원', '디너코스', '85000원',
        '#양식#이탈리안#한강진역#이태원', 11, 22);
        

insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'itaewon004_1.jpg', 'itaewon004_2.jpg', 'itaewon004_3.jpg', 
        '박소린두깜풍', '서울특별시 용산구 보광로59길 9' ,'강북', '0507-1411-2514', 
        '그외 / 아시안 에스닉 푸드', '1만원 3만원', '오전 11시 - 오후 10시', 
        '일요일, 월요일', '나시고랭 갈비 구이', '15000원', '나시고랭 오리 구이', '15000원', '컴플리트 플레이트', '35000원',
        '#그외#베트남#태국#이태원역#이태원', 11, 22);
        
        
insert into store (sNo, oId, sImage1, sImage2, sImage3, sName, sAddress, sLocation, sTel, sType, sPrice, 
                   sTime, sHoliday, sMenu1 , sMenu1cost , sMenu2, sMenu2cost, 
                   sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'itaewon005_1.jpg', 'itaewon005_2.jpg', 'itaewon005_3.jpg', 
        '주파카', '서울특별시 용산구 이태원로54길 68-5 1F' ,'강북', '0507-1346-4264', 
        '그외 / 남미요리', '3만원 이상', '오후 5시 - 오후 9시', 
        '화요일, 수요일', '바리아 타코', '43000원', '돼지고기 타코', '30000원', '소고기 타코', '35000원',
        '#그외#남미요리#타코#한강진역#이태원', 17, 21);
        
-- -- 여기부터 삽입 --        
------------ 한남동 TOP 5 -------------------------------

------------ 홍대 TOP 5 -------------------------------







