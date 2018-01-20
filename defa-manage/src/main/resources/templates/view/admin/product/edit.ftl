<#import "/master-blank.ftl" as master />
<@master.masterBlank args=false bodyclass="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<form class="form-horizontal m-t" id="validationSaveProductFrom" action="#" method="post">
		<input id="productId" name="productId" type="hidden" class="form-control" maxlength="32" value="${product.productId!}" />
		<input id="productDetailId" name="productDetailId" type="hidden" class="form-control" maxlength="32" value="${detail.productDetailId!}" />
		<div class="form-group">
			<label class="col-sm-2 control-label">产品名称：</label>
			<div class="col-sm-10">
				<input id="productName" name="productName" type="text" class="form-control" maxlength="16" placeholder="请输入4-16位字母" value="${product.productName!}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品品牌：</label>
			<div class="col-sm-10">
				<#if (brands)??&&brands?size gt 0> 
					<select id="productBrandId" name="productBrandId" class="form-control">
						<#list brands as brand>
							<option value="${brand.productBrandId}"<#if (product.productBrandId)??&&(brand.productBrandId == product.productBrandId) >selected</#if> >${brand.productBrandName!}</option>
		                </#list>
	                </select>
            	</#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">产品类别：</label>
            <div class="col-sm-10" >
            	<#if (kinds)??&&kinds?size gt 0>
	             	<select id="productKindId" name="productKindId" class="form-control" >
	             		<#list kinds as kind >
	                      <option value="${kind.productKindId}" <#if (product.productKindId)??&&(kind.productKindId == product.productKindId) >selected</#if> >${kind.productKindName!}</option>
	                     </#list>
	                </select>
            	</#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">产品展示渠道：</label>
            <div class="col-sm-10" >
             	<select id="channelId" name="channelId" class="form-control" >
                      <option value="1" <#if (product.channelId)??&&(1 == product.channelId) >selected</#if> >网站</option>
                      <option value="2" <#if (product.channelId)??&&(2 == product.channelId) >selected</#if> >APP</option>
                </select>
            </div>
        </div>
        <div class="form-group">
			<label class="col-sm-2 control-label">产品价格：</label>
			<div class="col-sm-10">
				<input id="price" name="price" type="text" class="form-control" maxlength="8" placeholder="单价" value="<#if (product.price)??>${product.price?string('#.00')}</#if>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品库存：</label>
			<div class="col-sm-10">
				<input id="stock" name="stock" type="text" class="form-control" maxlength="8" placeholder="库存" value="${product.stock!}" />
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label">推荐类型：</label>
            <div class="col-sm-10" >
             	<select id="pushType" name="pushType" class="form-control" >
             		  <option value="">无</option>
                      <option value="1" <#if (product.pushType)??&&(1 == product.pushType) >selected</#if> >新菜推荐</option>
                      <option value="2" <#if (product.pushType)??&&(2 == product.pushType) >selected</#if> >店长推荐</option>
                      <option value="3" <#if (product.pushType)??&&(3 == product.pushType) >selected</#if> >经典</option>
                      <option value="4" <#if (product.pushType)??&&(4 == product.pushType) >selected</#if> >热门</option>
                </select>
            </div>
        </div>
        <div class="form-group">
			<label class="col-sm-2 control-label">推荐打分：</label>
			<div class="col-sm-10">
				<input id="score" name="score" type="text" class="form-control" maxlength="8" placeholder="打分（分值越高的排在前面展示）" value="${product.score!}" />
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label">是否上架：</label>
            <div class="col-sm-10" >
             	<select id="isPutaway" name="isPutaway" class="form-control" >
                      <option value="1" <#if (product.isPutaway)??&&(1 == product.isPutaway) >selected</#if> >已上架</option>
                      <option value="0" <#if (product.isPutaway)??&&(0 == product.isPutaway) >selected</#if> >已下架</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">产品相册：</label>
            <div class="col-sm-1">
            	<span class="btn btn-success" id="chooseImage">上传图片</span> 
            </div>
            <style>
            .pro_img_box{
            /*	height:400px;
            	width:1000px;*/
            	overflow:auto;
            }
            .pro_img_inner_box{
            	display: inline-block;
            	float: left;
            	margin: 0 5px;
            	text-align: center;
            }
            .pro_img_inner_box img{
            	height:350px;
            	width:200px;
            }
           /* #chooseImage{
            padding:0;
            }*/
            
            .quehome_box_quiz_mask {
			    position: fixed;
			    top: 0;
			    bottom: 0;
			    left: 0;
			    right: 0;
			    margin: auto;
			    background: #000;
			    z-index: 1;
			    opacity: 0.5;
			    filter: alpha(opacity=50);
			}
			.quehome_box_quiz_kuang {
			    width: 405px;
			    height: 260px;
			    background: #fff;
			    position: fixed;
			    left: 0;
			    right: 0;
			    top: 0;
			    bottom: 0;
			    margin: auto;
			    z-index: 2;
			    border: 1px solid #E6EDF6;
			}
			.quehome_box_quizk_title {
			    width: 100%;
			    height: 40px;
			    border-bottom: 1px solid #d1dcf0;
			    background: #e6edf6;
			    line-height: 18px;
			    font-size: 18px;
			    color: #537cb4;
			    padding: 10px;
			    box-sizing: border-box;
			}
			.quehome_box_quizk_tab {
			    overflow: hidden;
			    height: 48px;
			}
			.quehome_box_quizk_state2 {
			    position: relative;
			    height: 100px;
			    border-top: 1px dashed #DEE5F3;
			    border-bottom: 1px dashed #DEE5F3;
			    text-align: center;
			    font-size: 16px;
			    color: #9fadc7;
			    background: #F7F8FA;
			    padding: 25px 95px;
			    box-sizing: border-box;
			}
			.quehome_box_quizk_state1 {
			    height: 100px;
			    line-height: 100px;
			    border-top: 1px dashed #DEE5F3;
			    border-bottom: 1px dashed #DEE5F3;
			    text-align: center;
			    font-size: 16px;
			    color: #9fadc7;
			    background: #F7F8FA;
			}
			.quehome_box_quizk_state4 {
			    height: 100px;
			    border-top: 1px dashed #DEE5F3;
			    border-bottom: 1px dashed #DEE5F3;
			    background: #F7F8FA;
			}
			.quehome_box_quizk_state4 img {
			    width: 119px;
			    height: 77px;
			    margin: 0 auto;
			    display: block;
			    margin-top: 10px;
			}
			.quehome_box_quizk_state3 {
			    height: 100px;
			    padding: 30px 25px;
			    box-sizing: border-box;
			}
			.quehome_box_quizk_bottom {
			    overflow: hidden;
			}
			.quehome_box_quizk_title i {
			    width: 20px;
			    height: 20px;
			    float: right;
			    display: inline-block;
			    font-size: 20px;
			    cursor: pointer;
			}
			.select {
			    color: #0896ff !important;
			}
			.quehome_box_quizk_tab_left {
			    line-height: 48px;
			    text-align: center;
			    width: 49%;
			    font-size: 18px;
			    color: #9fadc7;
			    float: left;
			    cursor: pointer;
			}
			.quehome_box_quizk_tab_xian {
			    height: 20px;
			    width: 1px;
			    background: #e6edf6;
			    float: left;
			    margin-top: 15px;
			}
			.quehome_box_quizk_tab_left {
			    line-height: 48px;
			    text-align: center;
			    width: 49%;
			    font-size: 18px;
			    color: #9fadc7;
			    float: left;
			    cursor: pointer;
			}
			.state2inputfile {
			    -ms-filter: 'alpha(opacity=0)';
			    position: absolute;
			    margin: 0;
			    opacity: 0;
			    cursor: pointer;
			    bottom: 0;
			    left: 110px;
			    width: 175px;
			    height: 75px;
			}
			.quehome_box_quizk_state2 i {
			    font-size: 64px;
			   /* float: left;*/
			    width: 1em;
			    line-height: 50px;
			    height: 57px;
			}
			.quehome_box_quizk_state2zi {
			 /*   float: left;
			    margin-left: 15px;*/
			}
			.quehome_box_quizk_state3 span {
			    line-height: 36px;
			    font-size: 14px;
			    color: #9fadc7;
			    display: inline-block;
			}
			.quehome_box_quizk_state3 input {
			    width: 264px;
			    height: 32px;
			    line-height: 32px;
			    border: 1px solid #D1DCF0;
			    padding: 0 8px;
			    box-sizing: border-box;
			}
			.quehome_box_quizk_bottomzi {
			    line-height: 60px;
			    float: left;
			    color: #537cb4;
			    font-size: 14px;
			    margin-left: 25px;
			}
			.quehome_box_quizk_bottombtn1 {
			    text-align: center;
			    line-height: 34px;
			    width: 88px;
			    height: 34px;
			    font-size: 14px;
			    color: #fff;
			    border-radius: 5px;
			    margin: 15px 20px 0 0;
			    float: right;
			    background: #0796FF;
			    cursor: pointer;
			}
			.quehome_box_quizk_bottombtn {
			    text-align: center;
			    line-height: 34px;
			    width: 88px;
			    height: 34px;
			    font-size: 14px;
			    color: #9fadc7;
			    border-radius: 5px;
			    margin: 15px 20px;
			    float: right;
			    background: #E6EDF6;
			    cursor: pointer;
			}
			.icon-guanbi:before {
			    content: "\e677";
			}
            </style>
            <div class="col-sm-9 pro_img_box" id="fileList">
            	<#if (images)??&&images?size gt 0>
            		<#list images as image>
		            	<div class="pro_img_inner_box">
			            	<p><img src="${image.imageUrl!}"></p>
			            	<p><input type="text" name="imageName" placeholder="图片名称" value="${image.imageName!}"></p>
			            	<p>
			            		<label><span class="btn btn-warning btn-xs" onclick="deleteIMG(this)">删除</span></label>
			            		<label>设为封面</label>
			            		<input type="radio" name="isCover" value="${image.imageUrl!}" <#if (product.imageUrl)??&&(product.imageUrl==image.imageUrl)> checked </#if>/>
			            		<input type="hidden" name="imgUrl" value="${image.imageUrl!}"/>
			            	</p>
		            	 </div>
	            	 </#list>
            	 </#if>
            </div>
        </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">产品描述：</label>
            <div class="col-sm-10">
                <textarea id="description" name="description"  class="form-control" maxlength="128" placeholder="最多32个汉字" >${product.description!}</textarea>
            </div>
        </div>
        <div class="form-group">
			<label class="col-sm-2 control-label">产品产地：</label>
			<div class="col-sm-10">
				<input id="productPlace" name="productPlace" type="text" class="form-control" maxlength="8" placeholder="产地" value="${detail.productPlace!}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品生产日期：</label>
			<div class="col-sm-10">
				<div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="produceDate">
                    <input class="form-control" size="16" placeholder="请选择生产日期" type="text" value="<#if (detail.produceDate)??>${detail.produceDate?string('yyyy-MM-dd')}</#if>" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="produceDate" name="produceDate" value="<#if (detail.produceDate)??>${detail.produceDate?string('yyyy-MM-dd')}</#if>" /><br/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品保质期：</label>
			<div class="col-sm-10">
				<#if (periods)??&&periods?size gt 0>
	             	<select id="productPeriod" name="productPeriod" class="form-control" >
	             		<#list periods as period>
	                      <option value="${period.id}" <#if (product.productPeriod)??&&(period.id == product.productPeriod) >selected</#if> >${period.description!}</option>
	                     </#list>
	                </select>
            	</#if>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品销售模式：</label>
			<div class="col-sm-10">
				<#if (sellingModes)??&&sellingModes?size gt 0>
	             	<select id="sellingMode" name="sellingMode" class="form-control" >
	             		<#list sellingModes as selling>
	                      <option value="${selling.id}" <#if (product.sellingMode)??&&(selling.id == product.sellingMode) >selected</#if> >${selling.description!}</option>
	                     </#list>
	                </select>
            	</#if>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品单位类型：</label>
			<div class="col-sm-10">
				<#if (units)??&&units?size gt 0>
	             	<select id="unitCode" name="unitCode" class="form-control" >
	             		<#list units as unit>
	                      <option value="${unit.id}" <#if (product.unitCode)??&&(unit.id == product.unitCode) >selected</#if> >${unit.description!}</option>
	                     </#list>
	                </select>
            	</#if>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品单位数量：</label>
			<div class="col-sm-10">
				<input id="unitNum" name="unitNum" type="text" class="form-control" maxlength="8" placeholder="单位数量" value="${detail.unitNum!}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品单位重量：</label>
			<div class="col-sm-10">
				<input id="unitWeight" name="unitWeight" type="text" class="form-control" maxlength="8" placeholder="单位重量" value="${detail.unitWeight!}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">产品单位净重：</label>
			<div class="col-sm-10">
				<input id="unitNetWeight" name="unitNetWeight" type="text" class="form-control" maxlength="8" placeholder="单位净重" value="${detail.unitNetWeight!}" />
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
 
 
 <!--遮罩-->
