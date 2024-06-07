<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<meta charset="UTF-8">
<title>Product One</title>
<style>
  body {
    background-color: white;
  }
  
  #breadCrumb {
    width: 100%;
    padding-bottom: 30px;
    display: flex;
    justify-content: center;
  }
  #breadCrumb_items {
    width: 1500px;
    display: flex;
    gap: 15px;
    font-size: 18px;
    position: relative;
    padding: 20px 0;
  }
  #breadCrumb_items p a {
    color: #929292;
  }
  #breadCrumb_items p a:hover {
    color: black;
  }
  
  
  
  
  
  #section_main {
    width: 100%;
    height: 700px;
    display: flex;
    justify-content: center;
    padding: 50px 0;
    margin-bottom: 30px;
  }
  #section_main_box {
    width: 1500px;
    height: 100%;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }
  
  @media screen and (max-width: 1499px) {
   #section_main {
      height: auto;
   }
    #section_main_box {
      grid-template-columns: 1fr;
      grid-template-rows: 2fr;
    }
  }
  
  .sld-wrp {
  	width: 700px;
  	margin: 0 auto;
  	padding: 2rem;
   }
  
  .slider-for {
  	width: 700px;
  	margin: 0 auto;
  	position: relative;
  	z-index: 10;
    }

   .slide-container {
  	height: 30rem;
  	background-color: #fff;
  	text-align: center;
  	font-weight: bold;
  	margin-bottom: 20px;
  	box-sizing: border-box;
  	overflow: hidden;
    }

.slide-btn {
  text-align: center;
  box-sizing: border-box;
  padding: 20px;
  cursor: pointer;
}
.slider-nav .slide-btn {
  opacity: 0.5;
  transition: opacity 0.5s ease-in-out;
}

.slick-slide.slick-current.slick-active.slick-center .slide-btn {
  opacity: 1;
}
.slick-prev,.slick-arrow {
  background-color: white;
}
.slick-prev:before,.slick-arrow:before {
  background-color: white;
  color: black;
  font-size: 30px;
}

.slide-btn:focus {
  background-color: rgb(255, 179, 0);
}


#section_btn {
  display: flex;
}

#section_btn div {
  width: 100%;
  height: 50px;
  margin: 100px 0;
  font-size: 18px;
  cursor: pointer;
}
 
 
 
  

  .star-rating {
  	display: flex;
  }
  .star {
  	appearance: none;
  	padding: 1px;
  }

  .star::after {
  	content: '☆';
  	color: hsl(60, 80%, 45%);
  	font-size: 20px;
  }
  
  #point_graph div p {
    font-weight: 700;
    color: black;
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
  <p><a href="#">항목</a></p>
  <p>></p>
  <p><a>이름</a></p>
 </div> 
</div>


<div id="section_main">
  <div id="section_main_box">
    <div class="sld-wrp">
	 <div class="slider-for">
		<div class="slide-container">
		  <div style="width: 100%; height: 100%;">
		   <img src="${hpath }/resources/imgs/homepageLogo/turnTable.png" style="width: 100%; height: 100%; object-fit: cover;">
		  </div>
		</div>
		<div class="slide-container">
		  <div style="width: 100%; height: 100%;">
         	<img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp">
      	  </div>
		</div>
		<div class="slide-container">go 3</div>
		<div class="slide-container">go 4</div>
		<div class="slide-container">go 5</div>
		<div class="slide-container">go 6</div>
  </div>
  <div class="slider-nav">
    <div class="slide-btn">
      <div style="width: 100%; height: 100%;">
		 <img src="${hpath }/resources/imgs/homepageLogo/turnTable.png" style="width: 100%; height: 100%; object-fit: cover;">
	  </div></div>
    <div class="slide-btn">
      <div style="width: 100%; height: 100%;">
         <img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp" style="width: 100%; height: 100%; object-fit: cover;"">
      </div>
	</div>
    <div class="slide-btn">go 3</div>
    <div class="slide-btn">go 4</div>
    <div class="slide-btn">go 5</div>
    <div class="slide-btn">go 6</div>
  </div>

</div>
    <div style="padding: 9rem 2rem; font-size: 1.1rem;">
      <h2>이름</h2>
      <br>
      <h2>￦가격</h2>
      <br>
      <div style="display: flex; gap: 10px;">
       <div class="star-rating">
    	 <input type="radio" class="star" value="1">
    	 <input type="radio" class="star" value="2">
    	 <input type="radio" class="star" value="3">
    	 <input type="radio" class="star" value="4">
    	 <input type="radio" class="star" value="5">
  		</div>
  		<p>&nbsp;평균참여인원</p>
      </div>
      <br>
      <hr>
      <br>
      <div style="width: 100%; display: flex; justify-content: space-between;"><p>적립 포인트(5%)</p><p>포인트 원</p></div>
      <br>
      <p>구매량 :</p>
      <br>
      <div style="display: flex; gap: 10px; justify-content: space-between;">
        <input type="number" min="100" max="1000" step="100">
        <div style="width: 25rem; height: 3rem; cursor: pointer; font-size:20px; color: white; text-align: center; height: 3rem; line-height: 3rem; background-color: #2F4F4F">
          장바구니에 담기
        </div>
      </div>
    </div>
  </div>

