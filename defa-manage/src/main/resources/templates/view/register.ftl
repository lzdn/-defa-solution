<#import "master-blank.ftl" as master />
<@master.masterBlank args=true bodyclass="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
	<div>
		<div>
			<h1 class="logo-name">德发</h1>
		</div>
		<h3>欢迎注册德发后台管理系统</h3>
		<p>创建一个德发新账户</p>
		<form class="m-t" id="validationRegisterFrom" action="#" method="post">
			<div class="form-group">
				<input id="account" name="account" type="text" class="form-control" placeholder="请输入用户名" maxlength="32">
			</div>
			<div class="form-group">
				<input id="password" name="password" type="password" class="form-control" placeholder="请输入密码" maxlength="16">
			</div>
			<div class="form-group">
				<input id="repeatPassword" name="repeatPassword" type="password" class="form-control" placeholder="请输入确认密码" maxlength="16">
			</div>
			<div class="form-group">
				<input id="username" name="username" type="text" class="form-control" placeholder="请输入姓名" maxlength="32">
			</div>
			<div class="form-group">
				<input id="email" name="email" type="email" class="form-control" placeholder="请输入邮箱地址" maxlength="32">
			</div>
			<div class="form-group text-left">
				<label class="no-padding checkbox i-checks"><input id="agree" name="agree" type="checkbox"><i></i> 我同意注册协议</label>
				<label id="agree-error" class="error" for="agree"></label>
			</div>
			<button id="registerButton" type="button" class="btn btn-primary block full-width m-b">注 册</button>

			<p class="text-muted text-center"><small>已经有账户了？</small>
				<a href="${basePath}/login">点此登录</a>
			</p>
		</form>
	</div>
</div>
<script language="javascript" >

	$().ready(function () {
	
		$('.i-checks').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green'
		});
    // 验证注册表单
    $("#registerButton").bind("click", function() {
        $('#validationRegisterFrom').submit();
    });
    $("#validationRegisterFrom").validate({
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
            },
            repeatPassword : {
                required : true,
                minlength : 3,
                maxlength : 16,
                equalTo : "#password"
            },
            username : {
                required : true,
                minlength : 2,
                maxlength : 32
            },
            email : {
                required : true,
                email : true,
                maxlength : 32
            },
            agree : {
                required : true
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
            },
            repeatPassword : {
                required : "请输入确认密码",
                minlength : "密码长度至少为{0}个字符",
                maxlength : "密码长度至多为{0}个字符",
                equalTo : "确认密码和密码不一致"
            },
            username : {
                required : "请输入姓名",
                maxlength : "姓名长度至多为{0}个字符"
            },
            email : {
                required : "请输入邮箱地址",
                email : "请输入正确的邮箱地址",
                maxlength : "邮箱地址长度至多为{0}个字符"
            },
            agree : {
                required : "您还未接受用户协议",
                element : "#agree-error"
            }
        },
        submitHandler : function(form) {
            $.ajax({
                dataType : "json",
                url : "${basePath}/register",
                type : "post",
                data : {
                    account : $('#account').val(),
                    password : $('#password').val(),
                    username : $("#username").val(),
                    email : $("#email").val()
                },
                complete : function(response) {
                    var result = response.responseJSON;
                    if (result.code == 1) {
                        window.location.href =   "${basePath}/login";
                    } else if (result.code == -1) {
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