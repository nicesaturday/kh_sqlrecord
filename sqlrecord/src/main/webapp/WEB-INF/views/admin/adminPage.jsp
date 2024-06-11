<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/head.jsp" %>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>관리자 페이지</title>
<style>
.tab-bar {
    width: 100%;
    height: 60px;
    justify-content: center;
    align-items: center;
    display: flex;
    background-color: white;
    border-bottom: 1px solid #2f4f4f;
}
.tab-btnBox {
    width: 80%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.tab-btnItem {
    width: 10%;
    height: 100%;
    min-width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    cursor: pointer;
    border-right: 1px solid #929292;
    border-left: 1px solid #929292;
}
.tab-btnItem:not(:last-child) { border-right: none; }
.tab-btnItem:first-child { border-left: 1px solid #929292; }
.tab-btnItem:last-child { border-right: 1px solid #929292; }

.tab-btnItem a {
    color: black;
    text-decoration: none;
}
.mainBox {
    width: 1500px;
    min-width: 1200px;
    height: auto;
    border: 1px solid black;
    margin: 0 auto;
    padding: 10px;
    margin-top: 50px;
    margin-bottom: 50px;
}
.active {
    background-color: #2f4f4f;
}
.tab-btnItem.active a {
    color: white;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<!-- 상단 탭 -->
<div class="tab-bar">
    <ul class="tab-btnBox">
        <li class="tab-btnItem" data-tab="product"><a href="#product">상품</a></li>
        <li class="tab-btnItem" data-tab="order"><a href="#order">주문</a></li>
        <li class="tab-btnItem" data-tab="member"><a href="#member">회원</a></li>
        <li class="tab-btnItem" data-tab="payment"><a href="#payment">결제</a></li>
        <li class="tab-btnItem" data-tab="review"><a href="#review">리뷰</a></li>
        <li class="tab-btnItem" data-tab="analytics"><a href="#analytics">통계·분석</a></li>
        <li class="tab-btnItem" data-tab="board"><a href="#board">공지사항</a></li>
        <li class="tab-btnItem" data-tab="qna"><a href="#qna">고객지원</a></li>
    </ul>
</div>
<div class="mainBox">
    <div class="manageBox">
        <!-- 기본 콘텐츠는 상품 관리 -->
        jsp 불러올 곳
    </div>
</div>
<%@ include file="/footer.jsp" %>

<script>
$(document).ready(function() {
    // 함수: URL 해시를 기반으로 탭을 로드
    function loadTabFromHash() {
        var hash = window.location.hash.substring(1); // 해시 값 추출
        if (!hash) hash = "product"; // 기본 탭 설정
        $('.tab-btnItem').removeClass('active');
        $('.tab-btnItem a').css('color', 'black'); // 모든 탭의 글씨를 검정색으로 변경
        $('.tab-btnItem[data-tab="' + hash + '"]').addClass('active');
        $('.tab-btnItem[data-tab="' + hash + '"] a').css('color', 'white'); // 활성화된 탭의 글씨를 흰색으로 변경
        $('.manageBox').load('/admin/' + hash + '.jsp');
    }

    // 페이지 로드 시 URL 해시를 기반으로 탭을 로드
    loadTabFromHash();

    $('.tab-btnItem').click(function(e) {
        e.preventDefault(); // 새로고침 방지
        var tab = $(this).closest('.tab-btnItem').data('tab');
        window.location.hash = tab; // URL 해시 업데이트
        loadTabFromHash(); // 탭 로드
    });

    // 해시 변경 시 탭 로드
    $(window).on('hashchange', function() {
        loadTabFromHash();
    });
});
</script>
</body>
</html>
