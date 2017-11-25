$.fn.extend({
    speak: function() {
        alert("点我就弹出来！！！");
    },
    display: function() {
        $(this).hide(1000);
    }
});