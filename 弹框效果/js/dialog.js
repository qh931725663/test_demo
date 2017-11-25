/**
 * 妯℃€佹銆佹彁绀烘 dialog.js
 *
 */
(function(root,factory,plug){
    factory(root,plug);
})(window,function(root,plug){
    if(!root['$']||!root['jQuery']){
        throw new Error('This plug-in relies on jquery,Please introduce jQuery first ');
    }
    var instance;
    var Dialog = function(options){
        this.init(options);
    }
    Dialog.prototype={
        constructor:Dialog,
        init:function(options){
            var defaultOptions={
                type:'tips',
                content:'this is tips',
                dom:'',
                effectIn:'animated fadeIn',
                effectOut:'animated fadeOut',
                hasMask:'',
                time:1000,
                closeBtn:'.dialogClose'
            }
            this.opt=$.extend({},defaultOptions,options);
            this.dom = this.opt.dom?$(this.opt.dom):$('body');
            this.listener = {};
            this.handler = [];
            this.show();
        },

        show:function(callback){
            if(instance)return;
            instance = this;
            var _this = this;
            if(this.opt.type==='tips'){
                createTip(this.dom,this.opt.content,this.opt.effectIn);
                callback&&callback();
                setTimeout(function(){
                    _this.hide();
                },_this.opt.time)
            }
            if(this.opt.type==='dialog'){
                createMask();
                $('body').append(this.dom);
                this.dom.css({position:'absolute',left:'50%',top:'50%',display:'block'}).css({marginTop:this.dom.height()/-2+'px',marginLeft:this.dom.width()/-2+'px'});
                $('#dialog-mask').addClass('animated fadeIn');
                this.dom.addClass(this.opt.effectIn);
                callback&&callback();
                if($(this.opt.closeBtn)){
                    $(this.opt.closeBtn).on('click',function(){
                        _this.hide();
                        if(_this.handler.indexOf('close')>-1){
                            _this.emit('close')
                        }
                    })
                }
            }
            return this;
        },
        hide:function(callback){
            instance = null;
            var _this = this;
            if(this.opt.type==='dialog'){
                $('#dialog-mask').addClass('animated fadeOut');
                this.dom.addClass(this.opt.effectOut);
                $('#dialog-mask').on('webkitAnimationEnd',function(){
                    _this.dom.css({display:'none'}).removeClass(_this.opt.effectIn).removeClass(_this.opt.effectOut);
                    $(this).remove();
                    callback&&callback();
                    if(_this.handler.indexOf('remove')>-1){
                        _this.emit('remove')
                    }
                })

            }
            if(this.opt.type==='tips'){
                $('#dialog-tips').addClass(this.opt.effectOut);
                $('#dialog-tips').on('webkitAnimationEnd',function(){
                    $(this).remove();
                    callback&&callback();
                    if(_this.handler.indexOf('remove')>-1){
                        _this.emit('remove')
                    }
                })

            }
            return this;
        },
        on:function(type,fn){
            this.handler.push(type);
            if(typeof this.listener[type]==='undefined'){
                this.listener[type]=[];
            }
            if(typeof fn==='function'){
                this.listener[type].push(fn);
            }
            return this;
        },
        emit:function(type){
            var fnArr = this.listener[type];
            for(var i=0;i<fnArr.length;i++){
                if(typeof fnArr[i] ==='function'){
                    fnArr[i]({type:type})
                }
            }
            return this;
        },
        off:function(type,fn){
            var fnArr = this.listener[type];
            if(typeof fn==='function'||fn){
                for(var i=0;i<fnArr;i++){
                    if(fnArr[i]===fn){
                        this._listeners[type].splice(i,1);
                        break;
                    }
                }
            }else{
                delete this.listener[type];
            }
            return this;
        }

    }
    // 鐩戝惉浜嬩欢

    // create tips
    function createTip(dom,content,effect){
        dom.append('<div id="dialog-tips" style="display:inline-block;padding:5px 12px;background:rgba(0,0,0,.8);color:#fff;position:absolute;top:50%;left:50%;border-radius:5px;">'+content+'</div>');
        $('#dialog-tips').css({marginLeft:$('.dialog-tips').width()/-2+'px',marginTop:$('.dialog-tips').height()/-2+'px'}).addClass(effect);
    }
    // create mask
    function createMask(){
        $('body').append('<div id="dialog-mask" class="dialogClose" style="position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.8);"></div>')
    }
    root[plug]=function(options){
        return new Dialog(options);
    }
},'Dialog')