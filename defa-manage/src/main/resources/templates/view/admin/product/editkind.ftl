<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">
    <form class="form-horizontal m-t" id="validationSaveKindFrom" action="#" method="post">
        <input id="productKindId" name="productKindId" type="hidden" class="form-control" maxlength="32" value="${kind.productKindId!}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label">类别名称：</label>
            <div class="col-sm-10" >
                <input id="productKindName"  name="productKindName" type="text" class="form-control" maxlength="8" placeholder="请输入4-8位字母" value="${kind.productKindName!}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多32个汉字" >${kind.description!}</textarea>
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
            $('#validationSaveKindFrom').submit();
        });
        $("#validationSaveKindFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/kind/save",
                    type : "post",
                    data : {
                        productKindId : $('#productKindId').val(),
                        productKindName : $('#productKindName').val(),
                        description : $("#description").val()
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