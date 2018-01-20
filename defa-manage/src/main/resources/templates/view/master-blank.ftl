<#global basePath=springMacroRequestContext.contextPath>
<#macro masterBlank args=false bodyclass="" >
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
		<title>德发后台管理系统</title>
		<link rel="shortcut icon" href="${basePath}/static/favicon.ico">
		<link rel="bookmark" href="${basePath}/static/favicon.ico" />
		<link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${basePath}/static/css/bootstrap-datetimepicker.min.css" />
		<link href="${basePath}/static/css/font-awesome.css" rel="stylesheet">
		<link href="${basePath}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
		<link href="${basePath}/static/css/animate.css" rel="stylesheet">
		<link href="${basePath}/static/css/style.css" rel="stylesheet">
		<link href="${basePath}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link href="${basePath}/static/css/plugins/webuploader/webuploader.css" rel="stylesheet">
		
		<script src="${basePath}/static/js/jquery.min.js"></script>
		<script src="${basePath}/static/js/bootstrap.min.js"></script>
		
		<#if args>	
			<script>
				if(window.top !== window.self) {
					window.top.location = window.location;
				}
			</script>
		</#if>
		<script language="javascript">
			$.basePath = "${basePath}";
		</script>
  </head>

  <body class="${bodyclass}">
	<#nested>
		<!-- 全局js -->
		<script src="${basePath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="${basePath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${basePath}/static/js/plugins/validate/jquery.validate.min.js"></script>
		<script src="${basePath}/static/js/plugins/iCheck/icheck.min.js"></script>
		<!-- 自定义js -->
		<script src="${basePath}/static/js/hplus.js"></script>
		<script src="${basePath}/static/js/contabs.js"></script>
		<!-- 第三方插件 -->
		<script src="${basePath}/static/js/plugins/pace/pace.min.js"></script>
		
		<!-- layer javascript -->
		<script src="${basePath}/static/js/plugins/layer/layer.min.js"></script>
		
  </body>
</html>
</#macro>

