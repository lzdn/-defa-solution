<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>用户列表</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Pagination Table -->
                    <div class="table-wrap">
                        <div class="table-container">
                            <div class="btn-group hidden-xs" id="toolbar" role="group">
                            <#if hasRight("/user/add")>
                                <button type="button" class="btn btn-outline btn-primary" onclick="addUser()">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span>新增用户</span>
                                </button>
                                 </#if>
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="userId">userId</th>
                                    <th data-field="username">username</th>
                                    <th data-field="account">account</th>
                                    <th data-field="phone">phone</th>
                                    <th data-field="email">email</th>
                                    <th data-field="role.roleName">角色名称</th><!-- data-formatter="roleFormatter" -->
                                    <th data-field="deptId" data-formatter="deptFormatter">所属部门</th>
                                    <th data-formatter="optionFormatter">选项</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <!-- End Pagination Table -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Panel Other -->
</div>

<!-- 自定义js -->
<script src="${basePath}/static/js/content.js?v=1.0.0"></script>
<!-- Bootstrap table -->
<script src="${basePath}/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${basePath}/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${basePath}/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- layer javascript -->
<script src="${basePath}/static/js/plugins/layer/layer.min.js"></script>

<script >
    tableModel = {
        table : $('#paginationTable'),
        url : "${basePath}/user/find",
        addUrl: "${basePath}/user/add",
        deleteUrl : "${basePath}/user/delete",
        editUrl: "${basePath}/user/edit",
        roleUrl: "${basePath}/user/role"
    };
	function roleFormatter(roleId) {
        var text = "";
        if (roleId) {
            $.ajax({
                url : "${basePath}/role/" + roleId,
                type : "get",
                async : false,
                success : function(response) {
                    if (response) {
                        text = response.roleName;
                    }
                },
                error : function() {
                }
            });
        }
        return text;
    }
	 function deptFormatter(deptId) {
        var text = "";
        if (deptId) {
            $.ajax({
                url : "${basePath}/dept/" + deptId,
                type : "get",
                async : false,
                success : function(response) {
                    if (response) {
                        text = response.deptSimpleName;
                    }
                },
                error : function() {
                }
            });
        }
        return text;
    }

    function optionFormatter(value, row, index) {
        var editHtml = "&nbsp;<#if hasRight("/user/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editUser(" + row.userId + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/user/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.userId + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + editHtml + deleteHtml + "</div>";
    }

    function addUser() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增用户', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editUser(userId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑菜单', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + userId //iframe的url
        });
    }
</script>

<script src="${basePath}/static/js/admin/table.js"></script>

</@master.masterBlank>