<#global basePath=springMacroRequestContext.contextPath>
<#import  "left.ftl" as left>
<#import  "right.ftl" as right>
<#import  "sidebar.ftl" as sidebar>
<#import  "chat.ftl" as chat>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
<meta name="renderer" content="webkit">
<title>德发后台管理系统</title>
<link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${basePath}/static/css/font-awesome.css" rel="stylesheet">
<link href="${basePath}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${basePath}/static/css/animate.css" rel="stylesheet">
<link href="${basePath}/static/css/style.css" rel="stylesheet">
<link href="${basePath}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<script src="${basePath}/static/js/jquery.min.js"></script>
<script src="${basePath}/static/js/bootstrap.min.js"></script>
<script language="javascript">
	$.basePath = "${basePath}";
</script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
<@left.left />
<@right.right />
<@sidebar.sidebar />
<@chat.chat />
</div>
<!-- 全局js -->
<script src="${basePath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${basePath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- validate -->
<script src="${basePath}/static/js/plugins/validate/jquery.validate.min.js"></script>
<!-- iCheck -->
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


	