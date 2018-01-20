<#import "master-blank.ftl" as master />
<@master.masterBlank args=true bodyclass="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
	<div>
		<div>
			<h1 class="logo-name">德发</h1>
		</div>
		<h3>欢迎使用德发后台管理系统</h3>
		<form class="m-t" id="validationLoginFrom" action="#" method="post">
			<div class="form-group">
				<input id="account" name="account" type="text" class="form-control" placeholder="请输入用户名/邮箱/手机号" maxlength="32" value="${account!}">
			</div>
			<div class="form-group">
				<input id="password" name="password" type="password" class="form-control" placeholder="请输入密码" maxlength="16">
			</div>
			<div class="text-left">
				<label> <input id="rememberMe" name="rememberMe" value="rememberMe" type="checkbox" class="i-checks" <#if account??>checked="checked"</#if> />&nbsp;记住我的帐号</label>
			</div>
			<button id="loginButton" type="button" class="btn btn-primary block full-width m-b">登 录</button>
			<p class="text-muted text-center">
				<a href="${basePath}/login"><small>忘记密码了？</small></a> |
				<a href="${basePath}/register">注册一个新账号</a>
			</p>
		</form>
	</div>
</div> 
<script language="javascript" >

	$(document).ready(function() {
		$('.i-checks').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green'
		});
		 // 按回车键触发登录事件
	    $(document).keydown(function(event) {
	        var key = window.event ? event.keyCode : event.which;
	        if (key == 13) {
	            $('#validationLoginFrom').submit();
	        }
	    });
	      // 验证登录表单
	    $("#loginButton").bind("click", function() {
	        $('#validationLoginFrom').submit();
	    });
	    
	$("#validationLoginFrom").validate({
        rules : {
            account : {
                required : true,
                minlength : 3,
                maxlength : 32
            },
            password : {
                required : true,
                minlength : 3,
                maxlength : 16
            }
        },
        messages : {
            account : {
                required : "请输入账号",
                minlength : "账号长度至少为{0}个字符",
                maxlength : "账号长度至多为{0}个字符"
            },
            password : {
                required : "请输入密码",
                minlength : "密码长度至少为{0}个字符",
                maxlength : "密码长度至多为{0}个字符"
            }
        },
        submitHandler : function(form) {
        	//form.submit();
        	//判断是否记住登录账户
        	var sendData = {};
        	if($('#rememberMe').is(':checked')) 
        		sendData = { account : $('#account').val(), password : $('#password').val(), rememberMe : $("#rememberMe").val() };
        	 else 
        		sendData = { account : $('#account').val(), password : $('#password').val() };
        	//判断是否记住登录账户
        	$.ajax({
                dataType : "json",
                url : "${basePath}/login",
                type : "post",
                data : sendData,
                complete : function(response) {
                    var result = response.responseJSON;
                    if (result.code == 1) {
                    	document.location.href = "${basePath}/home";
                    } else if (result.code == -1) {
                        parent.layer.msg(result.message);
                    } else if (result.code == -2) {
                        parent.layer.msg(result.message);
                    } else if (result.code == -3) {
                        parent.layer.msg(result.message);
                    } else {
                        parent.layer.msg(result.message);
                    }
                }
            }); 
        },
        invalidHandler : function(form) {
        }
    });
});
</script>
</@master.masterBlank>