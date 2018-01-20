<#import "/master-blank.ftl" as master />
<@master.masterBlank args=true bodyclass="gray-bg">
<div class="middle-box text-center animated fadeInDown">
	<h1>403</h1>
	<h3 class="font-bold">未授权</h3>
	<div class="error-desc">
		您还没有权限访问该页面，请联系管理员... <br />您可以返回主页看看 <br /> <a href="${basePath}/home"
			class="btn btn-primary m-t">主页</a>
	</div>
</div>
</@master.masterBlank>