<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/head.jsp" %>
<title>Basket</title>
<style>
#section_basket_main {
  display: flex;
  justify-content: center;
  height: auto;
  margin-bottom: 20px;
}
#section_basket_main_gridBox {
  width: 1500px;
  display: grid;
  padding: 5px;
  grid-template-columns: minmax(700px, 1080px) 400px;
  grid-auto-rows: auto;
  gap: 10px;
}
#section_basket_main_gridBox div input {
  outline: none;
  border: none;
}
#section_basket_main_gridBox div input[type='checkbox'] {
  border-radius: 20px; 
} 
.item1 {
  display: grid;
  grid-template-columns: 10% 20% 40% 20% 10%;
  grid-auto-rows: minmax(100px, auto);
}



.item1 div:nth-child(-n+5) {
  font-size: 34px;
  font-weight: 800;
  line-height: 70px;
  height: 70px;
  text-align: center;
  padding-bottom: 10px;
  border-bottom: 2px solid black;
}

.item1 div , .item1 input {
  font-size: 22px;
  font-weight: 600;
  line-height: 100px;
  height: 100px;
  text-align: center;
}
.item1 input {
  width: 50%;
  height: 100%;
  line-height: 100%;
  margin: 0 25%;
}

.check {
  display: none;
}
input[class="check"] + label {
  display: inline-block;
  width: 30px;
  height: 30px;
  border: 3px solid #707070;
  position: relative;
  right: -35%;
  top: 30%;
}
input[class="check"]:checked + label:after {
  content: '✔';
  font-size: 25px;
  width: 30px;
  height: 30px;
  text-align: center;
  position: absolute;
  left: 0;
  top: 0;
}



#item2 {
  height: 300px;
  background-color: #F4F4F4;
  padding: 30px;
}
.submitBtn {
  background-color: #2F4F4F;
  color: white;
  width: 100%;
  height: 50px;
  line-height: 50px;
  font-weight: 800;
  cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div id="main_content">
<%@ include file="/searchHeader.jsp" %>
<div id="breadCrumb">
 <div id="breadCrumb_items">
  <p><a href="${hpath }">HOME</a></p>
  <p>></p>
  <p><a href="#">Basket</a></p>
 </div> 
</div>

<div id="section_basket_main">
  <form onsubmit="return ">
  <div id="section_basket_main_gridBox">
    <div class="item1">
      <div>선택</div>
      <div>이미지</div>
      <div>제품명</div>
      <div>가격</div>
      <div>수량</div>
      
      <c:forEach var="item" items="${list }" varStatus="status">
      
      <input onclick="onClickCount(this)" checked="checked" class="check" type="checkbox" name="${item.product.pno }" id="check${status.count }" value="${item.product.pno }">
      <label for="check${status.count }"></label>
      <div style="width: 100%; height: 100%;">
        <img src="${item.product.img1 }" style="width: 50%; height: 80%; padding: 10px; object-fit: cover;">
      </div>
      <div>${ item.product.name }</div>
      <div class="price check${status.count }"><input type="text" readonly="readonly" name="price" value=${item.product.price }></div>
      <div class="amount check${status.count }"><input type="text" readonly="readonly" name="amount" value=${ item.amount}></div>
      
      </c:forEach>
      
      
      
  
      
      
    </div>
    
    <div id="item2">
      <h2>합계</h2>
      <br>
      <hr>
      <br>
      <div style="display: flex; overflow: hidden;">
        <h4 style="width: 100%; font-size: 30px;">Total :</h4>
        <input type="text" id="totalPrice" readonly="readonly" style="width: 100%; font-size: 30px; background-color: #F4F4F4" >
      </div>
      <br><br><br><br><br>
      <button class="submitBtn" type="submit" >구매하기</button>
    </div>
    </div>
    </form>
</div>





</div>
<script>
// 체크박스 선택시 모든 상품들의 수량과 가격을 계산함.
let checkList = document.querySelectorAll(".check");
let amountList = document.querySelectorAll(".amount input");
let priceList = document.querySelectorAll(".price input");
let totalInput = document.querySelector("#totalPrice");
let totalPrice = 0;
function onClickCount(f) {
	totalPrice = 0;
	for(var i = 0; i < amountList.length; i++) {
		if(checkList[i].checked) {
			totalPrice += parseInt(amountList[i].value) * parseInt(priceList[i].value);
		} 
	}
	totalInput.value = totalPrice;
}

// 초기 계산 값 호출.
function getTotalPrice() {
	let priceList = document.querySelectorAll(".price input");
	document.querySelectorAll(".amount input").forEach((a,index) => totalPrice += parseInt(a.value) * parseInt(priceList[index].value));
	console.log(totalPrice);
	document.querySelector("#totalPrice").value = totalPrice;
}
getTotalPrice();
</script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html>