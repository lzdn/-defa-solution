<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveMenuGroupFrom" action="#" method="post">
        <input id="groupId" name="groupId" type="hidden" class="form-control" maxlength="32" value="${menuGroup.groupId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">菜单组名称：</label>
            <div class="col-sm-10" >
                <input id="groupName"  name="groupName" type="text" class="form-control" maxlength="32" placeholder="最多4-32个汉字" value="${menuGroup.groupName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">图标ICON：</label>
           <#if (menuGroup.icon)??>
	           	<div class="col-sm-1">
	                <span class='label label-info'><i class='${menuGroup.icon!}'></i></span> 
	            </div>
	            <div class="col-sm-9">
                	<input id="icon" name="icon" type="text" class="form-control" maxlength="16" placeholder="最多16个字母" value="${menuGroup.icon!}"/>
            	</div>
            <#else>
            	<div class="col-sm-10">
                	<input id="icon" name="icon" type="text" class="form-control" maxlength="16" placeholder="最多16个字母" value="${menuGroup.icon!}"/>
            	</div>	
           </#if>
        </div>
        <div class="form-group">
             <label class="col-sm-2 control-label">排序：</label>
            <div class="col-sm-10">
                <input id="orderBy" name="orderBy" type="number" class="form-control"  max="999" placeholder="" value="${menuGroup.orderBy!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多128个汉字" >${menuGroup.description!}</textarea>
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
            $('#validationSaveMenuGroupFrom').submit();
        });
        $("#validationSaveMenuGroupFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/group/save",
                    type : "post",
                    data : {
                        groupId : $('#groupId').val(),
                        groupName : $('#groupName').val(),
                        icon : $("#icon").val(),
                        description : $("#description").val(),
                        orderBy : $("#orderBy").val()
                    },
                    complete : function(result) {
                        if (result.responseJSON.code == 1) {
                            parent.layer.msg(result.responseJSON.message, {icon : 1});
                            closeCurrentFrame();
                        } else  {
                            parent.layer.msg(result.responseJSON.message, {icon: 2});
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