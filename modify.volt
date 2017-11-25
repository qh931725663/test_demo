<link href="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
{{super()}}
<link href="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
<link href="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<link href="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#files button{
    margin-left: 10px;
}
</style>
<div class="page-content">
    <!-- BEGIN BREADCRUMBS -->
    <div class="breadcrumbs">
        <h1>{{ modelName }}修改</h1>
        <ol class="breadcrumb">
            <?php
            $localName = empty($order->id) ? '修改新' . $modelName : $modelName . '修改';
            BreadCrumbHelper::create(
                array(
                    0 => array($modelName . '管理','/order/index'),
                    1 => array($localName),
                )
            );
            ?>
        </ol>
    </div>
    <!-- END BREADCRUMBS -->
    <!-- BEGIN PAGE BASE CONTENT -->
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit portlet-form bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-plus font-green"></i>
                        <span class="caption-subject font-green sbold uppercase">修改订单</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group">
                            <a class="btn grey btn-sm sbold" href="javascript:history.go(-1)"> 返回
                            </a>
                        </div>
                    </div>
                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form id="submitForm" class="form-horizontal" novalidate="novalidate">
                        <div class="form-body">
                            <input name="id" value="{% if order is not empty %}{{ order.id }}{% endif %}" id="table_id" type="hidden" />

                            <div class="form-group">
                                <label class="control-label col-md-3 color_time">下单时间
                                    <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control form-control-inline date-picker" data-date="2012/10/11" data-date-format="yyyy-mm-dd" name="order_time" id="order_time" value="{% if order is not empty %}{{ order.order_time }}{% endif %}" /> </div>
                                        <div class="help-block help-block1" style="color:#e73d4a;margin-top:5px;margin-bottom:5px;display:none;">请输入下单时间</div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-3 color_order">订单编号
                                    <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="order_no" id="order_no" value="{% if order is not empty %}{{ order.order_no }}{% endif %}" /> </div>
                                    <div class="help-block help-block2" style="color:#e73d4a;margin-top:5px;margin-bottom:5px;display:none;">请输入订单编号</div>    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 color_vendor">供货商编号
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="realprice" id="vendor" value="{% if order is not empty %}{{ order.vendor }}{% endif %}" /> </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 color_customer">客户姓名
                                  <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="customer" id="customer" value="{% if order is not empty %}{{ order.customer }}{% endif %}" /> </div>
                                        <div class="help-block help-block3" style="color:#e73d4a;margin-top:5px;margin-bottom:5px;display:none;">请输入客户姓名</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 color_phone">联系电话
                                  <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="phone" id="phone" value="{% if order is not empty %}{{ order.phone }}{% endif %}" /> </div>
                                        <div class="help-block help-block4" style="color:#e73d4a;margin-top:5px;margin-bottom:5px;display:none;">请输入联系电话</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 color_shop">商品信息
                                  <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="shop_name" id="shop_name" value="{% if order is not empty %}{{ order.shop_name }}{% endif %}" /> </div>
                                </div>
                                <div class="help-block help-block5" style="color:#e73d4a;margin-top:5px;margin-bottom:5px;display:none;">请输入商品名称</div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">备注
                                </label>
                                <div class="col-md-4">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="text" class="form-control" name="remarks" id="remarks" value="{% if order is not empty %}{{ order.remarks }}{% endif %}" /> </div>
                                </div>
                            </div>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button id="submitBtn" class="btn green" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> 修改交中..." data-complete-text="<i class='fa fa-check'></i> 修改完成" >修改</button>
                                    <button type="button" id="btn_cancel" class="btn grey-salsa btn-outline">重置</button>
                                </div>
                            </div>
                        </div>
                            <input type="hidden" name="update_time" value="{% if order is not empty %}{{ order.update_time }}{% endif %}">
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE BASE CONTENT -->
</div>
<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/jquery.min.js"></script>
<!--<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>-->
<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#submitBtn").click(function(){
        //var dropdownV = $("#show_2").val();
        $.ajax({
            url: "/order/modify",
            type: "GET",
            dataType:'json',
            data:$("#submitForm").serialize(),
            success: function (data) {
                if(data.status==true){
                    toastr.success(data.message);
                    window.location.href="/order/index"; 
                }     
            },
            error:function(e,textStatus, errorThrown){
                if(data.status==false){
                    toastr.error(data.message);
                    window.location.reload();
                }
            }
        })
    });
//表单重置
$("#btn_cancel").click(function(){
    $('input').val("");
});
</script>
