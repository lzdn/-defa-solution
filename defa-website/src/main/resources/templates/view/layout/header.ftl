	<!-- 头部 bar -->
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li>联系电话：<i class="fa fa-phone"></i><span>+021 89744657</span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="#"><i class="iconfont icon-zhanghu1"></i>我的账户</a></li>
                        <li><a href="#">我的询价清单</a></li>
                        <li><a href="#">注册</a></li>
                        <li><a href="#">登录</a></li>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- 头部 bar -->

    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <a class="site-logo" href="shop-index.html"><img src="${basePath}/static/corporate/img/logos/logo-defa.png" alt=""></a>
        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <div class="top-cart-block">
          <div class="top-cart-info">
          	<a href="javascript:void(0);" class="top-cart-info-value">我的询价清单</a>
          <!--  <a href="javascript:void(0);" class="top-cart-info-count">3 items</a>-->
          </div>
          <i class="fa fa-shopping-cart"></i>
          <!--
          	顶部购物车部分
          -->              
          <div class="top-cart-content-wrapper">
            <div class="top-cart-content">
              <ul class="scroller" style="height: 250px;">
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
                <li>
                  <a href="${basePath}/item/index"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="兔肉串" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="#">兔肉串</a></strong>
                  <em>包</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
              </ul>
              <div class="text-right">
                <a href="${basePath}/cart/index" class="btn btn-default">查看清单</a>
                <a href="${basePath}/cart/index" class="btn btn-primary">提交清单</a>
              </div>
            </div>
          </div>      
           <!--
          	顶部购物车部分
          -->   
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
          <ul>
            <li > <a href="${basePath}/home/index"> 首页  </a> </li>
            <li class="dropdown dropdown100 nav-catalogue">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                		热销推荐
              </a>
              <!--
              	热销推荐
              -->
              <ul class="dropdown-menu">
                <li>
                  <div class="header-navigation-content">
                    <div class="row">
                    <#if hotProductList??&&hotProductList?size gt 0>
    					<#list hotProductList as product>
    					<#if product_index lt 4>	
	                      <div class="col-md-3 col-sm-4 col-xs-6">
	                        <div class="product-item">
	                          <div class="pi-img-wrapper">
	                            <a href="${basePath}/item/index"><img src="${product.imageUrl!}" class="img-responsive" alt="${product.productName!}"></a>
	                          </div>
	                          <h3><a href="#">${product.productName!}</a></h3>
	                         <!-- <!--  <!--  <div class="pi-price">混批</div>-->
	                          <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
	                        </div>
	                      </div>
                   		</#if>
	          			</#list>
          			</#if>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
             <!--
              	新品推荐
              -->
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                	配送产品展示
              </a>
              <ul class="dropdown-menu">
              <#if kindList??&&kindList?size gt 0>
    			<#list kindList as kind>
                	<li><a href="${basePath}/search/index">${kind.productKindName!}</a></li>
		        </#list>
	          </#if>
              </ul>
            </li>
            <li><a href="#">德发网购</a></li>
            <li><a href="${basePath}/news/index">新闻动态</a></li>
            <li><a href="${basePath}/about/index">关于德发</a></li>
            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box">
                <form action="#">
                  <div class="input-group">
                    <input type="text" placeholder="请输入" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->
