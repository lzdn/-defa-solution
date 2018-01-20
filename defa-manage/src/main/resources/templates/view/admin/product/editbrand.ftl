<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveBrandFrom" action="#" method="post">
        <input id="productBrandId" name="productBrandId" type="hidden" class="form-control" maxlength="32" value="${brand.productBrandId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">品牌名称：</label>
            <div class="col-sm-10" >
                <input id="productBrandName"  name="productBrandName" type="text" class="form-control" maxlength="16" placeholder="请输入4-16位字母" value="${brand.productBrandName!}" />
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
        $("#saveButton").bind("click", function() {
            $('#validationSaveBrandFrom').submit();
        });
        $("#validationSaveBrandFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/brand/save",
                    type : "post",
                    data : {
                        productBrandId : $('#productBrandId').val(),
                        productBrandName : $('#productBrandName').val() 
                    },
                    complete : function(response) {
                        var result = response.responseJSON;
                        if (result.code == 1) {
                            parent.layer.msg(result.message, {icon : 1});
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