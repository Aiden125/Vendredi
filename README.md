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
  - Html/css

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

## 6. 그 외 트러블 슈팅
<details>
<summary>npm run dev 실행 오류</summary>
<div markdown="1">

- Webpack-dev-server 버전을 3.0.0으로 다운그레이드로 해결
- `$ npm install —save-dev webpack-dev-server@3.0.0`

</div>
</details>

<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>

<details>
<summary>ElementUI input 박스에서 `v-on:keyup.enter="메소드명"`이 정상 작동 안하는 문제</summary>
<div markdown="1">
  
  - `v-on:keyup.enter.native=""` 와 같이 .native 추가로 해결
  
</div>
</details>

<details>
<summary> Post 목록 출력시에 Member 객체 출력 에러 </summary>
<div markdown="1">
  
  - 에러 메세지(500에러)
    - No serializer found for class org.hibernate.proxy.pojo.javassist.JavassistLazyInitializer and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.SerializationFeature.FAIL_ON_EMPTY_BEANS)
  - 해결
    - Post 엔티티에 @ManyToOne 연관관계 매핑을 LAZY 옵션에서 기본(EAGER)옵션으로 수정
  
</div>
</details>
    
<details>
<summary> 프로젝트를 git init으로 생성 후 발생하는 npm run dev/build 오류 문제 </summary>
<div markdown="1">
  
  ```jsx
    $ npm run dev
    npm ERR! path C:\Users\integer\IdeaProjects\pilot\package.json
    npm ERR! code ENOENT
    npm ERR! errno -4058
    npm ERR! syscall open
    npm ERR! enoent ENOENT: no such file or directory, open 'C:\Users\integer\IdeaProjects\pilot\package.json'
    npm ERR! enoent This is related to npm not being able to find a file.
    npm ERR! enoent

    npm ERR! A complete log of this run can be found in:
    npm ERR!     C:\Users\integer\AppData\Roaming\npm-cache\_logs\2019-02-25T01_23_19_131Z-debug.log
  ```
  
  - 단순히 npm run dev/build 명령을 입력한 경로가 문제였다.
   
</div>
</details>    

<details>
<summary> 태그 선택후 등록하기 누를 때 `object references an unsaved transient instance - save the transient instance before flushing` 오류</summary>
<div markdown="1">
  
  - Post 엔티티의 @ManyToMany에 영속성 전이(cascade=CascadeType.ALL) 추가
    - JPA에서 Entity를 저장할 때 연관된 모든 Entity는 영속상태여야 한다.
    - CascadeType.PERSIST 옵션으로 부모와 자식 Enitity를 한 번에 영속화할 수 있다.
    - 참고
        - [https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218](https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218)
   
</div>
</details>    

<details>
<summary> JSON: Infinite recursion (StackOverflowError)</summary>
<div markdown="1">
  
  - @JsonIgnoreProperties 사용으로 해결
    - 참고
        - [http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html](http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html)
        - [https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue](https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue)
        
</div>
</details>  
    
<details>
<summary> H2 접속문제</summary>
<div markdown="1">
  
  - H2의 JDBC URL이 jdbc:h2:~/test 으로 되어있으면 jdbc:h2:mem:testdb 으로 변경해서 접속해야 한다.
        
</div>
</details> 
    
