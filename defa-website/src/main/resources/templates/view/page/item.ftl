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
		<li class="active">产品详情</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
      <div class="sidebar col-md-3 col-sm-5">
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
        <div class="product-page">
          <div class="row">
            <div class="col-md-6 col-sm-6">
              <div class="product-main-image">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="${basePath}/static/corporate/img/product/兔肉串.jpg">
              </div>
              <div class="product-other-images">
                <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
                <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
                <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="${basePath}/static/corporate/img/product/兔肉串.jpg"></a>
              </div>
            </div>
            <div class="col-md-6 col-sm-6">
              <h1>Cool green dress with red bell</h1>
              <div class="price-availability-block clearfix">
                <div class="price">
                  <strong><span>$</span>47.00</strong>
                  <em>$<span>62.00</span></em>
                </div>
                <div class="availability">
                  Availability: <strong>In Stock</strong>
                </div>
              </div>
              <div class="description">
                <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
					Nostrud duis molestie at dolore.</p>
              </div>
              <div class="product-page-options">
                <div class="pull-left">
                  <label class="control-label">Size:</label>
                  <select class="form-control input-sm">
                    <option>L</option>
                    <option>M</option>
                    <option>XL</option>
                  </select>
                </div>
                <div class="pull-left">
                  <label class="control-label">Color:</label>
                  <select class="form-control input-sm">
                    <option>Red</option>
                    <option>Blue</option>
                    <option>Black</option>
                  </select>
                </div>
              </div>
              <div class="product-page-cart">
                <div class="product-quantity">
                    <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                </div>
                <button class="btn btn-primary" type="submit">我要询价</button>
              </div>
              <div class="review">
                <input type="range" value="4" step="0.25" id="backing4">
                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                </div>
                <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
              </div>
              <ul class="social-icons">
                <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
                <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
              </ul>
            </div>

            <div class="product-page-content">
              <ul id="myTab" class="nav nav-tabs">
                <li class="active"><a href="#Description" data-toggle="tab">Description</a></li>
                <li><a href="#Information" data-toggle="tab">Information</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="Description">
                  <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. </p>
                </div>
                <div class="tab-pane fade" id="Information">
                  <table class="datasheet">
                    <tr>
                      <th colspan="2">Additional features</th>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 1</td>
                      <td>21 cm</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 2</td>
                      <td>700 gr.</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 3</td>
                      <td>10 person</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 4</td>
                      <td>14 cm</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 5</td>
                      <td>plastic</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
            <div class="sticker sticker-sale"></div>
          </div>
        </div>
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT --> 
  </div>
</div>
 
</@layout.webLayout>
<@layout.js>
	 
</@layout.js>