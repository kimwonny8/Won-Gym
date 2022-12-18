<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart - Buy Now!</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/cart.jpg");
}

</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<CartVO> cartList;
	cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
	CartVO cart;
	%>
	<div class="bottom">
		<p class="menuTitle">장바구니</p>
	</div>

	<div class="cartForm">
		<%
		if (cartList.size() == 0) {
		%>
		<div class="basicForm">

			<div class="basicFormInner">
				<p>장바구니에 담긴 상품이 없습니다.</p>
			</div>
		</div>

		<%
		} else {
		%>
		<table class="tableForm">
			<thead>
				<tr>
					<th><input type="checkbox" class="check" id="allChk" name="allChk"></th>
					<th>트레이너정보</th>
					<th>신청분류</th>
					<th>결제금액</th>
					<th>옵션</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < cartList.size(); i++) {
					cart = cartList.get(i);
					String thumbsnail = cart.getMi_thum_name();
					int mp_cnt = cart.getMp_cnt();
					String select;
					if (mp_cnt == 0)
						select = "상담요청";
					else
						select = "수업 " + mp_cnt + "회";
				%>

				<tr>
					<td><input type="checkbox" class="check"
						value="<%=cart.getMp_code()%>" name="check"></td>
					<td><img class="cartImg" src="<%=memberThumbDir%>/<%=thumbsnail%>" width=100 height=100>
						<br><%=cart.getT_name()%> 트레이너 <br>대구시 <%=cart.getC_code()%></td>
					<td><%=select%></td>
					<td><%=cart.getMp_coin()%></td>
					<td><a href="./buyRightNow.won?mp_code=<%=cart.getMp_code()%>"
						class="view">바로구매</a> 
						<a href="./deleteCartList.won?mp_code=<%=cart.getMp_code()%>"
						class="delete" onclick="return chk()">삭제</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="orderList">
			<div class="orderListLeft">
				<p>총 주문 금액</p>
			</div>
			<div class="orderListRight">
				<div class="orderListH">
					<p>주문상품 수</p>
					<p id="chkCnt">0 개</p>
				</div>
				<div class="orderListH">
					<p>주문 금액</p>
					<p id="chkCoin">0 코인</p>
				</div>
				<div class="orderListH">
					<p>할인 금액</p>
					<p>0 코인</p>
				</div>
				<div class="orderListH lastH">
					<p>최종 결제 금액</p>
					<p id="totalCoin">0 코인</p>
				</div>
			</div>
		</div>
		<input type="button" class="Btn inputBtn" value="주문하기" id="orderBtn">
		<%
		}
		%>
	</div>
	<%@ include file="../module/footer.jsp"%>
	<script type="text/javascript">
function chk(){
	var chk = confirm("정말 삭제하시겠습니까?");
 	return chk;
}	
	
$(document).ready(function() {
	var rowData = [];
	var chkMpCode = []; // 상품코드 담고 있는 배열
	var chkMpCoin = [0]; // 상품가격 담고 있는 배열
	
	// 전체 선택
	$("#allChk").click(function(){ 
		if($("#allChk").prop("checked")) {
		 	$("input[name='check']").prop("checked",true);

			// 전체 선택 -> 수정해야함..
			if($(this).is(":checked")) {
				$('input[name=check]:checked').each(function(i) {
					const tr = $('input[name=check]:checked').parent().parent().eq(i);
					const td = tr.children();
					rowData.push(tr.text());
					
					const coin = td.eq(3).text(); // 금액 가져오기
					chkMpCoin.push(coin);
					
					const tmp = chkMpCoin.map((i) => Number(i)); // 숫자형 배열로 변환
					const sumChkMpCoin = tmp.reduce(function add(sum, currValue){
						return sum+currValue; // 코인 합계
					})
					chkMpCode.push($(this).val());
					$('#chkCnt').text(chkMpCode.length+" 개");
					$('#chkCoin').text(sumChkMpCoin+" 코인");
					$('#totalCoin').text(sumChkMpCoin+" 코인");
				});
			}
	  	}else {
		 	$("input[name='check']").prop("checked",false);
		 	rowData = [];
		 	chkMpCode = [];
		 	chkMpCoin = [0];
		 	$('#chkCnt').text(chkMpCode.length+" 개");
		 	$('#chkCoin').text(0+" 코인");
			$('#totalCoin').text(0+" 코인");
	  	}
	});
	 
	$("input[name=check]").change(function() {		
		rowData = [];
		chkMpCode = []; // 상품코드 담고 있는 배열
		chkMpCoin = [0]; // 상품가격 담고 있는 배열
		
		if($(this).is(":checked")) {
			$("#allChk").prop("checked",false);
			$('input[name=check]:checked').each(function(i) {
				const tr = $('input[name=check]:checked').parent().parent().eq(i);
				const td = tr.children();
				rowData.push(tr.text());
				
				const coin = td.eq(3).text(); // 금액 가져오기
				chkMpCoin.push(coin);
				const tmp = chkMpCoin.map((i) => Number(i)); // 숫자형 배열로 변환
				const sumChkMpCoin = tmp.reduce(function add(sum, currValue){
					return sum+currValue; // 코인 합계
				})
				
				chkMpCode.push($(this).val());
				$('#chkCnt').text(chkMpCode.length+" 개");
				$('#chkCoin').text(sumChkMpCoin+" 코인");
				$('#totalCoin').text(sumChkMpCoin+" 코인");
			});
		}
		else {
			const tmp = chkMpCoin.map((i) => Number(i)); // 숫자형 배열로 변환
			const sumChkMpCoin = tmp.reduce(function add(sum, currValue){
				return sum+currValue; // 코인 합계
			})
			$('#chkCnt').text(chkMpCode.length+" 개");
			$('#chkCoin').text(sumChkMpCoin+" 코인");
			$('#totalCoin').text(sumChkMpCoin+" 코인");
		}
	});
	
 	$("#orderBtn").click(function(){
		const value = $('#chkCnt').text();
		if(value == 0) {
			alert("수업 선택 후 진행해 주세요.");
			return;
		}
		else {
			$.ajax({
				type: "post",
				traditional : true,
				data: { "chkMpCode" : chkMpCode },
				url: "./paymentProgress.won",
				success:function(value) {
					if(value=="" || value == null) {
						alert("[오류] 잠시 후 다시 시도해주세요.");
						history.go();
					}
					else {
						location.href="/kjw59_project/com/yju/2wda/team1/view/won/paymentProgress.jsp";
					}
				}
			});
		}
			
	});  
});
</script>
</body>
</html>