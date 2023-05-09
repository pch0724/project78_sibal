<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<style>
.books {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    overflow: hidden;
}

.book-title {
    margin-bottom: 10px;
    text-align: left;
    width: 100%;
}

.buttons {
    display: flex;
    
    width: 100%;
    
}

.buttons button{
	width: 18%;
	font-size: 9pt;
	border: 1px solid black;
	background-color: white;
}

.bookinfo {
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 100%;
    width: 100%;
    overflow: hidden;
}

.book-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

img.front_cover {
    max-height: 80%;
    max-width: 80%;
}
.book-title-text {
    word-wrap: break-word;
    text-align: center;
    width: 100%;
    margin: 0;
}
</style>
<script>
function fetchBooks(categoryId) {
    $.ajax({
        url: '${root}ma/books/' + categoryId,
        dataType: 'html',
        success: function (data) {
            $('.books').html(data);
        },
        error: function (xhr, status, error) {
            console.log('Error fetching book data: ' + error);
        }
    });
}
</script>
</head>
<body>
    <div class="books">
    <h4 class="book-title">추천도서</h4>
	    <div class="buttons">
		    <button onclick="fetchBooks('336')">자기계발</button>
			<button onclick="fetchBooks('351')">컴퓨터</button>
			<button onclick="fetchBooks('1196')">여행</button>
			<button onclick="fetchBooks('1383')">수험/자격</button>
	    </div>
	    <div class="bookinfo">
	        <c:forEach var="book" items="${books}">
	            <div class="book-item">
	                <img class="front_cover" src="${book.imgUrl}" alt="${book.title}">
	                <p class="book-title-text">${book.title}</p>
	            </div>
	        </c:forEach>
	    </div>
    </div>
</body>
</html>