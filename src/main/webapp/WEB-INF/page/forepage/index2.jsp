<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../../foreinclude/foreHander.jsp"%>
<div class="hero-area home-four mb-30">
    <div class="slider-container">
        <div class="slider-style-2">
            <div class="hero-slider-item slider-bg-9">
            </div>
            <div class="hero-slider-item slider-bg-10">   
            </div>
            <div class="hero-slider-item slider-bg-11">
            </div>
        </div>
    </div>
</div>


<c:forEach items="${categories}" var="category" varStatus="vs">

    <div class="slider-banner-sidebar-three mb-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="slider-banner-sidebar-three-container">
                        
                              <div class="section-title-three">
                                <h3 id="${category.id}">${category.name}</h3>
                            </div> 
                       

                            <div class="fl-slider tab-product-slider">
                                <c:forEach items="${category.products}" var="product">
                                <div class="fl-product">
                                    <div class="image">
                                        <a href="foreDetailUI?id=${product.id}">
                                            <img src="${pageContext.request.contextPath}/${product.imageurl}" class="img-fluid" alt="">
                                            <img src="${pageContext.request.contextPath}/${product.imageurl}" class="img-fluid" alt="">
                                        </a>
                                        <!-- wishlist icon -->
                                        <span class="wishlist-icon">
												<a href="#" ><i class="icon ion-md-heart-empty"></i></a>
										 </span>
                                    </div>
                                    <div class="content">
                                        <h2 class="product-title"> <a href="foreDetailUI?id=${product.id}">${product.name}</a></h2>
                                        <div class="rating">
                                            <i class="fa fa-star active"></i>
                                            <i class="fa fa-star active"></i>
                                            <i class="fa fa-star active"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <p class="product-price">
                                            <span class="main-price discounted">
                                                ¥<fmt:formatNumber type="number" value="${product.price+88}" pattern="0.00" maxFractionDigits="2"/>
                                            </span>
                                            <span class="discounted-price">
                                                ¥<fmt:formatNumber type="number" value="${product.price}" pattern="0.00" maxFractionDigits="2"/>
                                            </span>
                                        </p>

                                        <div class="hover-icons">
                                            <ul>
                                                <li><a href="#"  data-tooltip="立即购买" id="nowPayment" onclick="buyNow(${product.id},${product.price});"><i class="icon ion-md-options"></i></a></li>
                                                <li>
                                                    <a href="#" data-toggle = "modal" data-target="#quick-view-modal-container" data-tooltip="添加到购物车"
                                                       onclick="Values('${product.id}','${product.name}','${product.price}','${product.imageurl}','${product.miaoshu}');">
                                                        <i class="icon ion-md-cart"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!--=======  End of single product  =======-->
                            </div>

                        <!--=======  End of banner slider  =======-->
                    </div>
                    <!--=======  End of slider banner sidebar three container  =======-->
                </div>
            </div>
        </div>
    </div>
</c:forEach>



<!--=====  End of Quick view modal  ======-->


<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
    var this_pro_price;
    var this_pro_id;
    //点击立即购买执行渲染参数
    function Values(id,name,price,imageUrl,miaoshu) {
        this_pro_price = price;
        this_pro_id = id;
        $("#proName").html(name);
        $("#miaoshu").html(miaoshu);
        $("#proPrice").html('$'+price);
        var proPrice1 = price +15;
        $("#proPrice1").html('$'+proPrice1);
        $("#proImg").attr("src",'/'+imageUrl);
    }

    //立即购买
    function buyNow(id,price){
        //ajax判断是否登陆
        $.get(
            "foreIsLogin",
            function(result) {
                if (result=="true"){ //首页立即购买默认只买一件
                    var totalPrice = 1*price;
                    location.href= "forebuyone?pid="+id+"&number=1"+"&totalPrice="+totalPrice;
                }else {  //未登录
                    alert("请先登陆!")
                }
            }
        );//登陆结束
    }

    $(document).ready(function(){
        //添加到购物车
        $("#add_cart").click(function () {
            var number = $("#nums").val();
            var totalPrice = number*this_pro_price;
            $.get(
                "foreAddCart",
                {pid:this_pro_id,number:number,totalPrice:totalPrice},
                function(data){
                    if(data=="success"){
                        alert("添加购物车成功");
                    }else{
                        alert("请先登陆！！！");
                    }
                }
            );//添加购物车结束
          });
    });
</script>
<%@ include file="../../foreinclude/foreFooter.jsp"%>

