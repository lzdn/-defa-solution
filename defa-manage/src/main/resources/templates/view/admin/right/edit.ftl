<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveRightFrom" action="#" method="post">
        <input id="rightId" name="rightId" type="hidden" class="form-control" maxlength="32" value="${right.rightId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">权限名称：</label>
            <div class="col-sm-10" >
                <input id="rightName"  name="rightName" type="text" class="form-control" maxlength="8" placeholder="请输入4-8位字母" value="${right.rightName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">权限URL：</label>
            <div class="col-sm-10">
                <input id="rightUrl" name="rightUrl" type="text" class="form-control" maxlength="32" placeholder="最多32个字母" value="${right.rightUrl!}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">菜单名称：</label>
            <div class="col-sm-10">
            	<#if (menus)??&&menus?size gt 0>
	             	<select id="menuId" name="menuId" class="form-control" >
		             		<option value="">无</option>
	             		<#list menus as menu >
	                      <option value="${menu.menuId}" <#if (right.menuId)??&&(menu.menuId == right.menuId) >selected</#if> >${menu.menuName!}</option>
	                     </#list>
	                </select>
            	</#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">上级权限：</label>
            <div class="col-sm-10" >
            	<#if (rights)??&&rights?size gt 0>
	             	<select id="upperRightId" name="upperRightId" class="form-control" >
		             	<#if (sub)??&&(!sub)>
		             		<option value="">无</option>
		             	</#if>	
	             		<#list rights as subright >
	                      <option value="${subright.rightId}" <#if (right.upperRightId)??&&(subright.rightId == right.upperRightId) >selected</#if> >${subright.rightName!}</option>
	                     </#list>
	                </select>
            	</#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多32个汉字" >${right.description!}</textarea>
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
                    url : "${basePath}/right/save",
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