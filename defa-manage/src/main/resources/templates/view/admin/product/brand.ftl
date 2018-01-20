<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>产品品牌列表</h5>
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
                            <#if hasRight("/brand/add")>
                                <button type="button" class="btn btn-outline btn-primary" onclick="addBrand()">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span>新增品牌</span>
                                </button>
                            </#if> 
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="productBrandId">ID</th>
                                    <th data-field="productBrandName">类别名称</th>
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
        url : "${basePath}/brand/find",
        addUrl: "${basePath}/brand/add",
        deleteUrl : "${basePath}/brand/delete",
        editUrl: "${basePath}/brand/edit" 
    };

	function stateFormatter(value) {
        var availableHtml = "<span class='badge badge-primary'>&nbsp;可 用&nbsp;</span>";
        var unavailableHtml = "<span class='badge badge-warning'>&nbsp;不 可 用&nbsp;</span>";
        return value == 1 ? availableHtml : unavailableHtml;
    }

    function optionFormatter(value, row, index) {
        var editHtml = "&nbsp;<#if hasRight("/brand/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editBrand(" + row.productBrandId + ")'>编 辑</button></#if>&nbsp;";
        var deleteHtml = "&nbsp;<#if hasRight("/brand/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.productBrandId + ")'>删 除</button></#if>&nbsp;";
        return "<div class='text-center'>" + editHtml + deleteHtml + "</div>";
    }
 

    function addBrand() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增品牌', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.addUrl
        });
    }

    function editBrand(productBrandId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑品牌', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: tableModel.editUrl + "/" + productBrandId //iframe的url
        });
    }
</script>

<script src="${basePath}/static/js/admin/table.js"></script>

</@master.masterBlank>