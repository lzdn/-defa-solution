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
			<li class="active">关于德发</li>
		</ul>
		<div class="row margin-bottom-40">
			<!-- 导航 -->
			<div class="sidebar col-md-3 col-sm-3">
				<ul class="list-group margin-bottom-25 sidebar-menu">
					<li class="list-group-item clearfix active">
						<a href="${basePath}/about/index"><i class="fa fa-angle-right"></i> 关于德发</a>
					</li>
					<li class="list-group-item clearfix">
						<a href="${basePath}/contacts/index"><i class="fa fa-angle-right"></i> 联系我们</a>
					</li>
					<li class="list-group-item clearfix">
						<a href="${basePath}/news/index"><i class="fa fa-angle-right"></i> 新闻动态</a>
					</li>
					<li class="list-group-item clearfix">
						<a href="${basePath}/help/index"><i class="fa fa-angle-right"></i> 帮助中心</a>
					</li>
				</ul>

				<h5>联系方式</h5>
				<address>
		      	广东省东莞市大岭山镇107国道连平段信立国际农贸城 酒店特色食品区横三路39号<br>
		      <abbr title="Phone">电话:</abbr>18321147670<br>
		    </address>
				<address>
	      <h5>电子邮箱</h5>
		      <a href="mailto:415656544@qq.com">415656544@qq.com</a><br>
		      <a href="mailto:1660766588@qq.com">1660766588@qq.com</a>
	    	</address>
				<h5>微信公众号</h5>
				<img src="${basePath}/static/img/erwm.jpg">
			</div>
			<!-- 导航 -->

			<!-- 关于德发 -->
			<div class="col-md-9 col-sm-9">
				<h1>关于德发</h1>
				<div class="content-page">
					<p><img src="${basePath}/static/pages/img/img1.jpg" alt="About us" class="img-responsive"></p>

					<p>我们是专业的餐饮、湘菜原料供应平台，为您的企业提供专业的信息化服务，迎接信息时代的挑战！ </p>

					<p>我们深深的知道，在餐饮业竞争激烈的今天，降低采购成本是有效的增加竞争力的方式。而现在很多的中小型酒店的采购成本却一直居高不下，因为中间要经过层层代理商、经销商的利益分割。</p>

					<h2>公司成立</h2>

					<p>为了减少中间环节，降低采购成本，湘菜原料网配送中心现以网络直销方式为各经销商及酒店直接供货，以超低的供货价格、将这些利益直接让给酒店和销售终端，让酒店和销售终端获得丰厚的利润回报。欢迎各餐饮及商界朋友来电咨询或网上查询，热忱期待您的光临。真诚合作，诚信到底，共创双赢，共同发展，是我们的经营理念。</p>

					<h2>公司发展</h2>

					<p>湘厨厨房管理团队的优势：拥有湘菜、粤菜、杭州菜、川菜等强悍的厨师团队和高级管理人员。对菜品追求：创新、精致、适合当地口味。对管理追求：统一化、程序化、人性化、制度化。对酒店追求：以店为家、以店兴为荣、对店衰而耻。我们的每一个合作项目，都会使出全部的能力，做到最好的效果.... 
						一，雄厚实力：拥有上百名餐饮行业知名精英管理人才，全国餐饮旺店一线名厨。 
						二，特色项目：餐饮设计，厨政管理，燕鲍翅档承接及当今流行特色菜厨师推荐等。 
						三，统一化管理：本团队吸取了俏江南及毛家饭店餐饮集团管理模式，结合自己的实战经验，推出了《湘厨厨房管理团队》统一化管理，具有灵活，实用，不拘一格等特点。</p>

					<h2>公司证书</h2>
					<p><img src="${basePath}/static/img/zs.png"></p>
				</div>
			</div>
			<!-- 关于德发 -->
		</div>
	</div>
</div>

</@layout.webLayout>
<@layout.js>
	 
</@layout.js>