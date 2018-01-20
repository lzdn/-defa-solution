<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveMenuFrom" action="#" method="post">
        <input id="menuId" name="menuId" type="hidden" class="form-control" maxlength="32" value="${menu.menuId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">菜单名称：</label>
            <div class="col-sm-10" >
                <input id="menuName"  name="menuName" type="text" class="form-control" maxlength="8" placeholder="请输入4-8位字母" value="${menu.menuName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">菜单代码：</label>
            <div class="col-sm-10">
                <input id="menuCode" name="menuCode" type="text" class="form-control" maxlength="16" placeholder="最多16个字母" value="${menu.menuCode!}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">菜单URL：</label>
            <div class="col-sm-10">
                <input id="url" name="url" type="text" class="form-control" maxlength="16" placeholder="最多16个字母" value="${menu.url!}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属菜单组：</label>
            <div class="col-sm-10" >
            <#if (menuGroups)??&&menuGroups?size gt 0>
             	<select id="groupId" name="groupId" class="form-control" >
             		<#list menuGroups as menuGroup >
                      <option value="${menuGroup.groupId}" <#if (menu.groupId)??&&(menuGroup.groupId == menu.groupId) >selected</#if> >${menuGroup.groupName}</option>
                      </#list>
                </select>
            </#if>
            </div>
        </div>
        <div class="form-group">
             <label class="col-sm-2 control-label">排序：</label>
            <div class="col-sm-10">
                <input id="orderBy" name="orderBy" type="number" class="form-control"  max="999" placeholder="" value="${menu.orderBy!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多32个汉字" >${menu.description!}</textarea>
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
            $('#validationSaveMenuFrom').submit();
        });
        $("#validationSaveMenuFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/menu/save",
                    type : "post",
                    data : {
                        menuId : $('#menuId').val(),
                        menuName : $('#menuName').val(),
                        menuCode : $("#menuCode").val(),
                        orderBy : $("#orderBy").val(),
                        url : $("#url").val(),
                        description : $("#description").val(),
                        groupId : $("#groupId").val()
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