<div class="quehome_box_quiz_mask" style="display: none;"></div>
<div class="quehome_box_quiz_kuang _upload" style="display: none;">
	<div class="quehome_box_quizk_title">上传图片<i class="glyphicon glyphicon-remove-circle"></i></div>
	<div class="quehome_box_quizk_tab">
		<div class="quehome_box_quizk_tab_left wangluo select ">上传网络图片</div>
		<div class="quehome_box_quizk_tab_xian"></div>
		<div class="quehome_box_quizk_tab_left bendi ">上传本地图片</div>
	</div>
	<!--上传本地图片-->
	<div class="quehome_box_quizk_state2" style="display: none;">
		<input type="file" name="fileElem" id="fileElem" class="state2inputfile" unselectable="on" onchange="handleFiles()" />
		<i class="icon iconfont icon-shangchuan1"></i>
		<div class="quehome_box_quizk_state2zi">
			<div class="quehome_box_quizk_state2zi1">点击上传图片</div>
			<div class="quehome_box_quizk_state2zi2">(图片大小不超过5M)</div>
		</div>
	</div>
	<!--上传本地正在上传-->
	<div class="quehome_box_quizk_state1" style="display: none;">正在上传...</div>
	<!--上传本地图片完成-->
	<div class="quehome_box_quizk_state4" style="display: none;">
		<!--<img id="showcut" src="" alt="">-->
	</div>
	<!--上传网络图片-->
	<div class="quehome_box_quizk_state3" style="display: block">
		<span>图片网址：</span>
		<input type="text" id="wangluourl">
	</div>
	<!--底部-->
	<div class="quehome_box_quizk_bottom">
		<div class="quehome_box_quizk_bottomzi">一次只能上传一张图片</div>
		<div class="quehome_box_quizk_bottombtn1">确认</div>
		<div class="quehome_box_quizk_bottombtn">取消</div>
	</div>
