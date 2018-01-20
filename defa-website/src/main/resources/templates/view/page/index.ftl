<#import "/layout/layout.ftl" as layout>
<#--主体内容部分-->
<#assign title="德发湘菜" />
<#assign keywords="湘菜,湘菜原料,德发湘菜,德发,湘菜半成品" />
<#assign description="德发湘菜配送中心" />
<@layout.webLayout title=title keywords=keywords description=description bodyclass="ecommerce" css=["css/base.css"] pageId=''>
<div class="main">
  <div class="container">
		<div class="row margin-bottom-40">
      <!-- 新菜推荐 -->
      <div class="col-md-12 sale-product">
        <h2>新菜推荐</h2>
        <div class="owl-carousel owl-carousel5">
        	<#if newProductList??&&newProductList?size gt 0>
        		<#list newProductList as product>
        			<#if product_index lt 5>
		          <div>
		            <div class="product-item">
		              <div class="pi-img-wrapper">
		                <img src="${product.imageUrl!}" class="img-responsive" alt="${product.productName!}">
		                <div>
		                  <a href="${product.imageUrl!}" class="btn btn-default fancybox-button">大图</a>
		                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>
		                </div>
		              </div>
		              <h3><a href="#">${product.productName!}</a></h3>
		              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
		              <!-- 最新的tag标签 
		              <div class="sticker sticker-new"></div>
		              -->
		            </div>
		          </div>
		          </#if>
	          </#list>
          </#if>
        </div>
      </div>
      <!-- 新菜推荐 -->
    </div>
 

    <div class="row margin-bottom-40 ">
      <!-- 产品类别 -->
      <div class="sidebar col-md-3 col-sm-4">
        <ul class="list-group margin-bottom-25 sidebar-menu">
         	<#if kindList??&&kindList?size gt 0>
				<#list kindList as kind>
					<li class="list-group-item clearfix"><a href="${basePath}/search/index"><i class="fa fa-angle-right"></i>${kind.productKindName!}</a></li>
		        </#list>
	      	</#if>
        </ul>
      </div>
      <!-- 产品类别 -->
      
      <!-- 店长推荐 -->
      <div class="col-md-9 col-sm-8">
        <h2>店长推荐</h2>
        <div class="owl-carousel owl-carousel3">
    		<#if hotProductList??&&hotProductList?size gt 0>
    		<#list hotProductList as product>
    			<#if product_index lt 3>
		          <div>
		            <div class="product-item">
		              <div class="pi-img-wrapper">
		                <img src="${product.imageUrl!}" class="img-responsive" alt="${product.productName!}">
		                <div>
		                  <a href="${product.imageUrl!}" class="btn btn-default fancybox-button">大图</a>
		                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>
		                </div>
		              </div>
		              <h3><a href="#">${product.productName!}</a></h3>
		              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
		              <!-- 
		              <div class="sticker sticker-new"></div>
		              -->
		            </div>
		          </div>
        		</#if>
	          </#list>
          </#if>
        </div>
      </div>
       <!-- 店长推荐 -->
    </div>

   <!-- 经典  -->
    <div class="row margin-bottom-35 ">
      <div class="col-md-6 two-items-bottom-items">
        <h2>经典</h2>
        <div class="owl-carousel owl-carousel2">
        	<#if dzProductList??&&dzProductList?size gt 0>
    		<#list dzProductList as product>
    			<#if product_index lt 2>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${product.imageUrl!}" class="img-responsive" alt="${product.productName!}">
                <div>
                  <a href="${product.imageUrl!}" class="btn btn-default fancybox-button">大图</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>
                </div>
              </div>
              <h3><a href="#">${product.productName!}</a></h3>
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
 				</#if>
	          </#list>
          </#if>
        </div>
      </div>
      <div class="col-md-6 shop-index-carousel">
        <div class="content-slider">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="item active">
                <img src="${basePath}/static/corporate/img/product/相干.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
              <div class="item">
                <img src="${basePath}/static/corporate/img/product/相干.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
              <div class="item">
                <img src="${basePath}/static/corporate/img/product/相干.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>        
    <!-- 经典 -->
  </div>
</div>
<!-- 产品详情 -->
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
      <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-3">
          <div class="product-main-image">
            <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Cool green dress with red bell" class="img-responsive">
		 			</div>
			  	<div class="product-other-images">
			    	<a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
				  	<a href="javascript:;"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/鸭脚筋.jpg"></a>
				  	<a href="javascript:;"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
	        </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-9">
          <h2>兔肉串</h2>
          <!--<div class="price-availability-block clearfix">
            <div class="price">
              <strong><span>$</span>47.00</strong>
              <em>$<span>62.00</span></em>
            </div>
            <div class="availability">
              Availability: <strong>In Stock</strong>
            </div>
          </div>-->
          <div class="description">
            <p>兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串兔肉串.</p>
          </div>
          <div class="product-page-options">
            <div class="pull-left">
              <label class="control-label">规格:</label>
              <select class="form-control input-sm">
                <option>32g</option>
                <option>56g</option>
                <option>128g</option>
              </select>
            </div>
      <!--      <div class="pull-left">
              <label class="control-label">Color:</label>
              <select class="form-control input-sm">
                <option>Red</option>
                <option>Blue</option>
                <option>Black</option>
              </select>
            </div>-->
          </div>
          <div class="product-page-cart">
            <div class="product-quantity">
                <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
            </div>
            <button class="btn btn-primary" type="submit">我要询价</button>
            <a href="#" class="btn btn-default">更多详细</a>
          </div>
        </div>
        <div class="sticker sticker-sale"></div>
      </div>
    </div>
</div>
<!-- 产品详情 -->

</@layout.webLayout>
<@layout.js>
	 
</@layout.js>