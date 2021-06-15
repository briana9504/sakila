<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
         <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="${pageContext.request.contextPath}/" class="brand-logo">
                <img class="logo-abbr" src="${pageContext.request.contextPath}/images/logo.png" alt="">
                <img class="logo-compact" src="${pageContext.request.contextPath}/images/logo-text.png" alt="">
                <img class="brand-title" src="${pageContext.request.contextPath}/images/logo-text.png" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                        	<div class="search_bar dropdown">
                               
                            </div>
                           
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                   
                                    <a href="${pageContext.request.contextPath}/admin/logout"  class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">직원관리</li>
                    <!-- <li><a href="index.html"><i class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a>
                    </li> -->
                    <li><a aria-expanded="false" href="${pageContext.request.contextPath}/admin/getStaffList">
                    		<i class="icon icon-single-04"></i><span class="nav-text">직원목록</span></a>      
                    </li>
                    <li><a href="${pageContext.request.contextPath}/admin/getBoardList">
                    	<i  class="icon icon-layout-25"></i><span class="nav-text">직원게시판</span></a>
                    </li>
                    
                    
                    
                    <li class="nav-label">영화관리</li>
                    <li><a href="${pageContext.request.contextPath}/admin/getFilmList">
                    	<i class="icon icon-app-store"></i><span class="nav-text">영화목록</span></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/admin/getActorList">
                    	<i class="icon icon-single-copy-06"></i><span class="nav-text">배우목록</span></a>
                    </li>
                    
                    
                    <li class="nav-label">매장관리</li>
                    <li><a href="${pageContext.request.contextPath}/admin/getInventoryList">
                    	<i class="icon icon-world-2"></i><span class="nav-text">재고관리</span></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/admin/getSales">
                    	<i class="icon icon-chart-bar-33"></i><span class="nav-text">매출보기</span></a>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/admin/getCustomerList">
                    	<i class="icon icon-single-04"></i><span class="nav-text">고객목록</span></a>      
                    </li>
                                
                    <li class="nav-label">대여/반납</li>
                    <li><a href="${pageContext.request.contextPath}/admin/getRentalAndReturn">
                    	<i class="icon icon-form"></i><span class="nav-text">대여/반납</span></a>
                    </li>
                    
                </ul>
            </div>
        </div>