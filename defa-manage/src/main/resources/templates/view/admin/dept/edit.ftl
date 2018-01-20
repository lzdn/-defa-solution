<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveDepartmentFrom" action="#" method="post">
        <input id="deptId" name="deptId" type="hidden" class="form-control" maxlength="32" value="${department.deptId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">部门简称：</label>
            <div class="col-sm-10" >
                <input id="deptSimpleName"  name="deptSimpleName" type="text" class="form-control" maxlength="32" placeholder="请输入4-32位字母" value="${department.deptSimpleName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">部门全称：</label>
            <div class="col-sm-10">
                <input id="deptFullName" name="deptFullName" type="text" class="form-control" maxlength="32" placeholder="最多32个汉字" value="${department.deptFullName!}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多32个汉字" >${department.description!}</textarea>
            </div>
        </div>
	        <div class="form-group">
	            <label class="col-sm-2 control-label">上级部门：</label>
	            <div class="col-sm-10" >
	            <#if (depts)??&&depts?size gt 0>
	             	<select id="parentDeptId" name="parentDeptId" class="form-control" >
	             		<option value="">无</option>
	             		<#list depts as dept >
	                      	<option value="${dept.deptId}" <#if (department.parentDeptId)??&&(dept.deptId == department.parentDeptId) >selected</#if> >${dept.deptSimpleName}</option>
	                      </#list>	
	                </select>
	            </#if>
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
            $('#validationSaveDepartmentFrom').submit();
        });
        $("#validationSaveDepartmentFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/dept/save",
                    type : "post",
                    data : {
                        deptId : $('#deptId').val(),
                        deptSimpleName : $('#deptSimpleName').val(),
                        deptFullName : $("#deptFullName").val(),
                        description : $("#description").val(),
                        parentDeptId : $("#parentDeptId").val()
                    },
                    complete : function(response) {
                        var result = response.responseJSON;
                        if (result.code == 1) {
                            parent.layer.msg("保存部门信息成功，请刷新后查看", {icon : 1});
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