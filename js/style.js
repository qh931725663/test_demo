$(function(){
//服务区数据列表
    $.getJSON('http://115.198.179.37:6060/HighWay/Handler/handler_ajax.ashx?action_type=getTotalServerPart',function(SERVERPARTObject){
        //console.log(SERVERPARTObject);
        var html = '';
        $.each(SERVERPARTObject, function(i,p){
            for(var k=0;k< p.length;k++){
                html +=`<option value='${p[k].SERVERPART_CODE}'>${p[k].SERVERPART_NAME}</option>`;
            }
        });
        $(".server-list").html(html);
    });
    //门店列表
    $.getJSON('http://115.198.179.37:6060/HighWay/Handler/handler_ajax.ashx?action_type=getServerPartShop&action_data= SERVERPART_ID',function(ServerPartShopObject){
        //console.log(ServerPartShopObject);
        var html = '';
        $.each(ServerPartShopObject, function(i, p){
            //console.log(p);
            for(var l=0;l< p.length;l++) {
                    html +=`<option value = '${p[l].SHOPCODE}' >${p[l].SHOPNAME} </option >`;
            }
        });
        $(".shop-list").html(html);
    });
//异步加载数据
    $.getJSON('http://115.198.179.37:6060/HighWay/Handler/handler_ajax.ashx?action_type=getServerPartEndaccount&action_data= SERVERPARTSHOP_ID',function(EndaccountObject){
        //console.log(EndaccountObject);
        var html = '';
        $.each(EndaccountObject, function(i,p){
            for(var j=0;j< p.length;j++){
                html +=`<tr  style="width:100%;">
                <th>${j+1}</th>
                <th>-</th>
                <th>${p[j].SERVERPART_NAME}</th>
                <th>${p[j].SHOPNAME}</th>
                <th>${p[j].TICKETCOUNT}</th>
                <th>${p[j].TOTALCOUNT}</th>
                <th>${p[j].TOTALSELLAMOUNT}</th>
                <th>-</th>
                <th>${p[j].CASHPAY}</th>
                <th>${Math.floor(p[j].TOTALSELLAMOUNT/p[j].TICKETCOUNT*100)/100}</th>
                <th>${p[j].MOBILEPAYMENT}</th>
                <th>-</th>
                <th>${p[j].ENDACCOUNT_DATE}</th>
                </tr>`;
            }
        });
        $(".table-list tbody.mlist").html(html);
    });
});