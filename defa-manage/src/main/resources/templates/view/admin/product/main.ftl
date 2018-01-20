<#import "/master-blank.ftl" as master />
<#include "/function.ftl">
<@master.masterBlank args=false bodyclass="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>产品列表</h5>
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
                            <#if hasRight("/product/add")>
                                <button type="button" class="btn btn-outline btn-primary" onclick="addProduct()">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i><span> 新增产品</span>
                                </button>
                                </#if>
                            </div>
                            <table id="paginationTable" data-toggle="table" data-mobile-responsive="true" data-height="600" data-icon-size="outline" data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-field="productId">ID</th>
                                    <th data-field="imageUrl" data-formatter="imgFormatter">产品图片</th>
                                    <th data-field="productName">产品名称</th>
                                    <th data-field="productKindId" data-formatter="kindFormatter">产品类别</th>
                                    <th data-field="productBrandId" data-formatter="brandFormatter">品牌名称</th>
                                    <th data-field="channelId" data-formatter="channelFormatter">展示渠道</th>
                                    <th data-field="pushType" data-formatter="pushTypeFormatter">推荐类型</th>
                                    <th data-field="isPutaway" data-formatter="putawayFormatter">是否上架</th>
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
<script>
  tableModel = {
        table : $('#paginationTable'),
        url : "${basePath}/product/find",
        addUrl: "${basePath}/product/add",
        deleteUrl : "${basePath}/product/delete",
        editUrl: "${basePath}/product/edit" 
    };

	function kindFormatter(productKindId) {
        var text = "";
        if (productKindId) {
            $.ajax({
                url : "${basePath}/kind/" + productKindId,
                type : "get",
                async : false,
                success : function(response) {
                    if (response) {
                        text = response.productKindName;
                    }
                },
                error : function() {
                }
            });
        }
        return text;
	}

	 function brandFormatter(productBrandId) {
        var text = "";
        if (productBrandId) {
            $.ajax({
                url : "${basePath}/brand/" + productBrandId,
                type : "get",
                async : false,
                success : function(response) {
                    if (response) {
                        text = response.productBrandName;
                    }
                },
                error : function() {
                }
            });
        }
        return text;
	}
	function pushTypeFormatter(value) {
        return value == 1 ? "新菜推荐" :((value == 2) ? "店长推荐" : ((value == 3) ? "经典" : "热门") );
    }
	function imgFormatter(imageUrl){
		return '<img style="height:100px;width:100px;" src="'+imageUrl+'" />';
	}
	function channelFormatter(channelId) { 
        return channelId == 1?"网站":"APP";
	}
	function putawayFormatter(value) {
        var availableHtml = "<span class='badge badge-primary'>&nbsp;上架&nbsp;</span>";
        var unavailableHtml = "<span class='badge badge-warning'>&nbsp;已下架&nbsp;</span>";
        return value == 1 ? availableHtml : unavailableHtml;
    }
    function stateFormatter(value) {
        var availableHtml = "<span class='badge badge-primary'>&nbsp;可 用&nbsp;</span>";
        var unavailableHtml = "<span class='badge badge-warning'>&nbsp;不 可 用&nbsp;</span>";
        return value == 1 ? availableHtml : unavailableHtml;
    }

    function optionFormatter(value, row, index) {
    	var detailHtml = "&nbsp; <#if hasRight("/product/detail")><button type='button' class='fa fa-edit btn btn-primary' onclick='productDetail(" + row.productId + ")'>详情</button></#if> &nbsp;";
        var editHtml = "&nbsp; <#if hasRight("/product/edit")><button type='button' class='fa fa-edit btn btn-primary' onclick='editProduct(" + row.productId + ")'>编 辑</button></#if> &nbsp;";
        var deleteHtml = "&nbsp; <#if hasRight("/product/delete")><button type='button' class='delete fa fa-times btn btn-default' onclick='commonDelete(" + row.productId + ")'>删 除</button></#if> &nbsp;";
        return "<div class='text-center'>" + detailHtml + editHtml + deleteHtml + "</div>";
    }
 
    function addProduct() {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['新增产品', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '85%'],
            content: tableModel.addUrl
        });
    }
    
      function productDetail(productId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['产品详情', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '85%'],
            content: tableModel.addUrl+"?productId="+productId
        });
    }

    function editProduct(productId) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: ['编辑产品', 'font-weight:bold;'],
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '85%'],
            content: tableModel.editUrl + "/" + productId //iframe的url
        });
    }
 </script>
<!-- 通用表格初始化和删除代码 -->
<script src="${basePath}/static/js/admin/table.js"></script>
</@master.masterBlank>