# :pushpin: Vendredi
>맛집 추천 가이드  
>http://15.164.130.227:8080/vendredi/

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 7월 28일 ~ 8월 16일
- 팀 프로젝트(4명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Oracle 11
  - MySQL 5.7
  
#### `DevOps`
  - Tomcat 9.0
  - eclipse
  - AWS EC2
  - Linux(Ubuntu)
  - Windows 10

#### `Front-end`
  - JavaScript
  - JQuery 3.6
  - Html/Css

</br>

## 3. ERD 설계
![image](https://user-images.githubusercontent.com/101315869/185061441-8ad21132-26de-4624-8864-fbae375cec38.png)


## 4. 핵심 기능
- 사용자는 보다 편리하게 맛집 조회가 가능합니다.
- 각 가게의 검색 태그를 통해 가게 및 음식 검색이 가능합니다.
- 다른 사용자들의 리뷰를 한 눈에 확인할 수 있습니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![image](https://user-images.githubusercontent.com/101315869/185076337-ebd4d939-41d5-46fc-8096-d1423dafc283.png)

### 4.2. 핵심 기능

- **사용자 예약처리** :pushpin: [코드 확인](https://github.com/Aiden125/Vendredi/blob/d6f4c2e36ba05fe1bf750be1f18ce5a26063410a/src/main/webapp/WEB-INF/views/reservation/reservation.jsp#L107-L116)
  - 시각적으로 한 눈에 들어올 수 있도록 select 타입을 사용하지 않는 페이지를 구현했습니다.
  
- **ajax를 통한 비동기 회원 가입페이지** :pushpin: [코드 확인](https://github.com/Aiden125/Vendredi/blob/491e2daf6d24deb2004be1635eaac91450f1a02d/src/main/webapp/WEB-INF/views/member/joinForm.jsp#L77-L135)
  - ajax를 통해 비동기식 회원가입 페이지를 구현했습니다.

- **업체 등록 승인 처리** :pushpin: [코드 확인](https://github.com/Aiden125/Vendredi/blob/38be89e3804dafa1879a66b64e343c73d7b8fff8/src/main/java/com/pro/vendredi/controller/RequestController.java#L42-L46)
  - Controller 및 Service를 통해 업체 승인 처리 되도록 구현했습니다.

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 예약 기능 문제
- 고객이 예약 서비스를 사용할 때 번거로움을 느끼지 않고 편리하게 진행할 수 있도록 만들고 싶었습니다.
- 예약 페이지를 시각적으로 한 눈에 들어올 수 있도록 option 타입을 사용하지 않는 페이지로 구현했습니다.

### 5.2. 즐겨찾기 추가/ 삭제 기능 추가 문제 
- 사용자가 즐겨찾기를 눌렀을 경우, 안눌렀을 경우에 대한 로직 처리에 어려움이 있었습니다.
- 사용자가 즐겨찾기를 누른 시점에 가게의 고유번호 및 사용자 세션 값을 받아와 테이블로 구성하여 문제를 해결했습니다.

### 5.3. 부트스트랩 충돌 문제
- 부트스트랩을 사용 했을 때 검색 기능 충돌로 인해 파라미터가 안넘어가는 문제가 있었습니다.
- jQuery를 통해 파라미터를 입력했을 때 form 태그가 작동하여 파라미터가 넘어가도록 문제를 해결했습니다.

### 5.4. 깃 충돌 & 플로우 문제
- 깃 협업을 처음 해보는 상황이고 정해진 기간에 대한 어려움이 있었습니다.
- 규모가 크지 않고 협업이 익숙하지 않다는 것을 고려해 각자의 브랜치를 나눠 마스터에 머지하는 방식으로 문제를 해결했습니다.


</div>
</details>

</br>

## 6. 차후 개선 사항
- https 적용 및 서버 최적화를 통해 실제 사용 가능한 수준으로
- 회원 별 예약 내용 및 결제 내역, 리뷰 수에 따른 등급제 적용
- 로그인 및 결제 API 연동, 모바일 UX/UI 적용
- 업체 리뷰 수에 따른 상위 노출 기준 적용

</br>

## 7. 회고 / 느낀점
  문희석</br>
>짧지만 팀장으로 팀프로젝트를 진행하면서 팀과 개인에 대해 생각하고 부딪혀 볼 수 있는 기회였고, 생각만 해보는 것과 실제로 해보는 것은 다르다는 것을 많이 느꼈습니다. 모든 것을 다 이루진 못했지만 작은 목표들을 달성했고, 소통하는 방법에 대해서 조금이나마 배우고 깊게 생각해 볼 수 있어서 좋았습니다.
</br> [자세한 회고](https://dosmallthing.tistory.com/154)
  
  </br>
  
  이진우</br>
>Spring mybatis framework을 사용하여 약 2주간 프로젝트를 진행했다. 처음 팀원들끼리 소통하며 제작함에도 원활하게 소통이 되었다. 그로 인해 처음 설계한 기능보다 더 세심한 기능을 구현할 수 있어서 좋았다. 아쉬운 점은 시간이 생각보다 부족하여 회의 때 나온 모든 기능을 구현하지 못했다는 점이다. 앞으로 시간이 된다면 못 다한 기능 구현을 추가적으로 구현해보고 싶다.
  </br>
  
  류지환</br>
>개인프로젝트 할 때와는 다르게 서로 다른 방식으로 페이지를 구성하고 데이터를 출력하는 모습을 보며 많이 배웠습니다. 잘 이끌어준 팀장님 많이 도와준 팀원분들께 감사드립니다.
  </br>
  
  김민우</br>
>저는 처음으로 해보는 팀 프로젝트여서 GIT 형상관리에 어려움이 있었습니다. 서버 배포에 목적을 두었던 이번 프로젝트에서 GIT 관리와 서버 DB연동이 핵심이었는데 이 부분이 해결되어서 만족스럽습니다. 하지만 제가 맡은 부분인 로그인 API를 DB연동에 실패해서 아쉬웠고 이 부분은  SpringBoot로 다시 로직을 구현해서 꼭 성공시키고 싶습니다.
  </br>
  

  
  
  
