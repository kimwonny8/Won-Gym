# WorkOutNow

기간: 2022년 11월 10일 → 2022년 12월 9일

[웹프로그래밍 쇼핑몰 제작_2101059김정원](https://prezi.com/view/mLhCHbzCcicx1nkyDbyu/)

# 📌 프로젝트명

### WorkOutNow(WON)

# 📌 프로젝트 개요

- 위치기반 트레이너 매칭 및 스케줄, 운동 기록 관리 사이트



# 📌일정

- 11/10 ~11/15  마인드맵, 메뉴, 스토리보드
- 11/16 ~ 11/17 : DB 설계
- 11/18 ~ 12/2 : 개발 진행
- 12/3 ~ 12/9 : 오류 수정

# 📌 스토리보드

[Storyboard.pdf](assets/Storyboard.pdf)

# 📌 ERD

<img src="assets/Untitled%2014.png" alt="Untitled" style="zoom:67%;" />

# 📌 사용 기술

JSP, 서블릿, MVC(프론트컨트롤러), MariaDB, DBCP, JDBC, JS, CSS, Ajax, JQuery

API(kakaopay, tosspayments, 카카오지도, ckeditor), SHA-256 

![Untitled](assets/Untitled%2015.png)

![Untitled](assets/Untitled%2016.png)

![Untitled](assets/Untitled%2017.png)

![Untitled](assets/Untitled%2018.png)

![Untitled](assets/Untitled%2019.png)

# 📌 기능 요약

1. 로그인
2. 회원가입
    - 아이디 비동기 중복 확인
    - 아이디 중복, 비밀번호 불일치, 빈 칸, 유효성 검사 실패시 진행 X
    - 생년월일, 휴대폰 번호 유효성 검사
    - 비밀번호 암호화(SHA-256 사용)
3. 마이페이지
  
    3-1. 코인 충전
    
    - kakaopay api
    - tosspayments api (가상계좌, 카드)
    
    3-2. 사진 변경
    
    - 사진 선택 안 했을 시 진행 안 됨
    - jpg, png만 가능
    - 사진 있는 사람은 추가, 없는 사람은 수정
    
    3-3. 회원 정보 수정
    
    - 비밀번호 본인 인증 후 진행
    - 회원 정보 수정 들어갔을 때 기존 정보 불러옴
    - 아이디, 이름은 수정 X
    - 생년월일, 휴대폰 번호 유효성 검사
    
    3-4. 회원 탈퇴
    
    - 비밀번호 본인 인증 후 진행
    
    3-5. 신청 내역 관리
    
    1) 트레이너 회원
    
    - 수락, 거절, 완료 등 진행 상황 변경 가능
    - 거절 시 일반회원에게 코인 자동 환불
    - 사용자 추가 입력칸 자세히 보기
4. 상품 게시글
    - 검색 기능
    
    4-1. 게시글 등록
    
    - 트레이너 회원만 작성 가능
    - ckeditor api 사용
    
    4-2. 게시글 수정/삭제
    
    - 본인 글만 수정 삭제 가능
    - 관리자는 게시글 관리에서 게시글 삭제는 가능
5. 장바구니 담기
    - 일반 회원만 가능(트레이너, 트레이너대기중 관리자 X)
    - 옵션 선택 후 추가
    - 카트에 이미 있는 동일한 상품 선택 시 담기지 않음
6. 장바구니/결제
  
    6-1. 바로 구매
    
    6-2. 삭제
    
    6-3. 선택한 물품만 구매
    
    - 체크박스 javascript, ajax 이용해 숫자, 가격 받아옴
    
    6-4. 추가 정보 입력
    
    - 키랑 몸무게는 1-200으로 제한
    - 숫자만 가능
    - 빈 칸일 시 진행 X
    
    6-5. 코인으로 결제
    
    - 코인 부족시 진행 X
7. 관리자 모드
  
    7-1. 회원 관리
    
    - 검색 기능
    - 등급 변경
    - 추방
    
    7-2 게시글 관리
    
    - 검색 기능
    - 글 번호 클릭 시 해당 페이지로 이동
    - 삭제

# 📌 화면캡쳐

## get 방식 오류 막기 / 준비중 게시판

- get방식으로 보낼 때 없는 값이나 이상한 값 들어오면 오류 페이지로 이동하게 만들었음
- 404, 500 에러를 최대한 내지 않으려고 노력함..
  
    ![Untitled](assets/Untitled%2020.png)
    
    ![Untitled](assets/Untitled%2021.png)
    
- 준비중인 게시판

<img src="assets/Untitled%2022.png" alt="Untitled" style="zoom:67%;" />

