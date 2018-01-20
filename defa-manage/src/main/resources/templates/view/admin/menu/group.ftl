<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>菜单组列表</h5>
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
                            	<#if hasRight("/group/add")>
	                                <button type="button" class="btn btn-outline btn-primary" onclick="addMenuGroup()">
	                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span>新增菜单组</span>
	                                </button>
                                </#if>  
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="groupId">groupId</th>
                                    <th data-field="icon" data-formatter="iconFormatter">icon</th>
                                    <th data-field="groupName">groupName</th>
                                    <th data-field="orderBy">orderBy</th>
                                    <th data-field="description">描述</th>
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
        url : "${basePath}/group/find",
        addUrl: "${basePath}/group/add",
        deleteUrl : "${basePath}/group/delete",
        editUrl: "${basePath}/group/edit"
    };

	function iconFormatter(value) {
        if (value) {
            value = "<span class='label label-info'><i class='" + value + "'></i></span> " + value;
        }
        return value;
    }

    function optionFormatter(value, row, index) {
        var editHtml = "&nbsp;<#if hasRight("/group/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editMenuGroup(" + row.groupId + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/group/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.groupId + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + editHtml + deleteHtml + "</div>";
    }

    function addMenuGroup() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增菜单组', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editMenuGroup(groupId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑菜单组', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + groupId //iframe的url
        });
    }
</script>

<script src="${basePath}/static/js/admin/table.js"></script>

</@master.masterBlank>