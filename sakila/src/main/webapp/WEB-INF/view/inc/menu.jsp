<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="sidebar" data-color="purple" data-background-color="white" data-image="${pageContext.request.contextPath}/assets/img/sidebar-1.jpg">
  <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

    Tip 2: you can also add an image using data-image tag
-->
  <div class="logo">
  	<a href="http://www.creative-tim.com" class="simple-text logo-normal">
      Sakila DVD
    </a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <li class="nav-item active  ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getBoardList">
          <i class="material-icons">dashboard</i>
          <p>직원게시판</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getStaffList">
          <i class="material-icons">person</i>
          <p>직원 목록</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getInventoryList">
          <i class="material-icons">content_paste</i>
          <p>재고 관리</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getFilmList">
          <i class="material-icons">library_books</i>
          <p>영화목록</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getActorList">
          <i class="material-icons">bubble_chart</i>
          <p>배우목록</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getSales">
          <i class="material-icons">location_ons</i>
          <p>매출목록</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/getCustomerList">
          <i class="material-icons">notifications</i>
          <p>손님목록</p>
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
          <i class="material-icons">language</i>
          <p>대여 / 대출</p>
        </a>
      </li>
    </ul>
  </div>
</div>

