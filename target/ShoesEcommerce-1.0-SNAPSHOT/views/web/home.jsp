<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- start banner Area -->
<section class="banner-area">
    <div class="container">
        <div class="row fullscreen align-items-center justify-content-start">
            <div class="col-lg-12">
                <div class="owl-carousel" style="display: block">
                    <!-- single-slide -->
                    <div class="row single-slide align-items-center d-flex">
                        <div class="col-lg-5 col-md-6">
                            <div class="banner-content">
                                <h1>Bộ sưu tập <br>mới</h1>
                                <p>Mang đến những trải nghiệm tuyệt vời với những sản phẩm chất lượng.</p>

                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="banner-img">
                                <img class="img-fluid" src="<c:url value="/template/web/img/banner/banner-img.png"/>"
                                     alt="">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->


<!-- start product Area -->
<section class="section-product">
    <div class="single-product-slider">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <h1>Tất cả sản phẩm</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- single product -->
                <c:forEach items="${listProducts}" var="p">
                    <c:if test="${p.status == 'enabled'}">
                        <div class="col-lg-4 col-md-6">
                            <div class="single-product">
                                <img class="img-fluid single-product-image" src="${p.product_image}" alt="">
                                <div class="product-details">
                                    <h6>${p.product_name}</h6>
                                    <div class="price">
                                        <h6 class="formatted-price">${p.product_price} đ</h6>
                                        <h6  class="l-through formatted-price">${p.product_price*1.2} đ</h6>
                                    </div>
                                    <div class="prd-bottom">
                                            <%--                                    <a href="addtocart?productId=${p.product_id}&quantity=1" class="social-info">--%>
                                            <%--                                        <span class="ti-bag"></span>--%>
                                            <%--                                        <p class="hover-text">Thêm vào giỏ</p>--%>
                                            <%--                                    </a>--%>
                                        <a href="product-detail?productId=${p.product_id}" class="social-info">
                                            <span class="lnr lnr-move"></span>
                                            <p class="hover-text">Xem chi tiết</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>

</section>
<!-- end product Area -->

<nav aria-label="Page navigation example"
     style="display: flex; justify-content: center; margin-bottom: 30px;">
    <ul class="pagination ">
        <c:forEach var="i" begin="1" end="${endPage}">
            <li class="page-item"><a class="page-link ${index == i ? 'active-pagination':''}" href="web-home?index=${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Lấy tất cả các phần tử có class "formatted-price"
        var formattedPriceElements = document.querySelectorAll('.formatted-price');

        // Lặp qua tất cả các phần tử để định dạng giá trị
        formattedPriceElements.forEach(function(element) {
            var priceText = element.textContent;
            var price = parseFloat(priceText.replace('.0 đ', '').replace(/\./g, '').replace(',', '.'));

            // Kiểm tra xem giá có hợp lệ không
            if (!isNaN(price)) {
                // Định dạng giá và cập nhật nội dung của phần tử
                var formattedPrice = formatCurrency(price);
                element.textContent = formattedPrice;
            }
        });
    });

    // Hàm để định dạng số tiền sang tiền Việt Nam
    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }

</script>
</body>
</html>
