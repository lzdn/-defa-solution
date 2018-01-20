<#import "/master-blank.ftl" as master />
<@master.masterBlank args=true bodyclass="gray-bg">
<div class="middle-box text-center animated fadeInDown">
	<h1>404</h1>
	<h3 class="font-bold">页面不存在</h3>
	<div class="error-desc">
		您访问的页面不存在... <br />您可以返回主页看看 <br /> <a href="${basePath}/home"
			class="btn btn-primary m-t">主页</a>
	</div>
</div>
</@master.masterBlank>