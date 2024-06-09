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
  height: 50%;
  height: 100%;
  line-height: 100%;
  margin: 0 25%;
}

#item2 {
  height: 300px;
  background-color: #F4F4F4;
  padding: 30px;
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
  <div id="section_basket_main_gridBox">
    <div class="item1">
      <div>선택</div>
      <div>이미지</div>
      <div>제품명</div>
      <div>가격</div>
      <div>수량</div>
      <c:forEach var="item" items="${list }" varStatus="status">
        <input onclick="onClickCount(this)" type="checkbox" name="" id="" value="${item.amount }">
      <div style="width: 100%; height: 100%;">
        <img src="${item.product.img1 }" style="width: 50%; height: 80%; padding: 10px; object-fit: cover;">
      </div>
      <div>${ item.product.name }</div>
      <div class="price">${item.product.price }</div>
      <div>${ item.amount}</div>
      </c:forEach>
      
      
      
      <input onclick="onClickCount(this)" type="checkbox" name="pno" id="id${status.count }" value="${data.pno }">
      <div style="width: 100%; height: 100%;">
        <img src="${hpath }/resources/imgs/homepageLogo/mainSlideimg1.png" style="width: 50%; height: 80%; padding: 10px; object-fit: cover;">
      </div>
      <div>radio</div>
      <div class="price">111,000</div>
      <div>4</div>
      
      
    </div>
    <div id="item2">
      <h2>합계</h2>
      <br>
      <hr>
      <br>
      <h4>Total : &nbsp; </h4> 
      <br><br><br>
      <div></div>
    </div>
    </div>
</div>





</div>
<script>
function onClickCount(f) {
	console.log(f);
	
}
  
</script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html>