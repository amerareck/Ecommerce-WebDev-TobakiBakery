<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 사이드바 시작 -->
   <aside class="sidebar">
       <h3>관리자</h3>
       <ul class="nav nav-pills flex-column">
           <li class="nav-item"><a class="nav-link ${adminMain}" href="main">관리자메인</a></li>
       </ul>
       <hr class="hr"/>
       <h3>상품관리</h3>
       <ul class="nav nav-pills flex-column">
           <li class="nav-item"><a class="nav-link ${addProduct}" href="addProduct">상품등록</a></li>
           <li class="nav-item"><a class="nav-link ${orderList}" href="OrderList">주문조회</a></li>
       </ul>
       <hr class="hr"/>
       <h3>고객센터</h3>
       <ul class="nav nav-pills flex-column">
           <li class="nav-item"><a class="nav-link" href="../center/notice">공지사항</a></li>
           <li class="nav-item"><a class="nav-link" href="../center/product">상품문의</a></li>
       </ul>
   </aside>
   <!-- 사이드바 종료 -->