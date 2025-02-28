<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <span style="color: white;">Nhà Sách </span><span style="color: red; font-weight: bold;">Trí Tuệ</span>
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <!-- Trang chủ -->
                <li class="nav-item active">
                    <a class="nav-link" href="#">Trang chủ</a>
                </li>

                <!-- Dropdown danh mục sách -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        Danh mục sách
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var="category" items="${CATEGORY_LIST}">
                            <a class="dropdown-item" href="<c:url value='/danh-muc?id=${category.id}'/>">
                                ${category.name}
                            </a>
                        </c:forEach>
                    </div>
                </li>
                <!-- Khuyến mãi -->
                <li class="nav-item mr-4">
                    <a class="nav-link text-danger font-weight-bold" href="#">
                        <span class="text-warning">★</span> <span class="text-danger">HOT</span> KHUYẾN MÃI
                    </a>
                </li>
                

                <!-- Ô tìm kiếm -->
                <li class="nav-item">
                    <form class="form-inline my-2 my-lg-0" action="<c:url value='/tim-kiem'/>" method="get">
                        <input class="form-control mr-sm-2" type="search" name="keyword" placeholder="Tìm kiếm sách..."
                            aria-label="Search">
                        <button class="btn btn-warning my-2 my-sm-0" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </li>

                <!-- Nút giỏ hàng -->
                <li class="nav-item">
                    <a class="nav-link text-white" href="<c:url value='/gio-hang'/>">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng <span class="badge badge-light">0</span>
                    </a>
                </li>

                <!-- Hiển thị thông tin đăng nhập -->
                <c:if test="${not empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Welcome, ${USERMODEL.fullName}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-danger text-white" href='<c:url value="/thoat?action=logout"/>'>Thoát</a>
                    </li>
                </c:if>
                <c:if test="${empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link btn btn-success text-white" href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