</div>

<!--
 <script src="${basePath}/static/js/jquery-1.8.3.min.js"></script>
-->
<!-- validate -->
<script src="${basePath}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${basePath}/static/js/admin/validate.js"></script>
<!-- iCheck -->
<script src="${basePath}/static/js/plugins/iCheck/icheck.min.js"></script>
<!-- 后台通用js -->
<script src="${basePath}/static/js/admin/common.js"></script>
<script src="${basePath}/static/js/timepicker/bootstrap-datetimepicker.min.js"></script> 
<script src="${basePath}/static/js/timepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/static/js/ajaxfileupload.js"></script>
	
<script>
var private_static_uploading = false; //正在上传
var img_size;
var img_url;
var img_width;
var img_height;
$.defa_openlink = function() {
		$('div.quehome_box_quiz_mask').show()
		$('div.quehome_box_quiz_kuang._link').show()
		$('#linkWords').val('');
		$('#links').val('');
	};
	
	$.defa_closelink = function() {
		$('div.quehome_box_quiz_mask').hide()
		$('div.quehome_box_quiz_kuang._link').hide()
		$('#linkWords').val('');
		$('#links').val('');
	};
	
	$.defa_openupload = function() {
		$.recover();
		$('div.quehome_box_quiz_mask').show()
		$('div.quehome_box_quiz_kuang._upload').show()
		$('div.quehome_box_quizk_state3').show()
	};
	$.defa_closeupload = function() {
		$.recover();
	};

	$.defa_changeupload = function(type) {
		if(type == 1) { //网络上传
			if(!private_static_uploading) {
				$('div.quehome_box_quizk_tab_left.bendi').removeClass('select');
				$('div.quehome_box_quizk_state2').hide()
				$('div.quehome_box_quizk_state1').hide()
				$('div.quehome_box_quizk_state4').hide()
				$('div.quehome_box_quizk_tab_left.wangluo').addClass('select');
				$('div.quehome_box_quizk_state3').show()
			}
		} else {
			//本地上传
			if(!private_static_uploading) {
				if(img_url && img_url != "") {
					$('div.quehome_box_quizk_state4').show()
				} else {
					$('div.quehome_box_quizk_state2').show()
				}
				$('div.quehome_box_quizk_state3').hide()
				$('div.quehome_box_quizk_tab_left.wangluo').removeClass('select');
				$('div.quehome_box_quizk_tab_left.bendi').addClass('select');
			}
		}

	};
	$.recover = function() {
		img_url = '';
		img_size = '';
		img_width = '';
		img_height = '';
		$('#wangluourl').val('');
		if($('#fileElem')) $('#fileElem').val('');
		//	if($('#imgUrl')) $('#imgUrl').val('');
		private_static_uploading = false;
		$('div.quehome_box_quiz_mask').hide();
		$('div.quehome_box_quiz_kuang._upload').hide();
		$('div.quehome_box_quizk_state1').hide()
		$('div.quehome_box_quizk_state2').hide()
		$('div.quehome_box_quizk_state3').hide()
		$('div.quehome_box_quizk_state4').hide()
		$('div.quehome_box_quizk_tab_left.bendi').removeClass('select');
		$('div.quehome_box_quizk_tab_left.wangluo').addClass('select');
	}
	$.defa_ok_upload = function(type) {
		private_static_uploading = false;
		if(type == 1) {
			var html = '<div class="pro_img_inner_box"><p><img src='+$('#wangluourl').val()+'></p><p><input type="text" name="imageName" placeholder="图片名称"></p>'
			+'<p><label><span class="btn btn-warning btn-xs" onclick="deleteIMG(this)">删除</span></label><label>设为封面</label><input type="radio" name="isCover" value="'+$('#wangluourl').val()+'" /><input type="hidden" name="imgUrl" value="'+$('#wangluourl').val()+'" /></p></div>';
			$('#fileList').append(html);
		} else if(type == 2){
			$('div.quehome_box_quizk_state4').html('');
			var html = '<div class="pro_img_inner_box"><p><img src="'+img_url+'" /></p><p><input type="text" name="imageName" placeholder="图片名称"></p>'
			+'<p><label><span class="btn btn-warning btn-xs" onclick="deleteIMG(this)">删除</span></label><label>设为封面</label><input type="radio" name="isCover" value="'+img_url+'" /><input type="hidden" name="imgUrl" value="'+img_url+'" /></p></div>';
			$('#fileList').append(html);
		}  
		
		$.recover();
		$('#fileElem').val('');
		$('a.quehome_box_qch1_filenew_del').on('click', function() {
			$('div.quehome_box_qch1_filenew').html('');
		});
	}
	
	function removeImg(){
		$('div.quehome_box_qch1_filenew').html('');
	}
	$.defa_canlce_upload = function() {
		private_static_uploading = false;
		$.recover();
		$('#fileElem').val('');
		$('div.quehome_box_quizk_state4').html('');

	}

	function isURL(staic_url) {
		var urlRegExp = /^((https|http|ftp|rtsp|mms)?:\/\/)+[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
		if(urlRegExp.test(staic_url)) {
			return true;
		} else {
			return false;
		}
	}
	
	function deleteIMG(obj){
		$(obj).parent().parent().parent().remove();
	}

	 
	
	function handleFiles() {
		var filePath = $('#fileElem').val();
		if(filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) { //校验格式
			private_static_uploading = true;
			$('div.quehome_box_quizk_state1').show()
			$('div.quehome_box_quizk_state2').hide()
			$.ajaxFileUpload({
				url: '${basePath}/upload/uploadimage', //用于文件上传的服务器端请求地址
				type: 'post',
				secureuri: false, //一般设置为false
				fileElementId: 'fileElem', //文件上传控件的id属性  <input type="file" id="upload" name="upload" />
				dataType: 'json', //返回值类型 一般设置为json
				success: function(data) //服务器成功响应处理函数
				{
				//	alert(data)
					if(data.success) {
						img_url = data.msg;
						img_size = data.filesize;
						img_width = data.width;
						img_height = data.height;
						$('div.quehome_box_quizk_state4').html('<img  src="' + data.msg + '" alt="" >');
						$('div.quehome_box_quizk_state1').hide()
						$('div.quehome_box_quizk_state2').hide()
						$('div.quehome_box_quizk_state4').show()
					} else {
						$('div.quehome_box_quizk_state1').hide()
						$('div.quehome_box_quizk_state2').show()
						alert(data.msg)
					}
					private_static_uploading = false;
				}, 
				error: function(data, status, e) //服务器响应失败处理函数
				{
					$('div.quehome_box_quizk_state2').show()
					$('div.quehome_box_quizk_state1').hide()
					$('div.quehome_box_quizk_state2').hide()
					alert('服务器繁忙，请稍后再试!');
				}
			});
		} else {
			private_static_uploading = false;
			alert("请上传JPG|PNG格式的图片")
		}
	}
	
	function getImgArray(){
		var arr = new Array();
		$("input[name^='imgUrl']").each(function(){
		   arr.push($(this).val()); 
		});
		var str = arr.join(',');
		return str;
    }
    
    function getImgNameArray(){
		var arr = new Array();
		$("input[name^='imageName']").each(function(){
		var st = $(this).val() ;
		   arr.push(st==''?'无':st); 
		});
		var str = arr.join(',');
		return str;
    }
 
    $().ready(function () {
	    $('.form_datetime').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
	   
        // 验证表单-保存部门
        $("#saveButton").bind("click", function() {
            $('#validationSaveProductFrom').submit();
        });
        
        $("#validationSaveProductFrom").validate({
            submitHandler : function(form) {
                $.ajax({
                    dataType : "json",
                    url : "${basePath}/product/save",
                    type : "post",
                    data : {
                    	productId : $('#productId').val(),
                    	productDetailId : $('#productDetailId').val(),
                    	productName : $("#productName").val(),
                    	productBrandId : $('#productBrandId').val(),
                    	productKindId : $("#productKindId").val(),
                    	channelId : $("#channelId").val(),
                    	price : $("#price").val(),
                    	stock : $("#stock").val(),
                    	pushType : $("#pushType").val(),
                    	score : $("#score").val(),
                    	isPutaway : $("#isPutaway").val(),
                    	isCover : $("input[name='isCover']:checked").val(),
                    	imgUrl : getImgArray(),
                    	imageName:getImgNameArray(),
                    	productPlace : $("#productPlace").val(),
                    	produceDate : $("#produceDate").val(),
                    	productPeriod : $("#productPeriod").val(),
                    	sellingMode : $("#sellingMode").val(),
                    	unitCode : $("#unitCode").val(),
                    	unitNum : $("#unitNum").val(),
                    	unitWeight : $("#unitWeight").val(),
                    	unitNetWeight : $("#unitNetWeight").val(),
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
        
        //上传图片
		$('#chooseImage').on('click', function() {
			$.defa_openupload();
		});
		//关闭上传图片div
		$('i.glyphicon.glyphicon-remove-circle').on('click', function() {
			$.defa_closeupload();
		});
		//网络上传
		$('div.quehome_box_quizk_tab_left.wangluo').on('click', function() {
			$.defa_changeupload(1);

		});
		//本地上传
		$('div.quehome_box_quizk_tab_left.bendi').on('click', function() {
			$.defa_changeupload(2);

		});
		//触发文件选择
		$('div.quehome_box_quizk_state2zi1').on('click', function(e) {
			//	$('#fileElem').click();
			//	e.preventDefault();
		});
		//取消
		$('div.quehome_box_quizk_bottombtn').on('click', function() {
			if(!private_static_uploading){
				/*alert("正在上传中，请稍后")
				return false;*/
					$.defa_canlce_upload();
			}
		
		});

		//确认
		$('div.quehome_box_quizk_bottombtn1').on('click', function() {
			if($('div.quehome_box_quizk_tab_left.wangluo').hasClass('select')) {
				//上传网络图片
				if($('#wangluourl').val() == "" || !isURL($('#wangluourl').val())) {
					alert('请输入正确的网络图片地址');
				} else {
					$.defa_ok_upload(1);
				}
			} else {
				if(private_static_uploading){
					alert('正在上传中..');
					return false;
				}
				//上传本地图片
				if(img_url == "" || img_url == undefined) {
					alert('请选择要上传本地图片');
				} else {
					$.defa_ok_upload(2);
				}
			}
		});
    });
</script>
</@master.masterBlank>