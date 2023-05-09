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
*{
   font-family: 'Noto Sans KR', sans-serif;
}

.books {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    overflow: hidden;
}

.book-title {
    margin-bottom: 10px;
    width: 100%;
}

.buttons {
    display: flex; 
    justify-content:space-around;
    
    width: 100%;
    
}

.buttons button{
   width: 18%;
   height: 5%;
   font-size: 10pt;
   color : black;
   border-radius: 10px;
   border: 2px;
   border-color: #168;
   background-color: transparent;
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
    <h4 class="book-title" style="margin-left: 17px;">추천도서</h4>
    <div class="books">
       <div class="buttons">
          <table style ="border-bottom: 1px; border-top: 1px;">
          <tr height = "30px;">
             <td>
                <button onclick="fetchBooks('336')" style="width: 100%; font-weight: bold;">자기계발</button>
             </td>
             <td>
               <button onclick="fetchBooks('351')" style="width: 100%; font-weight: bold;">컴퓨터</button>
             </td>
             <td>
               <button onclick="fetchBooks('1196')" style="width: 100%; font-weight: bold;">여행</button>
             </td>
             <td>
               <button onclick="fetchBooks('1383')" style="width: 100%; font-weight: bold;">수험/자격</button>
             </td>
         </tr>
         </table>
       </div>
       <div class="bookinfo" style="margin-top: 20px;">
           <c:forEach var="book" items="${books}">
               <div class="book-item">
                   <img class="front_cover" src="${book.imgUrl}" alt="${book.title}" style="height: 150px; width: 100px;">
                   <p class="book-title-text" style="font-size: 10pt;" >${book.title}</p>
               </div>
           </c:forEach>
       </div>
    </div>
</body>
</html>