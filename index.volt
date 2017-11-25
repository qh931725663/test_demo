indexindex
<div class="page-content">
    <!-- BEGIN BREADCRUMBS -->
    <div class="breadcrumbs">
        <h1>{{ modelName }}管理</h1>
        <ol class="breadcrumb">
            <?php
            BreadCrumbHelper::create(
                array(
                    0 =>
            array('维权管理','/order/index'),
                    1 => array($modelName . '列表','/order/index')
                )
            );
        ?>
        </ol>

    </div>
    <!-- END BREADCRUMBS -->
    <!-- BEGIN PAGE BASE CONTENT -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <div class="portlet box green">
                <div class="portlet-title">
                     <div class="caption"> <i class="icon-flag"></i>
                        {{ modelName }}列表
                    </div>
                    <div class="tools" style="padding: 8px 0 8px;">

                     </div>
                </div>
                <div class="portlet-body flip-scroll">

                    <div class="col-lg-12 form-group">
                        <form class="form-inline" role="form" action="/order/index">
                          <div class="form-group">
                                <label for="name">订单编号:</label>
                                <input type="text" class="form-control" id="order_no" name="order_no" placeholder="" value="{% if _GET['order_no'] is not empty %}{{_GET['order_no']}}{% endif %}"></div>
                            <button type="submit" class="btn blue uppercase bold"> <i class="fa fa-search"></i>
                                查询
                            </button>
                             <button class="btn blue bold export_file">导出文件</button>
                             <!--<button class="btn blue bold export_file"><a href="excel/write">daochu</a></button>-->
                        </form>
                    </div>


                    <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content">
                            <tr>
                                <th width="5%">序列</th>
                                <th width="10%">下单时间</th>
                                <th>订单编号</th>
                                <th>客户姓名</th>
                                <th width="15%">商品信息</th>
                                <th width="15%">供货商编号</th>
                                <th>当前进行</th>
                                <th>备注</th>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody>
                            {% if data is not empty %}
                            {% for info in data %}
                            <tr id="row_{{ info.id }}">
                                <td>{{info.no}}</td>
                                <td>{{info.order_time}}</td>
                                <td>{{info.order_no}}</td>
                                <td>{{info.customer}}</td>
                                <td>{{info.shop_name}}</td>
                                <td>{{info.vendor}}</td>
                                <td>{{info.step_name}}</td>
                                <td>{{info.remarks}}</td>
                                <td>
                                    <a class="btn grey btn-sm confirmation-callback" href="#" data-original-title="确定删除?" data-placement="left" data-btn-ok-label="确定" data-id="{{ info.id }}" data-btn-cancel-label="取消">删除</a>
                                    <a class="btn  grey btn-sm btn-modify" data-id="{{info.id}}" href="#">修改</a>
                                    <a class="btn blue btn-sm" href="/order/info/{{info.id}}">查看详情</a>
                                </td>
                            </tr>
                            {% endfor %}
            {% endif %}
                        </tbody>
                    </table>
                    {% if paginator is not empty %}
                    {{ paginator }}
                    {% endif %}
                </div>
            </div>
            <!-- END SAMPLE TABLE PORTLET--> </div>
    </div>
    <!-- END PAGE BASE CONTENT -->
</div>
<!-- END PAGE CONTENT-->
<script src="{{ BootstrapHelper.getStaDomain() }}global/plugins/jquery.min.js"></script>
<script type="text/javascript">

function delRow(id) {
    console.log('del:'+id);
    $.ajax({
        type:'POST',
        async:true,
        timeout:10000,
        url:'/order/del',
        data:{
            id:id
        },
        dataType:'json',
        success:function(data){
            if(data.status==true){
                console.log('success');
                // ref:https://github.com/CodeSeven/toastr
                // $('#row_'+id).remove();
                toastr.success(data.message, '提醒');
                setTimeout(function () {
                    window.location.reload();
                }, 1500)
            }else{
                console.log('failed');
                toastr.error(data.message);
                return false;
            }
        },
        error:function(e,textStatus, errorThrown){
            console.log('error');
            toastr.error("验证发生错误，请重试");
            return false;
        }
    });
}

//订单修改跳转
$(".btn-modify").click(function(){
    var id=$(this).data("id");
    //var searchData=window.location.search;
    //if(searchData){
        //window.location.href="/order/info/"+searchData+"&id="+id;
    //}else{
      window.location.href="/order/modify?id="+id;
    //}
});
//导出文件
$(".export_file").click(function(){
    var order_no=$("#order_no").val();
	window.open('/excel/write?cond='+order_no);
});
</script>
