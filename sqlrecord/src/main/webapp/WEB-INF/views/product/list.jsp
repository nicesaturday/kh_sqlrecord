<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/slick/slick.min.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/slick/slick-theme.min.css?after1"/>
    <meta charset="UTF-8">
    <title>Product Listing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        header {
            background-color: #fff;
            padding: 20px 0;
            border-bottom: 1px solid #ddd;
        }
        header .logo {
            display: inline-block;
            font-size: 24px;
            font-weight: bold;
        }
        header .navigation {
            display: inline-block;
            float: right;
        }
        header .navigation a {
            margin: 0 10px;
            text-decoration: none;
            color: #333;
        }
        .banner {
            position: relative;
            text-align: center;
            color: white;
        }
        .banner img {
            width: 100%;
            height: auto;
        }
        .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 36px;
            font-weight: bold;
        }
        .products-header {
            margin: 20px 0;
        }
        .products-header h1 {
            font-size: 24px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .product-item {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 20px;
            width: 23%;
            box-sizing: border-box;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .product-item img {
            width: 100%;
            height: auto;
            background-color: #ccc;
        }
        .product-item h3 {
            font-size: 18px;
            margin: 10px 0;
        }
        .product-item p {
            color: #888;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            font-weight: bold;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="banner">
        <img src="path/to/your/banner/image.jpg" alt="Banner Image">
        <div class="banner-text">
            RECORD PLAYERS
            <div>40 Products</div>
        </div>
    </div>
    <div class="container">
        <div class="products-header">
            <h1>RECORD PLAYERS</h1>
        </div>
        <div class="product-list">
            <!-- Sample Product Item -->
            <div class="product-item">
                <img src="path/to/your/product/image.jpg" alt="Product Image">
                <h3>Product Name</h3>
                <p>360,000₩</p>
            </div>
            <!-- Repeat above block for other products -->
        </div>
        <div class="pagination">
            <a href="#">&laquo; PREV</a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">NEXT &raquo;</a>
        </div>
    </div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>