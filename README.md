# WorkOutNow-Page
# 1. 프로젝트명

### WorkOutNow(WON)

# 2. 프로젝트 개요

### 위치기반 트레이너 매칭 및 스케줄, 운동 기록 관리 사이트

# 3. 프로젝트 수행 일정

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/06cf4bd9-a821-4bfd-9ca0-9886383e449f/Untitled.png)

# 4. ERD

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bd04e407-0887-42f4-baad-a8a98fd53b42/Untitled.png)

# 5. 사용 기술

JSP, 서블릿, MVC(프론트컨트롤러), MariaDB, DBCP, JDBC, JS, CSS, 지도 API, Ajax, JQuery

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dfbe9c31-71d0-41ab-afaf-dc2028aa3838/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1e9d114b-0625-4943-aa77-b9cf94db8597/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/df209504-401c-4a73-8e85-5747d479dc64/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5074728d-8fdd-40d8-9fc7-572bb0227cd7/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/af33caaf-0cfa-48b4-8a8e-9fbecb6c77be/Untitled.png)

# 6. 기능 요약

1. 로그인
2. 회원가입
    - 아이디 비동기 중복 확인
    - 아이디 중복, 비밀번호 불일치, 빈 칸, 유효성 검사 실패시 진행 X
    - 생년월일, 휴대폰 번호 유효성 검사
3. 마이페이지
    
    3-1. 코인 충전
    
    - 일단은 무통장 입금 선택 후 확인하면 충전되게 함
    
    3-2. 사진 변경
    
    - 사진 선택 안 했을 시 진행 안 됨
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
    
    4-2. 게시글 수정/삭제
    
    - 본인 글만 수정 삭제 가능
    - 관리자는 게시글 관리에서 게시글 삭제는 가능
5. 장바구니 담기
    - 일반 회원만 가능(트레이너, 관리자 X)
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
    

# 7. 실행 화면

## 메인(캐러셀사용)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d8f9c641-559d-4801-a751-e2a478345957/Untitled.png)

## 로그인

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0e23f107-e33c-41f4-ade1-7dca6d44636d/Untitled.png)

## 회원가입

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e48cf59a-6f8c-45fb-8e34-4cb42526ffc8/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3e82c866-e82f-4423-a9c2-210bbb2a958e/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ef141864-ae17-48ec-8f56-3f047d018b7e/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/89fca340-b659-453b-8b39-d16261bc60c0/Untitled.png)

## 소개

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/742aa037-18d7-433f-a7da-614325c34ce8/Untitled.png)

## 수업신청 게시판

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4a2bf1cb-8e47-43ff-ade3-b1a4d5d672a7/Untitled.png)

## 검색 이용

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d245bb9b-abf5-4a7b-a10e-e629c40fd5f3/Untitled.png)

## 장바구니 추가, 동일 상품 있을 시

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f6eaab04-ca8d-45bb-8519-3a04d2196c5e/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d2f850ed-9276-4cd6-9fd8-06d5e9d65f24/Untitled.png)

## 장바구니

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5cce43f0-ca8f-40bb-b7cc-db1e53cf58b7/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e3bd237b-f42b-431e-91e6-9670c60d6d09/Untitled.png)

## 결제 단계

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c418a4db-3293-420d-8df8-6258beea91e7/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/acaa4790-e29f-4bdf-89ff-b0f74c29efd7/Untitled.png)

## 마이페이지

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/50d7fcba-a3d3-429f-9e2f-d5772a9a4351/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dd07f93a-2835-43fc-b9d8-aa769cdeb5e5/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/30e7587a-59ee-4156-bdbb-727ba30faa79/Untitled.png)

## 본인 인증 후 회원정보수정, 회원탈퇴

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e6052699-5584-48d3-978c-d9311596b97f/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d408564a-cdee-4cfb-ab24-9de92f1a88eb/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ee52212c-7f1b-4afc-a6d5-e423831b8290/Untitled.png)

## 코인 충전

- 결제api 이용해서 다시 구현 예정

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7470f43f-0c3d-4977-9300-880955fd22b7/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/395a62cf-34b9-46d7-a5a4-e4a6510258d2/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/83cded0c-e13c-409d-8aef-a311401c645c/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/69b070c2-baa1-4b84-8a3e-b00dcbd684e8/Untitled.png)

## 신청내역관리 - 취소시 자동환불

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/010fb1a1-a521-48f9-bc09-e2192b7eb480/Untitled.png)

## 트레이너 - 수업신청에서 글쓰기/글 수정/글 삭제

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/881eb3ac-9cc7-424d-bf2f-607988641658/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d83b51e6-cf98-4991-a8fa-6c802b1ca4f0/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d946f58e-8894-4df6-b557-25c7b6cb4f9c/Untitled.png)

## 트레이너 - 신청내역관리

- 자기한테 들어온 요청 관리
- 취소 시 코인은 자동환불

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/da4fba22-7d2e-40a4-b265-729a8f0e2ca1/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3649fc17-b3eb-454e-8025-b76dfde7d91a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/724ffe1c-d38d-4509-87c5-c99596e2a1dd/Untitled.png)

## 관리자모드

- 회원 관리 ⇒ 추방, 등급 변경
- 게시글 관리 ⇒ 글 삭제 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a1379200-4eff-4a4d-aac3-03d0d1859c1a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2be720fd-419b-4956-aee0-02a3d472d57f/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/92effaef-48cd-436d-9caf-3d65c9f524ff/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a9d88200-7c63-4ba5-b73d-a6934fb11de3/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/467934a0-c190-4595-8805-ee985821644e/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1b72bc77-6928-4bac-9e49-67d694c493e9/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9c1c4404-7b74-40fd-8704-468a0a3097e9/Untitled.png)