## 메인

![Untitled](assets/Untitled%2023.png)

![Untitled](assets/Untitled%2024.png)

## 로그인

![Untitled](assets/Untitled%2025.png)

## 회원가입

![Untitled](assets/Untitled%2026.png)

![Untitled](assets/Untitled%2027.png)

![Untitled](assets/Untitled%2028.png)

<img src="assets/Untitled%2029.png" alt="Untitled"  />

- 암호화된 상태로 DB에 들어간 모습
  
    <img src="assets/Untitled%2030.png" alt="Untitled" style="zoom: 67%;" />

## 소개

<img src="assets/Untitled%2031.png" alt="Untitled" style="zoom:67%;" />

## 수업신청 게시판

<img src="assets/Untitled%2032.png" alt="Untitled" style="zoom:67%;" />

- 글 선택시

<img src="assets/Untitled%2033.png" alt="Untitled" style="zoom:67%;" />

## 검색 이용

<img src="assets/Untitled%2034.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2035.png" alt="Untitled" style="zoom:67%;" />

## 장바구니 추가, 동일 상품 있을 시

<img src="assets/Untitled%2036.png" alt="Untitled" style="zoom:67%;" />

![Untitled](assets/Untitled%2037.png)

## 장바구니

<img src="assets/Untitled%2038.png" alt="Untitled" style="zoom:67%;" />

- 체크박스 전체 선택 / 개인 선택
  
    <img src="assets/Untitled%2039.png" alt="Untitled" style="zoom:67%;" />
    
    <img src="assets/Untitled%2040.png" alt="Untitled" style="zoom:67%;" />

## 결제 단계

<img src="assets/Untitled%2041.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2042.png" alt="Untitled" style="zoom:67%;" />

- 잔액 마이너스 일 땐 진행 되지 않음
  
    <img src="assets/Untitled%2043.png" alt="Untitled" style="zoom: 67%;" />

## 마이페이지(사진 변경)

![Untitled](assets/Untitled%2044.png)

- 사진 변경(jpg, png만 가능)
  
    ![Untitled](assets/Untitled%2045.png)
    
    - jpg일때는 저장 버튼 뜨는 모습
    
    ![Untitled](assets/Untitled%2046.png)
    
    - 완료된 모습
    
    <img src="assets/Untitled%2047.png" alt="Untitled" style="zoom:67%;" />

## 본인 인증 후 회원정보수정, 회원탈퇴

![Untitled](assets/Untitled%2048.png)

![Untitled](assets/Untitled%2049.png)

<img src="assets/Untitled%2050.png" alt="Untitled" style="zoom:67%;" />

## 코인 충전

- 카카오페이, tosspayments api

<img src="assets/Untitled%2051.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2052.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2053.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2054.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2055.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2056.png" alt="Untitled" style="zoom: 67%;" />

- 충전 완료

<img src="assets/Untitled%2057.png" alt="Untitled" style="zoom:67%;" />

## 신청내역관리 - 취소시 자동환불

<img src="assets/Untitled%2058.png" alt="Untitled" style="zoom:67%;" />

## 트레이너 - 신청내역관리/게시물 관리

- 자기한테 들어온 요청 관리
- 취소 시 코인은 자동환불

<img src="assets/Untitled%2059.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2060.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2061.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2062.png" alt="Untitled" style="zoom:67%;" />

## 트레이너 - 수업신청에서 글쓰기/글 수정/글 삭제

- api 불러오는 데 1초 정도 소요돼서 로딩 화면을 넣어 구현

![Untitled](assets/Untitled%2063.png)

- Ckeditor api 로 글 쓰기 구현

<img src="assets/Untitled%2064.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2065.png" alt="Untitled" style="zoom:67%;" />

- 작성된 모습
  
    <img src="assets/Untitled%2066.png" alt="Untitled" style="zoom:67%;" />

## 관리자모드

- 회원 관리 ⇒ 추방, 등급 변경
    - 트레이너 회원으로 가입시 트레이너 대기중이므로 자격증 정보 확인 후 승인 해줘야함
- 게시글 관리 ⇒ 글 삭제 가능

<img src="assets/Untitled%2067.png" alt="Untitled" style="zoom:67%;" />

- 트레이너(대기중) 글자 클릭시 자세한 내용 후 등급 변경

<img src="assets/Untitled%2068.png" alt="Untitled" style="zoom:67%;" />

<img src="assets/Untitled%2069.png" alt="Untitled" style="zoom:67%;" />

- 검색

![Untitled](assets/Untitled%2070.png)

- 게시글관리(삭제만 가능)

![Untitled](assets/Untitled%2071.png)