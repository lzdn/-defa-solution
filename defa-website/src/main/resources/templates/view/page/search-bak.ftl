<#import "/layout/layout.ftl" as layout>
<#--主体内容部分-->
<#assign title="德发湘菜" />
<#assign keywords="湘菜,湘菜原料,德发湘菜,德发,湘菜半成品" />
<#assign description="德发湘菜配送中心" />
<@layout.webLayout title=title keywords=keywords description=description bodyclass="ecommerce" css=["css/base.css"] pageId=''>
 <div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li>网站位置</li>
            <li><a href="${basePath}/home/index">首页</a></li>
        <li class="active">产品搜索</li>
    	</ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
      <div class="sidebar col-md-3 col-sm-5">
      	<ul class="list-group margin-bottom-25 sidebar-menu">
          <li class="list-group-item clearfix">产品分类</li>
          <li class="list-group-item clearfix dropdown active">
          	<a href="#"><i class="fa fa-angle-right"></i> 新菜系列</a>
          	<ul class="dropdown-menu" style="display:block;">
              <li class="list-group-item dropdown clearfix active">
                <a href="javascript:void(0);" class="collapsed"><i class="fa fa-angle-right"></i> 娃娃菜A </a>
                  <ul class="dropdown-menu" style="display:block;">
                    <li class="list-group-item dropdown clearfix">
                      <a href="javascript:void(0);"><i class="fa fa-angle-right"></i> 娃娃菜 B</a>
                      <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜 C</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜 D</a></li>
                      </ul>
                    </li>
                    <li class="list-group-item dropdown clearfix active">
                      <a href="javascript:void(0);" class="collapsed"><i class="fa fa-angle-right"></i> 娃娃菜E  </a>
                      <ul class="dropdown-menu" style="display:block;">
                        <li class="active"><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜F</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜 G</a></li>
                      </ul>
                    </li>
                  </ul>
              </li>
              <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜H</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜J</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜K</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> 娃娃菜L</a></li>
            </ul>
          </li>
          <li class="list-group-item clearfix  ">
            <a href="javascript:void(0);" class="collapsed">
              <i class="fa fa-angle-right"></i> 腊制品类
            </a>
          </li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 干货系列</a></li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 豆制品类</a></li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 坛子菜类</a></li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 冻货品类</a></li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 水产品类</a></li>
          <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i> 粉丝系列</a></li>
        </ul>
        <div class="sidebar-filter margin-bottom-25">
          <h2>搜索过滤</h2>
          <h3>Availability</h3>
          <div class="checkbox-list">
            <label><input type="checkbox"> Not Available (3)</label>
            <label><input type="checkbox"> In Stock (26)</label>
          </div>
          <h3>Price</h3>
          <p>
            <label for="amount">Range:</label>
            <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;">
          </p>
          <div id="slider-range"></div>
        </div>
        <div class="sidebar-products clearfix">
          <h2>相关产品</h2>
          <div class="item">
            <a href="#"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="#">Some Shoes in Animal with Cut Out</a></h3>
            <!--<div class="price">$31.00</div>-->
          </div>
          <div class="item">
            <a href="#"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="#">Some Shoes in Animal with Cut Out</a></h3>
            <!--<div class="price">$23.00</div>-->
          </div>
          <div class="item">
            <a href="#"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="#">Some Shoes in Animal with Cut Out</a></h3>
            <!--<div class="price">$86.00</div>-->
          </div>
        </div>
      </div>
      <!-- END SIDEBAR -->
      <!-- BEGIN CONTENT -->
      <div class="col-md-9 col-sm-7">
        <div class="content-search margin-bottom-20">
          <div class="row">
            <div class="col-md-6">
              <h1>请输入您想要了解的<em>产品</em></h1>
            </div>
            <div class="col-md-6">
              <form action="#">
                <div class="input-group">
                  <input type="text" placeholder="请输入" class="form-control">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">搜索一下</button>
                  </span>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="row list-view-sorting clearfix">
          <div class="col-md-2 col-sm-2 list-view">
            <a href="javascript:;"><i class="fa fa-th-large"></i></a>
            <a href="javascript:;"><i class="fa fa-th-list"></i></a>
          </div>
          <div class="col-md-10 col-sm-10">
            <div class="pull-right">
              <label class="control-label">显示:</label>
              <select class="form-control input-sm">
                <option value="#?limit=24" selected="selected">24</option>
                <option value="#?limit=25">25</option>
                <option value="#?limit=50">50</option>
                <option value="#?limit=75">75</option>
                <option value="#?limit=100">100</option>
              </select>
            </div>
            <div class="pull-right">
              <label class="control-label">排序:</label>
              <select class="form-control input-sm">
                <option value="#?sort=p.sort_order&amp;order=ASC" selected="selected">Default</option>
                <option value="#?sort=pd.name&amp;order=ASC">Name (A - Z)</option>
                <option value="#?sort=pd.name&amp;order=DESC">Name (Z - A)</option>
                <option value="#?sort=p.price&amp;order=ASC">Price (Low &gt; High)</option>
                <option value="#?sort=p.price&amp;order=DESC">Price (High &gt; Low)</option>
                <option value="#?sort=rating&amp;order=DESC">Rating (Highest)</option>
                <option value="#?sort=rating&amp;order=ASC">Rating (Lowest)</option>
                <option value="#?sort=p.model&amp;order=ASC">Model (A - Z)</option>
                <option value="#?sort=p.model&amp;order=DESC">Model (Z - A)</option>
              </select>
            </div>
          </div>
        </div>
        <!-- BEGIN PRODUCT LIST -->
        <div class="row product-list">
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串 2</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
        </div>
        <div class="row product-list">
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
              <div class="sticker sticker-new"></div>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
        </div>
        <div class="row product-list">
        
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
              <div class="sticker sticker-sale"></div>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
        </div>
        <!-- END PRODUCT LIST -->
         <div class="row product-list">
        
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
          <!-- PRODUCT ITEM START -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="兔肉串">
                <div>
                    <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">兔肉串</a></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
              <div class="sticker sticker-sale"></div>
            </div>
          </div>
          <!-- PRODUCT ITEM END -->
        </div>
        <!-- END PRODUCT LIST -->
        <!-- BEGIN PAGINATOR -->
        <div class="row">
          <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
          <div class="col-md-8 col-sm-8">
            <ul class="pagination pull-right">
              <li><a href="javascript:;">&laquo;</a></li>
              <li><a href="javascript:;">1</a></li>
              <li><span>2</span></li>
              <li><a href="javascript:;">3</a></li>
              <li><a href="javascript:;">4</a></li>
              <li><a href="javascript:;">5</a></li>
              <li><a href="javascript:;">&raquo;</a></li>
            </ul>
          </div>
        </div>
        <!-- END PAGINATOR -->
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
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
			    	<a href="javascript:;" class="active"><img alt="兔肉串" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
				  	<a href="javascript:;"><img alt="兔肉串" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
				  	<a href="javascript:;"><img alt="兔肉串" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
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