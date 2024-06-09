<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.util.Map" %>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .review-header {
            
            margin-top: 20px;
        }
        .review-header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .overall-rating {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
        }
        .individual-rating {
            display: flex;
            flex-direction: column; /* Change flex direction to column */
            justify-content: space-between;
            margin: 20px 0;
            padding-right: 20px; /* Add padding to the right */
            border-right: 1px solid #ccc; /* Add right border to create a separator */
        }
        .individual-rating .bar-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .bar-container {width: 340px;}

        .individual-rating .bar {
            height: 10px;
            background-color: #ccc;
            margin-left: 10px;
            border-radius: 5px;
            width: 200px;
            position: relative;
        }
        .individual-rating .bar span {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #ffcc00;
            border-radius: 5px;
        }
        .total-rating {
            width: 321px;
            margin-left: 30px;
            display: flex;
            align-items: center;
            padding-left: 20px; /* Add padding to the left */
        }
        .total-rating h2 {
            margin: 0; padding: 0;
        }
        .total-rating .rating-details {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .reviews {
            margin-top: 20px;
        }
        .review {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
        .review .review-title {
            display: flex;
            align-items: center;
            display: block;
        }
        .review .review-title .stars {
            display: flex;
            align-items: center;
        }
        .review .review-title .stars span {
            font-size: 18px;
        }
        .review .review-title .date {
            color: #999;
            font-weight: 600;
        }
        .review .review-content {
            margin-top: 10px;
        }
        .review .review-images {
            display: flex;
            margin-top: 10px;
        }
        .review .review-images img {
            width: 60px;
            height: 60px;
            margin-right: 10px;
            background-color: #ccc;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #000;
        }
        
        .recontent {border: none;
            border-bottom: 1px solid #333;
            margin-top: 15px;
            width: 60%; 
            font-size: 15px;
            font-weight: 600;
        }

        .rebtn1 {border: none; 
            background-color: #fff; 
            cursor: pointer;
        }

        #id {display: block;
            margin: 5px 0px;
        }
        .score-wrapper { position: relative; }
        .score { position: relative; display: inline-flex;}
        .foreground { overflow: hidden; width: 0%; color: gold; margin: 0; cursor: pointer; }
        .background { position: absolute; color: gold; margin: 0; cursor: pointer;}
        
        .sfavg { overflow: hidden; width: 0%; color: gold; margin: 0; }
        .sbavg { position: absolute; color: gold; margin: 0;}

        .popup { display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; border: 1px solid #333; background: #fff; }
        .overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); }
    </style>
