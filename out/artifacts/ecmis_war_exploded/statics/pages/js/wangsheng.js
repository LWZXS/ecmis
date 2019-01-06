(function ($) {

    $.fn.wangsheng = function () {
        var options = arguments[0];
        return this.each(function () {
            var obj = $(this);

            //设置显示值
            var setValue = function (name, value) {
                obj.val(name);
                var hidden = obj.next();
                hidden.val(value);
            }

            //点击wangsheng层
            var onClickWangshengLayer = function (e) {
                var objT = $(e.target);
                //点击关闭
                if (objT.hasClass("close")) {
                    hideWangshengPanel();
                }
                //点击页签切
                if (objT.hasClass("wangsheng_tab")) {
                    var li = objT.closest("li");
                    li.addClass("active");
                    li.siblings().removeClass("active");
                    var list = $(".login_tab_menu li");
                    var index = list.index(li);
                    var $cont = $($(".login_tab_content")[index]);
                    $cont.siblings().hide();
                    $cont.show();
                }
                //换点击网省名
                if (objT.hasClass("wangsheng_name")) {
                    var name = objT.html();
                    var value = objT.attr("data");
                    setValue(name, value);
                    hideWangshengPanel();
                }
            }
            //点击搜索层
            var onClickSosuoLayer = function (e) {
                var target = $(e.target);
                var name = target.text();
                var value = target.attr("data");
                if (value == undefined) {
                    value = target.find('a').attr("data");
                }
                setValue(name, value);

                hideSosuoPanel();
            }

            //离开焦点事件
            var inputBlur = function (e) {
                //hideWangshengPanel();
                //hideSosuoPanel();
            }

            //键盘按下事件
            var inputKeyUp = function (e) {
                //删除下面内容
                $(".login_pop_list2 li").remove();
                var target = $(e.target);
                var value = target.val();
                $list = $(".wangsheng_sosuo_list li");
                var isHas = false;
                for (var i = 0; i < $list.length; i++) {
                    var temp = $($list[i]);
                    var target = temp.find("a");
                    var html = target.html();
                    var code = target.attr("code");
                    if (html.indexOf(value) > -1) {
                        isHas = true;
                        $(".login_pop_list2 ul").append("<li>" + temp.html() + "</li>");
                    } else if (code.indexOf(value) > -1) {
                        isHas = true;
                        $(".login_pop_list2 ul").append("<li>" + temp.html() + "</li>");
                    }
                }

                hideWangshengPanel();
                if (isHas) {
                    showSosuoPanel();
                } else {
                    hideSosuoPanel();
                }

            }

            //显示网省面板
            var showWangshengPanel = function (e) {
                $(".login_pop_list1").show();
                hideSosuoPanel();
            };

            //隐藏网省面板
            var hideWangshengPanel = function () {
                $(".login_pop_list1").hide();
            };

            //显示探索面板
            var showSosuoPanel = function () {
                $(".login_pop_list2").show();
            };
            // 隐藏搜索面板
            var hideSosuoPanel = function () {
                $(".login_pop_list2").hide();
                //删除下面内容
                $(".login_pop_list2 li").remove();
            };


            //取得焦点事件
            obj.bind("focus", showWangshengPanel);
            //输入文本事件
            obj.bind("keyup", inputKeyUp);
            //点击网省面板
            var wangshenglayer = $(".login_pop_list1");
            wangshenglayer.bind("click", onClickWangshengLayer);
            //点击搜索面板
            var sosuoLayer = $(".login_pop_list2");
            sosuoLayer.bind("click", onClickSosuoLayer);

            //离开焦点事件
            obj.bind("blur", inputBlur);


        });


    }

})(jQuery);