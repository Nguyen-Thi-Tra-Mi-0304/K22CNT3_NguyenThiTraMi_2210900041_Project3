<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TriTueBookShop</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
.carousel-inner img {
	max-height: 400px; /* Điều chỉnh chiều cao mong muốn */
	object-fit: cover; /* Đảm bảo ảnh không bị méo */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<!-- Nội dung trang -->
	</div>

	<div class="container mt-4">
		<!-- Slider trên toàn bộ chiều rộng -->
		<div class="row">
			<div class="col-lg-12">
				<div id="bookCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1>Life Of The Wild</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="#" class="btn btn-primary">READ MORE →</a>
                </div>
                <div class="col-md-6 text-center">
                    <img src=""
                         class="d-block w-100" alt="Life Of The Wild">
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1>Another Book</h1>
                    <p>Some description here.</p>
                    <a href="#" class="btn btn-primary">READ MORE →</a>
                </div>
                <div class="col-md-6 text-center">
                    <img src="https://themewagon.github.io/booksaw/images/main-banner2.jpg"
                         class="d-block w-100" alt="Another Book">
                </div>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#bookCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#bookCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

			</div>
		</div>

		<!-- Sidebar + Sản phẩm -->
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">Category 1</a> <a href="#"
						class="list-group-item">Category 2</a> <a href="#"
						class="list-group-item">Category 3</a>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<%
						for (int i = 1; i <= 6; i++) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="http://placehold.it/700x400" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item <%=i%></a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

</body>
</html>