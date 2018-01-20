<#import "/layout/layout.ftl" as layout>
<#--主体内容部分-->
<#assign title="德发湘菜" />
<#assign keywords="湘菜,湘菜原料,德发湘菜,德发,湘菜半成品" />
<#assign description="德发湘菜配送中心" />
<@layout.webLayout title=title keywords=keywords description=description bodyclass="ecommerce" css=["css/base.css"] pageId=''>
<div class="main">
  <div class="container">
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN CONTENT -->
      <div class="col-md-12 col-sm-12">
        <h1>询价清单</h1>
        <div class="goods-page">
          <div class="goods-data clearfix">
            <div class="table-wrapper-responsive">
            <table summary="Shopping cart">
              <tr>
                <th class="goods-page-image">产品图片</th>
                <th class="goods-page-description">产品描述</th>
                <th class="goods-page-ref-no">产品规格</th>
                <th class="goods-page-quantity">产品数量</th>
               <!-- <th class="goods-page-price">Unit price</th>-->
                <th class="goods-page-total" colspan="2">合计</th>
              </tr>
              <tr>
                <td class="goods-page-image">
                  <a href="javascript:;"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Berry Lace Dress"></a>
                </td>
                <td class="goods-page-description">
                  <h3><a href="javascript:;">Cool green dress with red bell</a></h3>
                  <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                  <em>More info is here</em>
                </td>
                <td class="goods-page-ref-no">
                  包/袋
                </td>
                <td class="goods-page-quantity">
                  <div class="product-quantity">
                      <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                  </div>
                </td>
               <!-- <td class="goods-page-price">
                  <strong><span>$</span>47.00</strong>
                </td>-->
                <td class="goods-page-total">
                  <strong>99包</strong>
                </td>
                <td class="del-goods-col">
                  <a class="del-goods" href="javascript:;">&nbsp;</a>
                </td>
              </tr>
              <tr>
                <td class="goods-page-image">
                  <a href="javascript:;"><img src="${basePath}/static/corporate/img/product/兔肉串.jpg" alt="Berry Lace Dress"></a>
                </td>
                <td class="goods-page-description">
                  <h3><a href="javascript:;">Cool green dress with red bell</a></h3>
                  <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                  <em>More info is here</em>
                </td>
                <td class="goods-page-ref-no">
                  包/袋
                </td>
                <td class="goods-page-quantity">
                  <div class="product-quantity">
                      <input id="product-quantity2" type="text" value="1" readonly class="form-control input-sm">
                  </div>
                </td>
               <!-- <td class="goods-page-price">
                  <strong><span>$</span>47.00</strong>
                </td>-->
                <td class="goods-page-total">
                  <strong>99包</strong>
                </td>
                <td class="del-goods-col">
                  <a class="del-goods" href="javascript:;">&nbsp;</a>
                </td>
              </tr>
            </table>
            </div>

            <div class="shopping-total">
              <ul>
               <!-- <li>
                  <em>Sub total</em>
                  <strong class="price"><span>$</span>47.00</strong>
                </li>
                <li>
                  <em>Shipping cost</em>
                  <strong class="price"><span>$</span>3.00</strong>
                </li>-->
                <li class="shopping-total-price">
                  <em>总计</em>
                  <strong class="price">198</strong>
                </li>
              </ul>
            </div>
          </div>
          <!--<button class="btn btn-default" type="submit">Continue shopping <i class="fa fa-shopping-cart"></i></button>-->
         <!-- <button class="btn btn-primary" type="submit">提交询价清单</button>-->
         <!--  <a href="#contacts-pop-up" class="btn btn-primary">提交询价清单</a>-->
          <a href="#contacts-pop-up" class="btn btn-primary fancybox-fast-view">提交询价清单</a>
        </div>
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN SIMILAR PRODUCTS -->
    <div class="row margin-bottom-40">
      <div class="col-md-12 col-sm-12">
        <h2>畅销产品</h2>
        <div class="owl-carousel owl-carousel4">
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">Berry Lace Dress</a></h3>
              
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
              <div class="sticker sticker-new"></div>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">Berry Lace Dress2</a></h3>
             
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">Berry Lace Dress3</a></h3>
              
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="${basePath}/static/corporate/img/product/兔肉串.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="${basePath}/static/corporate/img/product/兔肉串.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="#">Berry Lace Dress4</a></h3>
              
              <a href="javascript:;" class="btn btn-default add2cart">我要询价</a>
              <div class="sticker sticker-sale"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END SIMILAR PRODUCTS -->
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

<!-- 填写信息 -->
<div id="contacts-pop-up" style="display: none; width: 700px;">
<!-- BEGIN FORM-->
<h5>联系方式</h5>
      <form action="#" class="default-form" role="form">
        <div class="form-group">
          <label for="name">姓名<span class="require">*</span></label>
          <input type="text" class="form-control" id="name">
        </div>
        <div class="form-group">
          <label for="email">电话 <span class="require">*</span></label>
          <input type="text" class="form-control" id="email">
        </div>
         <div class="form-group">
          <label for="message">地址</label>
          <textarea class="form-control" rows="8" id="message"></textarea>
        </div>
        <div class="padding-top-20">                  
          <button type="submit" class="btn btn-primary">提&nbsp;&nbsp;交</button>
        </div>
      </form>
      <!-- END FORM--> 
</div>
<!-- 填写信息-->

</@layout.webLayout>
<@layout.js>
	 
</@layout.js>