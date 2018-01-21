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
            <li class="active">联系我们</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix "><a href="${basePath}/about/index"><i class="fa fa-angle-right"></i> 关于德发</a></li>
              <li class="list-group-item clearfix active"><a href="${basePath}/contacts/index"><i class="fa fa-angle-right"></i> 联系我们</a></li>
              <li class="list-group-item clearfix"><a href="${basePath}/news/index"><i class="fa fa-angle-right"></i> 新闻动态</a></li>
              <li class="list-group-item clearfix"><a href="${basePath}/help/index"><i class="fa fa-angle-right"></i> 帮助中心</a></li>
            </ul>
            
             <h5>联系方式</h5>
			<address>
		      	湖南长沙市雨花区高桥新太平街七区A1栋6号<br>
		      	<abbr title="Phone">电话:</abbr>15675829729<br>
	    		</address>
	    		<h5>电子邮箱</h5>
			<address>
	      		<a href="mailto:249405271@qq.com">249405271@qq.com</a><br>
    			</address>
			<h5>微信公众号</h5>
			<img src="${basePath}/static/img/erwm.jpg">
          </div>
          <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <h1>联系我们</h1>
            <div class="content-page">
            	<style type="text/css">
								.iw_poi_title {
									color: #CC5522;
									font-size: 14px;
									font-weight: bold;
									overflow: hidden;
									padding-right: 13px;
									white-space: nowrap
								}
								
								.iw_poi_content {
									font: 12px arial, sans-serif;
									overflow: visible;
									padding-top: 4px;
									white-space: -moz-pre-wrap;
									word-wrap: break-word
								}
						 		label{
						 			max-width: inherit !important;
						 		}
							</style>
							<!--百度地图容器-->
              <div class="gmaps margin-bottom-40" style="height:400px;border:#ccc solid 1px;"" id="dituContent"></div>
              
			
              <h2>路线</h2>
              <p>乘坐公交987、12、123 到哪里下 。地铁 1、2号线。</p>
              
              <!-- BEGIN FORM-->
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
                  <label for="message">留言</label>
                  <textarea class="form-control" rows="8" id="message"></textarea>
                </div>
                <div class="padding-top-20">                  
                  <button type="submit" class="btn btn-primary">提&nbsp;&nbsp;交</button>
                </div>
              </form>
              <!-- END FORM-->          
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

</@layout.webLayout>
<@layout.js>
	 <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
	<script type="text/javascript">
	
		//创建和初始化地图函数：
		function initMap() {
			createMap(); //创建地图
			setMapEvent(); //设置地图事件
			addMapControl(); //向地图添加控件
			addMarker(); //向地图中添加marker
		}

		//创建地图函数：
		function createMap() {
			var map = new BMap.Map("dituContent"); //在百度地图容器中创建一个地图
			var point = new BMap.Point(113.029886, 28.182585); //定义一个中心点坐标
			map.centerAndZoom(point, 17); //设定地图的中心点和坐标并将地图显示在地图容器中
			window.map = map; //将map变量存储在全局
		}

		//地图事件设置函数：
		function setMapEvent() {
			map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
			map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
			map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
			map.enableKeyboard(); //启用键盘上下左右键移动地图
		}

		//地图控件添加函数：
		function addMapControl() {
			//向地图中添加缩放控件
			var ctrl_nav = new BMap.NavigationControl({
				anchor: BMAP_ANCHOR_TOP_LEFT,
				type: BMAP_NAVIGATION_CONTROL_LARGE
			});
			map.addControl(ctrl_nav);
			//向地图中添加缩略图控件
			var ctrl_ove = new BMap.OverviewMapControl({
				anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
				isOpen: 1
			});
			map.addControl(ctrl_ove);
			//向地图中添加比例尺控件
			var ctrl_sca = new BMap.ScaleControl({
				anchor: BMAP_ANCHOR_BOTTOM_LEFT
			});
			map.addControl(ctrl_sca);
		}

		//标注点数组
		var markerArr = [{
			title: "德发湘菜配送中心",
			content: "我的备注",
			point: "113.031386|28.181216",
			isOpen: 0,
			icon: {
				w: 21,
				h: 21,
				l: 0,
				t: 0,
				x: 6,
				lb: 5
			}
		}];
		//创建marker
		function addMarker() {
			for(var i = 0; i < markerArr.length; i++) {
				var json = markerArr[i];
				var p0 = json.point.split("|")[0];
				var p1 = json.point.split("|")[1];
				var point = new BMap.Point(p0, p1);
				var iconImg = createIcon(json.icon);
				var marker = new BMap.Marker(point, {
					icon: iconImg
				});
				var iw = createInfoWindow(i);
				var label = new BMap.Label(json.title, {
					"offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20)
				});
				marker.setLabel(label);
				map.addOverlay(marker);
				label.setStyle({
					borderColor: "#808080",
					color: "#333",
					cursor: "pointer" 
				});

				(function() {
					var index = i;
					var _iw = createInfoWindow(i);
					var _marker = marker;
					_marker.addEventListener("click", function() {
						this.openInfoWindow(_iw);
					});
					_iw.addEventListener("open", function() {
						_marker.getLabel().hide();
					})
					_iw.addEventListener("close", function() {
						_marker.getLabel().show();
					})
					label.addEventListener("click", function() {
						_marker.openInfoWindow(_iw);
					})
					if(!!json.isOpen) {
						label.hide();
						_marker.openInfoWindow(_iw);
					}
				})()
			}
		}
		//创建InfoWindow
		function createInfoWindow(i) {
			var json = markerArr[i];
			var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
			return iw;
		}
		//创建一个Icon
		function createIcon(json) {
			var icon = new BMap.Icon("http://map.baidu.com/image/us_mk_icon.png", new BMap.Size(json.w, json.h), {
				imageOffset: new BMap.Size(-json.l, -json.t),
				infoWindowOffset: new BMap.Size(json.lb + 5, 1),
				offset: new BMap.Size(json.x, json.h)
			})
			return icon;
		}

		initMap(); //创建和初始化地图
		
 
	</script>
</@layout.js>