</head>
<body>
	<div class="container">
        <div class="review-header" style="text-align: center;">
            <h1>REVIEW</h1>
        </div>
        <div class="overall-rating">
            <div class="individual-rating">
		        <c:forEach var="star" items="${starAll}">
		            <div class="bar-container">
		                <span>${star.ratingRange}</span>
		                <div class="bar">
		                    <span style="width: ${star.percentage}%"></span>
		                </div>
		                <span>${star.count}</span>
		            </div>
		        </c:forEach>
		    </div>
        
            <div class="total-rating">
                <div style="text-align: center;">
                    <p style="margin-bottom: 5px; margin-top: 0px;">전체 평점</p>
                    <h2 class="pavg" style="font-size: 35px;">${avgStar}</h2>
                </div>
                <div class="rating-details" style="margin-left: 30px;">
                    <div class="score">
                        <p class="sfavg">★★★★★</p>
                        <p class="sbavg">☆☆☆☆☆</p>
                    </div>
                    <span>${replyCount}개 리뷰</span>
                </div>
            </div>
        </div>
        <form id="commentForm" action="${path2 }/reply/insReply.do" method="post" enctype="multipart/form-data">
            <div class="overlay" id="overlay">
                <svg xmlns="http://www.w3.org/2000/svg" height="12px" viewBox="0 -960 960 960" width="12px" fill="#EA3323">
                    <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                </svg>
            </div>
            <div class="popup" id="popup">
                <p>평점을 입력하세요:</p>
                <input type="number" id="ratingInput" name="ratingInput" min="0" max="5" step="0.1">
                <button onclick="submitRating()">제출</button>
            </div>
            <div class="review-header">
                <p>리뷰 작성하기</p>
                <div class="stars">
                    <div class="score-wrapper">
                        <div class="score" id="starRating">
                            <p class="foreground" style="font-size: 25px; cursor: pointer;">★★★★★</p>
                            <p class="background" style="font-size: 25px; cursor: pointer;">☆☆☆☆☆</p>
                        </div>
                        <span class="point" style="font-size: 25px;">평점</span>
                    </div>
                </div>
                <input style="height: 30px;" class="recontent" id="content" name="content" type="text" placeholder="리뷰를 작성해주세요.">
                <button class="rebtn1" id="rebtn1"><img style="width: 20px; height: 20px;" src="move_9743734.png" alt=""></button>
                <input type="file" id="fileInput" multiple="multiple" style="display: none;">
                <button class="rebtn2" id="rebtn2" type="submit" onclick="commentWrite()">등록</button>
            </div>
        </form>
        <div class="reviews">
            <div class="review">
                <div class="review-title">
                    <div class="stars" >
                        <span>★★★★☆</span>
                    </div>
                    <span id="id">작성자 아이디</span>
                    <div class="date">2019.03.30</div>
                </div>
                <div class="review-content">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                </div>
                <div class="review-images">
                    <img src="#" alt="review image 1">
                    <img src="#" alt="review image 2">
                </div>
            </div>
            <div class="review">
                <div class="review-title">
                    <div class="stars">
                        <span>★★★☆☆</span>
                    </div>
                    <div class="date">2019.03.30</div>
                </div>
                <div class="review-content">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                </div>
                <div class="review-images">
                    <img src="#" alt="review image 1">
                    <img src="#" alt="review image 2">
                    <img src="#" alt="review image 3">
                </div>
            </div>
        </div>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
    <script>
        function updateRating(rate) {
            const max = 5;
            const percent = (rate / max) * 100;
            $(".score-wrapper").find(".foreground").css("width", percent + "%");
            $(".score-wrapper").find(".point").text(rate);
        }

        //jquery를 이용한 show/hide 
        function openPopup() {
            $("#overlay").show();
            $("#popup").show();
        }

        function closePopup() {
            $("#overlay").hide();
            $("#popup").hide();
        }

        $("#starRating").click(function() {
            openPopup();
        });

        $("#overlay").click(function() {
            closePopup();
        });

        function submitRating() {
            event.preventDefault(); // form태그 안에서 새로고침 막는 용도
            const rate = parseFloat($("#ratingInput").val());
            if (!isNaN(rate) && rate >= 0 && rate <= 5) { //!isNaN 숫자인지 아닌지 검사
                updateRating(rate);
                closePopup();
            } else {
                alert("유효한 평점을 입력하세요 (0-5 사이).");
            }
        }

        function commentWrite() {
            event.preventDefault();

            const contents = $("#content").val();
            const ratingInput = $("#ratingInput").val();

            // 파일 업로드를 위한 FormData 객체를 생성
            const formData = new FormData();
            formData.append('content', contents);
            formData.append('ratingInput', ratingInput);

            // 파일이 선택되었다면 FormData에 추가
            const fileInput = document.getElementById('fileInput');
            if (fileInput.files.length > 0) {
                for (let i = 0; i < fileInput.files.length; i++) {
                    formData.append('files', fileInput.files[i]);
                }
            }

            $.ajax({
                type: "POST",
                url: "${path2 }/reply/insReply.do",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    console.log("댓글 등록 성공:", response);
                },
                error: function(xhr, status, error) {
                    console.error("댓글 등록 실패:", error);
                }
            });
        }

        document.getElementById("rebtn1").addEventListener("click", function() {
        document.getElementById("fileInput").click();
        });

        document.getElementById("fileInput").addEventListener("change", function() {
            const selectedFile = this.files[0];
            console.log("선택된 파일:", selectedFile);
        });
        
        
        $(document).ready(function() {
            const avgStar = $(".pavg").text(); 
            const max = 5;
            const percent = (avgStar / max) * 100;
            $(".rating-details").find(".sfavg").css("width", percent + "%");
        });
        
    </script>
</body>
</html>