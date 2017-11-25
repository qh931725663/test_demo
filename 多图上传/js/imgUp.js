$(function(){
    var delParent;
    var defaults = {
        fileType         : ["jpg","png","bmp","jpeg"],   // 涓婁紶鏂囦欢鐨勭被鍨�
        fileSize         : 1024 * 1024 * 10                  // 涓婁紶鏂囦欢鐨勫ぇ灏� 10M
    };
    /*鐐瑰嚮鍥剧墖鐨勬枃鏈*/
    $(".file").change(function(){
        var idFile = $(this).attr("id");
        var file = document.getElementById(idFile);
        var imgContainer = $(this).parents(".z_photo"); //瀛樻斁鍥剧墖鐨勭埗浜插厓绱�
        var fileList = file.files; //鑾峰彇鐨勫浘鐗囨枃浠�
        console.log(fileList+"======filelist=====");
        var input = $(this).parent();//鏂囨湰妗嗙殑鐖朵翰鍏冪礌
        var imgArr = [];
        //閬嶅巻寰楀埌鐨勫浘鐗囨枃浠�
        var numUp = imgContainer.find(".up-section").length;
        var totalNum = numUp + fileList.length;  //鎬荤殑鏁伴噺
        if(fileList.length > 5 || totalNum > 5 ){
            alert("涓婁紶鍥剧墖鏁扮洰涓嶅彲浠ヨ秴杩�5涓紝璇烽噸鏂伴€夋嫨1111");  //涓€娆￠€夋嫨涓婁紶瓒呰繃5涓� 鎴栬€呮槸宸茬粡涓婁紶鍜岃繖娆′笂浼犵殑鍒扮殑鎬绘暟涔熶笉鍙互瓒呰繃5涓�
        }
        else if(numUp < 5){
            fileList = validateUp(fileList);
            for(var i = 0;i<fileList.length;i++){
                var imgUrl = window.URL.createObjectURL(fileList[i]);
                imgArr.push(imgUrl);
                var $section = $("<section class='up-section fl loading'>");
                imgContainer.prepend($section);
                var $span = $("<span class='up-span'>");
                $span.appendTo($section);

                var $img0 = $("<img class='close-upimg'>").on("click",function(event){
                    event.preventDefault();
                    event.stopPropagation();
                    $(".works-mask").show();
                    delParent = $(this).parent();
                });
                $img0.attr("src","img/a7.png").appendTo($section);
                var $img = $("<img class='up-img up-opcity'>");
                $img.attr("src",imgArr[i]);
                $img.appendTo($section);
                var $p = $("<p class='img-name-p'>");
                $p.html(fileList[i].name).appendTo($section);
                var $input = $("<input id='taglocation' name='taglocation' value='' type='hidden'>");
                $input.appendTo($section);
                var $input2 = $("<input id='tags' name='tags' value='' type='hidden'/>");
                $input2.appendTo($section);

            }
        }
        setTimeout(function(){
            $(".up-section").removeClass("loading");
            $(".up-img").removeClass("up-opcity");
        },450);
        numUp = imgContainer.find(".up-section").length;
        if(numUp >= 5){
            $(this).parent().hide();
        }

        //input鍐呭娓呯┖
        $(this).val("");
    });



    $(".z_photo").delegate(".close-upimg","click",function(){
        $(".works-mask").show();
        delParent = $(this).parent();
    });

    $(".wsdel-ok").click(function(){
        $(".works-mask").hide();
        var numUp = delParent.siblings().length;
        if(numUp < 6){
            delParent.parent().find(".z_file").show();
        }
        delParent.remove();

    });

    $(".wsdel-no").click(function(){
        $(".works-mask").hide();
    });

    function validateUp(files){
        var arrFiles = [];//鏇挎崲鐨勬枃浠舵暟缁�
        for(var i = 0, file; file = files[i]; i++){
            //鑾峰彇鏂囦欢涓婁紶鐨勫悗缂€鍚�
            var newStr = file.name.split("").reverse().join("");
            if(newStr.split(".")[0] != null){
                var type = newStr.split(".")[0].split("").reverse().join("");
                console.log(type+"===type===");
                if(jQuery.inArray(type, defaults.fileType) > -1){
                    // 绫诲瀷绗﹀悎锛屽彲浠ヤ笂浼�
                    if (file.size >= defaults.fileSize) {
                        alert(file.size);
                        alert('鎮ㄨ繖涓2�"'+ file.name +'"鏂囦欢澶у皬');
                    } else {
                        // 鍦ㄨ繖閲岄渶瑕佸垽鏂綋鍓嶆墍鏈夋枃浠朵腑
                        arrFiles.push(file);
                    }
                }else{
                    alert('您这个"'+ file.name +'"上传类型不符合');
                }
            }else{
                alert('鎮ㄨ繖涓�2"'+ file.name +'"娌℃湁绫诲瀷, 鏃犳硶璇嗗埆');
            }
        }
        return arrFiles;
    }























})