</div>

<div id="section_btn">
  <div style="background-color: #383637; text-align: center; color: white; line-height: 50px; height: 50px;">상품 상세</div>
  <div style="background-color: #DEDEDE; text-align: center; color: black; line-height: 50px; height: 50px;">리뷰</div>
</div>

<h2 style="font-size: 5rem; text-align: center;">상품 설명1</h2>
<br><br><br>
<div id="section_img" style="width: 100%; display: flex; justify-content: center;">
  <div style="width: 800px; height: 800px; display: flex; justify-content: center;">
   <img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp" style="width: 100%; height: 100%; object-fit: cover;">
  </div>
</div>

<br><br><br>

<div id="section_detail" style="width: 100%; display: flex; justify-content: center;">
  <div style="width: 1500px; height: auto; padding: 200px;">
    자세한 설명
  </div>
</div>

<div id="section_review" style="width: 100%; display: flex; justify-content: center;">
  <div style="width: 1300px; height: 1667px; border: solid 2px #D6D6D6;">
    <h2 style="text-align: center; padding: 50px; font-size: 40px;">REVIEW</h2>
    
    <div style="width: 100%; display: flex; padding: 15px;">
     <div id="point_graph" style="width: 50%; border-right: 1px solid #D6D6D6;">
       <div style="display: flex; justify-content: center; padding-bottom: 2px;">
         <p>5점</p>&nbsp;<div style="width: 250px; border: 2px solid #D6D6D6; border-radius: 10px; overflow: hidden">
           <div style="position: relative; width: 85%; height: 100%; background-color: #D6D6D6; "></div>
         </div>&nbsp;<p>17</p>
       </div>
       <div style="display: flex; justify-content: center; padding-bottom: 2px;">
         <p>4점</p>&nbsp;<div style="width: 250px; border: 2px solid #D6D6D6; border-radius: 10px; overflow: hidden">
           <div style="position: relative; width: 15%; height: 100%; background-color: #D6D6D6; "></div>
         </div>&nbsp;<p>17</p>
       </div>
       <div style="display: flex; justify-content: center; padding-bottom: 2px;">
         <p>3점</p>&nbsp;<div style="width: 250px; border: 2px solid #D6D6D6; border-radius: 10px; overflow: hidden">
           <div style="position: relative; width: 15%; height: 100%; background-color: #D6D6D6; "></div>
         </div>&nbsp;<p>0</p>
       </div>
       <div style="display: flex; justify-content: center; padding-bottom: 2px;">
         <p>2점</p>&nbsp;<div style="width: 250px; border: 2px solid #D6D6D6; border-radius: 10px; overflow: hidden">
           <div style="position: relative; width: 15%; height: 100%; background-color: #D6D6D6; "></div>
         </div>&nbsp;<p>0</p>
       </div>
       <div style="display: flex; justify-content: center; padding-bottom: 2px;">
         <p>1점</p>&nbsp;<div style="width: 250px; border: 2px solid #D6D6D6; border-radius: 10px; overflow: hidden">
           <div style="position: relative; width: 15%; height: 100%; background-color: #D6D6D6; "></div>
         </div>&nbsp;<p>0</p>
       </div>
      </div>
      <div id="point_mark" style="width: 50%; border-left: 1px solid #D6D6D6;">
        <h5 style="text-align: center; padding-right: 1em; ">전체 평점</h5>
        <br>
        <div style="display: flex; justify-content: center; gap: 15px;">
          <h3 style="font-size: 32px;">점수</h3>
          <div>
           <div class="star-rating">
    	 	<input type="radio" class="star" disabled="disabled" value="1">
    	 	<input type="radio" class="star" disabled="disabled" value="2">
    	 	<input type="radio" class="star" disabled="disabled" value="3">
    	 	<input type="radio" class="star" disabled="disabled" value="4">
    	 	<input type="radio" class="star" disabled="disabled" value="5">
  		   </div>
  		   <p style="font-weight: 800; font-size: 18px;">(리뷰개수)개 리뷰</p>
  		  </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>
 <script>
    $('.slider-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	$('.slider-nav').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  asNavFor: '.slider-for',
	  dots: true,
	  centerMode: true,
	  focusOnSelect: true
	});
	document.querySelectorAll('.slide-btn').forEach((btn, index) => {
		  btn.addEventListener('click', () => {
		    document.querySelector('.slide-btn.active').classList.remove('active');
		    btn.classList.add('active');
		  });
		});
 </script>
 <script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html>