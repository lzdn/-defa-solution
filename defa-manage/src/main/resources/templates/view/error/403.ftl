<#import "/master-blank.ftl" as master />
<@master.masterBlank args=true bodyclass="gray-bg">
<div class="middle-box text-center animated fadeInDown">
	<h1>403</h1>
	<h3 class="font-bold">无权访问</h3>
	<div class="error-desc">
		sorry! forbidden... <br />您可以返回主页看看 <br /> <a href="${basePath}/home"
			class="btn btn-primary m-t">主页</a>
	</div>
</div>
</@master.masterBlank>