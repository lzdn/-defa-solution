<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>角色列表</h5>
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
                            <#if hasRight("/role/add")>
                                <button type="button" class="btn btn-outline btn-primary" onclick="addRole()">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span>新增角色</span>
                                </button>
                            </#if> 
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="roleId">roleId</th>
                                    <th data-field="roleName">roleName</th>
                                    <th data-field="description">描述</th>
                                    <th data-field="status" data-formatter="stateFormatter">状态</th>
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
        url : "${basePath}/role/find",
        addUrl: "${basePath}/role/add",
        deleteUrl : "${basePath}/role/delete",
        editUrl: "${basePath}/role/edit",
        authUrl: "${basePath}/role/auth"
    };

	function stateFormatter(value) {
        var availableHtml = "<span class='badge badge-primary'>&nbsp;可 用&nbsp;</span>";
        var unavailableHtml = "<span class='badge badge-warning'>&nbsp;不 可 用&nbsp;</span>";
        return value == 1 ? availableHtml : unavailableHtml;
    }

    function optionFormatter(value, row, index) {
        var authHtml = "&nbsp;<#if hasRight("/role/auth")><button type='button' class='fa fa-user btn btn-success' onclick='auth(" + row.roleId + ")'>授 权</button></#if>&nbsp;";
        var editHtml = "&nbsp;<#if hasRight("/role/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editRole(" + row.roleId + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/role/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.roleId + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + authHtml + editHtml + deleteHtml + "</div>";
    }
    
    function auth(roleId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['角色授权', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '80%'],
            content: tableModel.authUrl + "/" + roleId //iframe的url
        });
    }

    function addRole() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增菜单', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editRole(roleId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑菜单', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + menuId //iframe的url
        });
    }
</script>

<script src="${basePath}/static/js/admin/table.js"></script>

</@master.masterBlank>