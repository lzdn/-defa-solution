<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>系统字典</h5>
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
                            	<#if hasRight("/dict/add")>
	                                <button type="button" class="btn btn-outline btn-primary" onclick="addDict()">
	                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span>新增字典</span>
	                                </button>
                                </#if>
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="id">id</th>
                                    <th data-field="dictCode">字典代码</th>
                                    <th data-field="dictName">字典名称</th>
                                    <th data-field="dictValue">字典值</th>
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
        url : "${basePath}/dict/find",
        addUrl: "${basePath}/dict/add",
        deleteUrl : "${basePath}/dict/delete",
        editUrl: "${basePath}/dict/edit"
    };


    function optionFormatter(value, row, index) {
        var editHtml = "&nbsp;<#if hasRight("/dict/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editDict(" + row.id + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/dict/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.id + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + editHtml + deleteHtml + "</div>";
    }

    function addDict() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增字典', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editDict(id) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑字典', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + id //iframe的url
        });
    }
</script>

<script src="${basePath}/static/js/admin/table.js"></script>

</@master.masterBlank>