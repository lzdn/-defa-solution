<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveRightFrom" action="#" method="post">
        <input id="userId" name="userId" type="hidden" class="form-control" maxlength="32" value="${user.userId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名称：</label>
            <div class="col-sm-10" >
                <input id="userName"  name="userName" type="text" class="form-control" maxlength="32" placeholder="最多32个字母" value="${user.userName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户账户：</label>
            <div class="col-sm-10">
                <input id="account" name="account" type="text" class="form-control" maxlength="32" placeholder="最多32个字母" value="${user.account!}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属部门：</label>
            <div class="col-sm-10">
            	<#if (depts)??&&depts?size gt 0>
	             	<select id="deptId" name="deptId" class="form-control" >
	             		<#list depts as dept >
	                      <option value="${dept.deptId}" <#if (user.deptId)??&&(dept.deptId == user.deptId) >selected</#if> >${dept.deptSimpleName!}</option>
	                     </#list>
	                </select>
            	</#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">角色名称：</label>
            <div class="col-sm-10" >
            	<#if (roles)??&&roles?size gt 0>
	             	<select id="roleId" name="roleId" class="form-control" >
	             		<#list roles as role >
	                      <option value="${role.roleId}" <#if (user.roleId)??&&(role.roleId == user.roleId) >selected</#if> >${role.roleName!}</option>
	                     </#list>
	                </select>
            	</#if>
            </div>
        </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">电子邮箱：</label>
            <div class="col-sm-10">
                <input id="email" name="email" type="text" class="form-control" maxlength="32" placeholder="最多32个字母" value="${user.email!}"/>
            </div>
        </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">手机号码：</label>
            <div class="col-sm-10">
                <input id="phone" name="phone" type="text" class="form-control" maxlength="32" placeholder="最多32个字母" value="${user.phone!}"/>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-sm-5">
            <button id="saveButton" type="button" class="btn btn-primary pull-right">保 存</button>
        </div>
        <div class="col-sm-5">
            <button id="cancelButton" type="button" class="btn btn-default pull-left">取 消</button>
        </div>
    </div>
</div>

 
<!-- validate -->
<script src="${basePath}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${basePath}/static/js/admin/validate.js"></script>
<!-- iCheck -->
<script src="${basePath}/static/js/plugins/iCheck/icheck.min.js"></script>
<!-- 后台通用js -->
<script src="${basePath}/static/js/admin/common.js"></script>
<script>

    $().ready(function () {
        // 验证表单-保存部门
        $("#saveButton").bind("click", function() {
            $('#validationSaveRightFrom').submit();
        });
        $("#validationSaveRightFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/user/save",
                    type : "post",
                    data : {
                        rightId : $('#rightId').val(),
                        rightName : $('#rightName').val(),
                        rightUrl : $("#rightUrl").val(),
                        menuId : $('#menuId').val(),
                        upperRightId : $("#upperRightId").val(),
                        description : $("#description").val()
                    },
                    complete : function(response) {
                        var result = response.responseJSON;
                        if (result.code == 1) {
                            parent.layer.msg(result.message, {icon : 1});
                            closeCurrentFrame();
                        } else  {
                            parent.layer.msg(result.message, {icon: 2});
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