<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>权限列表</h5>
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
                            	<#if hasRight("/right/add")>
	                                <button type="button" class="btn btn-outline btn-primary" onclick="addPermission()">
	                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span> 新增权限</span>
	                                </button>
                                </#if>  
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="rightId">ID</th>
                                    <th data-field="rightUrl">权限URL</th>
                                    <th data-field="rightName">权限名称</th>
                                    <th data-field="description">描述</th>
                                    <th data-field="available" data-formatter="stateFormatter">状态</th>
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
<script>
  tableModel = {
        table : $('#paginationTable'),
        url : "${basePath}/right/find",
        addUrl: "${basePath}/right/add",
        deleteUrl : "${basePath}/right/delete",
        editUrl: "${basePath}/right/edit"
    };

    function stateFormatter(value) {
        var availableHtml = "<span class='badge badge-primary'>&nbsp;可 用&nbsp;</span>";
        var unavailableHtml = "<span class='badge badge-warning'>&nbsp;不 可 用&nbsp;</span>";
        return value == true ? availableHtml : unavailableHtml;
    }

    function optionFormatter(value, row, index) {
        var editHtml = "&nbsp;<#if hasRight("/right/update")><button type='button' class='fa fa-edit btn btn-primary' onclick='editPermission(" + row.rightId + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/right/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.rightId + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + editHtml + deleteHtml + "</div>";
    }

    function addPermission() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增权限', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editPermission(permissionId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑权限', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + permissionId //iframe的url
        });
    }
 </script>
<!-- 通用表格初始化和删除代码 -->
<script src="${basePath}/static/js/admin/table.js"></script>
</@master.masterBlank>