<details>
<summary> 컨텐츠수정 모달창에서 태그 셀렉트박스 드랍다운이 뒤쪽에 보이는 문제</summary>
<div markdown="1">
  
   - ElementUI의 Global Config에 옵션 추가하면 해결
     - main.js 파일에 `Vue.us(ElementUI, { zIndex: 9999 });` 옵션 추가(9999 이하면 안됌)
   - 참고
     - [https://element.eleme.io/#/en-US/component/quickstart#global-config](https://element.eleme.io/#/en-US/component/quickstart#global-config)
        
</div>
</details> 

<details>
<summary> HTTP delete Request시 개발자도구의 XHR(XMLHttpRequest )에서 delete요청이 2번씩 찍히는 이유</summary>
<div markdown="1">
  
  - When you try to send a XMLHttpRequest to a different domain than the page is hosted, you are violating the same-origin policy. However, this situation became somewhat common, many technics are introduced. CORS is one of them.

        In short, server that you are sending the DELETE request allows cross domain requests. In the process, there should be a **preflight** call and that is the **HTTP OPTION** call.

        So, you are having two responses for the **OPTION** and **DELETE** call.

        see [MDN page for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

    - 출처 : [https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o](https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o)
        
</div>
</details> 

<details>
<summary> 이미지 파싱 시 og:image 경로가 달라서 제대로 파싱이 안되는 경우</summary>
<div markdown="1">
  
  - UserAgent 설정으로 해결
        - [https://www.javacodeexamples.com/jsoup-set-user-agent-example/760](https://www.javacodeexamples.com/jsoup-set-user-agent-example/760)
        - [http://www.useragentstring.com/](http://www.useragentstring.com/)
        
</div>
</details> 
    
<details>
<summary> 구글 로그인으로 로그인한 사용자의 정보를 가져오는 방법이 스프링 2.0대 버전에서 달라진 것</summary>
<div markdown="1">
  
  - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

    ```jsx
    @RequestMapping("/sso/user")
    @SuppressWarnings("unchecked")
    public Map<String, String> user(Principal principal) {
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            logger.info("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            map.put("email", details.get("email"));
            return map;
        }
        return null;
    }
    ```

    - 2.0대 버전에서는
    - 아래와 같이 principal 객체의 내용을 꺼내 쓸 수 있다.

    ```jsx
    UsernamePasswordAuthenticationToken token =
                    (UsernamePasswordAuthenticationToken) SecurityContextHolder
                            .getContext().getAuthentication();
            Map<String, Object> map = (Map<String, Object>) token.getPrincipal();

            String email = String.valueOf(map.get("email"));
            post.setMember(memberRepository.findByEmail(email));
    ```
        
</div>
</details> 
    
<details>
<summary> 랭킹 동점자 처리 문제</summary>
<div markdown="1">
  
  - PageRequest의 Sort부분에서 properties를 "rankPoint"를 주고 "likeCnt"를 줘서 댓글수보다 좋아요수가 우선순위 갖도록 설정.
  - 좋아요 수도 똑같다면..........
        
</div>
</details> 
    
</br>

## 7. 차후 개선 사항
- https 적용 및 서버 최적화를 통해 실제 사용 가능한 수준으로
- 회원 별 예약 내용 및 결제 내역, 리뷰 수에 따른 등급제 적용
- 로그인 및 결제 API 연동, 모바일 UX/UI 적용
- 업체 리뷰 수에 따른 상위 노출 기준 적용


## 8. 회고 / 느낀점
  이진우</br>
>Spring mybatis framework을 사용하여 약 2주간 프로젝트를 진행했다. 처음 팀원들끼리 소통하며 제작함에도 원활하게 소통이 되었다. 그로 인해 처음 설계한 기능보다 더 세심한 기능을 구현할 수 있어서 좋았다. 아쉬운 점은 시간이 생각보다 부족하여 회의 때 나온 모든 기능을 구현하지 못했다는 점이다. 앞으로 시간이 된다면 못 다한 기능 구현을 추가적으로 구현해보고 싶다.
  </br>
  
  류지환</br>
>개인프로젝트 할 때와는 다르게 서로 다른 방식으로 페이지를 구성하고 데이터를 출력하는 모습을 보며 많이 배웠습니다. 잘 이끌어준 팀장님 많이 도와준 팀원분들께 감사드립니다.
  </br>
  
  김민우</br>
>저는 처음으로 해보는 팀 프로젝트여서 GIT 형상관리에 어려움이 있었습니다. 서버 배포에 목적을 두었던 이번 프로젝트에서 GIT 관리와 서버 DB연동이 핵심이었는데 이 부분이 해결되어서 만족스럽습니다. 하지만 제가 맡은 부분인 로그인 API를 DB연동에 실패해서 아쉬웠고 이 부분은  SpringBoot로 다시 로직을 구현해서 꼭 성공시키고 싶습니다.
  </br>
  
  문희석</br>
>여기다가 후기를 쓸 예정입니다
  
  
  
