<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <div class="alert alert-info alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
      	将当前角色授予权限.【当前被授权的角色是：${role.roleName!}】
    </div>
    <#if (groups)??&&groups?size gt 0>
    <form name="" id="roleauthfm">
	    	<#list groups as group >
		    	<div class="panel panel-default">
		        <div class="panel-heading">
		            <h3 class="panel-title">${group.groupName!}</h3>
		        </div>
		        <div class="panel-body">
			    		<#if (group.menus)??&&group.menus?size gt 0>
			    			<input type="hidden" name="roleId" value="${role.roleId!}">
						<#list group.menus as menu >
							 <div class="row">
			                        <div class="col-sm-12">
			                            <label class="checkbox-inline i-checks">
			                                <input type="checkbox" name="rightId" data-resource-id="<#if (menu.right)??>${menu.right.rightId!}</#if>" value="<#if (menu.right)??>${menu.right.rightId!}</#if>" 
			                                <#if (menu.right)??&&(menu.right.checked)??><#if menu.right.checked gt 0>checked</#if></#if> />
			                                 <i></i> <b>${menu.menuName!}</b>
			                             </label>
			                        </div>
								 <#if (menu.right)??&&(menu.right.subRights)??&&menu.right.subRights?size gt 0>
									<#list menu.right.subRights as subRight >
										 <div class="col-sm-3">
			                                <label class="checkbox-inline i-checks">
		                                        <input type="checkbox" name="rightId" data-resource-id="${subRight.rightId!}" value="${subRight.rightId!}"
		                                        <#if (subRight.subChecked)??><#if subRight.subChecked gt 0>checked</#if></#if>/>
		                                         <i></i> <small>${subRight.rightName!}</small>
		                                    </label>
			                            </div>
									</#list>
					    			</#if>
					    		</div>
			                <div class="hr-line-dashed"></div>
						</#list>
						
			    		</#if>
		    		</div>
		    </div>
	    	</#list>
	    	</form>
    </#if>
    <div class="row">
        <div class="col-sm-5">
            <button id="saveButton" type="button" class="btn btn-primary pull-right">保 存</button>
        </div>
        <div class="col-sm-5">
            <button id="cancelButton" type="button" class="btn btn-default pull-left">取 消</button>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${basePath}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${basePath}/static/js/bootstrap.min.js?v=3.3.6"></script>
<!-- iCheck -->
<script src="${basePath}/static/js/plugins/iCheck/icheck.min.js"></script>
<!-- 后台通用js -->
<script src="${basePath}/static/js/admin/common.js"></script>
<script>
    $().ready(function () {
        var preparePermissions = function () {
            var resources = new Array();
            var $permissionsBox = $("input:checkbox:checked");
            $permissionsBox.each(function () {
                var resource = {
                    role : {
                        roleId : "${role.roleId!}"
                    },
                    resourceId : "",
                    permissionIds : new Array()
                };
                var resourceId = $(this).attr("data-resource-id");
                var permissionId = $(this).val();
                var flag = false;
                if (resources.length > 0) {
                    for (var i=0; i<resources.length; i++) {
                        // 如果资源在resources中已存在，将该资源对应的权限添加到permissionIds数组中
                        if (resourceId == resources[i].resourceId) {
                            resources[i].permissionIds.push(permissionId);
                            flag = true;
                        }
                    }
                }
                // 如果资源在resources中不存在，将该资源添加到resources数组中
                if (!flag) {
                    resource.resourceId = resourceId;
                    resource.permissionIds.push(permissionId);
                    resources.push(resource);
                }
            });
            console.log(JSON.stringify(resources));
            return resources;
        }

        $("#saveButton").bind("click", function() {
            //var data = preparePermissions();
            console.log($('#roleauthfm').serialize());
            $.ajax({
               // dataType : "json",
               // contentType : "application/json",
                cache: true,
                url : "${basePath}/role/saveauth",
                type : "post",
                async: false,
                data : $('#roleauthfm').serialize(),
                success : function(response) {
                    if (response.code == 1) {
                        parent.layer.msg("保存角色信息成功", {icon : 1});
                        closeCurrentFrame();
                    } else {
                        parent.layer.msg(response.message, {icon: 2});
                    }
                }
            });
        });
    });
</script>

</@master.masterBlank>