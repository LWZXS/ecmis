$(function () {
//部门input获得焦点后 显示选择框
    $("#department").focus(function () {
        $(".department_select").css({
            "display": "block"
        })
    });
//右上角关闭按钮
    $(".department_close").click(function () {
        $(".department_select").css({
            "display": "none"
        })
    });
//部门按组切换
    $(".tab_list li").click(function () {
        $(".tab_list li").removeClass("crt");
        $(this).addClass("crt");
        var _index = $(this).index();
        /* alert(_index); */
        $(".department_con").css({"display": "none"});
        $($(".department_con").get(_index)).css({"display": "block"});
    })
//获取公司名称填入部门input框中
    $(".department_list li a").click(function () {
        $(".department_select").css({"display": "none"});
        $("#department").val($(this).text());
        $("#wangsheng").val($(this).attr("data"));
        changeOrg($("#department").val());
    });
})
