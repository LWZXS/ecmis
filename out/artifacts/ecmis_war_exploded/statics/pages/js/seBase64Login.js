var	modulus = "9d3bf04e5b7f68c6deff0b1046b3564719f86e0bbf3440f965a8adf0399aa23c46a4e1bc2df1ccca2581421ca380caf390af5973c68ffc4169a33da4b3fcb984f5b0a9fcfa58388ae400d204346e96340ee2627213712685356b2ece188a610abb76075a30adf166ab542221ff9c2578a8ae1d67733fb3edac5b7a53feac4481";
var	exponent = "010001";
var wait = 120;
var resetWait = 120;


var doSubmit = function() {
	var pwd = document.forms[0].cipher0.value;
	var OldPwd = pwd;
    var key = $.rsa.getKeyPair(exponent, '', modulus);
    pwd =$.rsa.encrypt(key,pwd);
	var uname = document.forms[0].username0.value;
      if(""==uname||null==uname||undefined==uname||""==pwd||null==pwd||undefined==pwd){
    	 $("#nameMsg").html("<div style='margin-left:48px;background:#ca6d6d; color:#fff600; width:199px;'>账号和密码不能为空</div>");
    	  return;
      }
		if(pwd==OldPwd){
			$('#namemsg').html("<div style='margin-left:48px;background:#ca6d6d; color:#fff600; width:199px;'>密码验证错误：code001,请联系管理员！</div>");
			return;
		} 
		document.forms[0].cipher.value = pwd;
		document.forms[0].cipher0.value = "";
        document.forms[0].username.value = $.rsa.encrypt(key, uname);
        document.forms[0].username0.value = "";
        
        
        
		document.forms[0].submit();
	};

	function butOnClick() {
		if (event.keyCode == 13) {
			var button = document.getElementById("submi");
			button.click();
			return false;
		}
	}

	//清理cookike
	function clearCookies() {
		var strCookie = document.cookie;
		var arrCookie = strCookie.split("; ");
		for ( var i = 0; i < arrCookie.length; i++) {
			var arr = arrCookie[i].split("=");
			if (arr.length > 0)
				DelCookie(arr[0]);
		}

	}

	function DelCookie(name) {
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval = GetCookie(name);
		document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
	}

	function GetCookie(name) {
		var arg = name + "=";
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		while (i < clen) {
			var j = i + alen;
			if (document.cookie.substring(i, j) == arg)
				return GetCookieVal(j);
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0)
				break;
		}
		return null;
	}

	function GetCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return decodeURIComponent(document.cookie.substring(offset, endstr));
	}
	function resetBtn(){
		$("#username").val(null);	
		$("#cipher").val(null);
		$("#wangsheng").val("请选择单位");
		$("#wangshengc").val(null);		
		
	}
	//用户名限制输入特殊字符
	function checkSpecificKey(){
		var specialKey = /(?=[\x21-\x7e\￥\；\【\】\、\‘\’\《\》\，\。\·\”\“\？\_\-\\！\：\（\）]+)[^A-Za-z0-9\d-._]/;
		var realKey =$("#username").val();
		var flag = false;
		flag =specialKey.test(realKey);
		if(realKey !=""){
			var specialVaule = realKey.substring(realKey.length-1, realKey.length);
			if(specialVaule == "-" || specialVaule =="_"){
				flag = true;
			}
		}
		if(flag){
			var value = realKey.slice(0, realKey.length-1);
			$("#username").val(value);
			return false;
		}
		return true;
	}
	function jumpToPKI() {
		var url = window.location.href;
		var form = $("<form></form>");
		$("body").append(form);  
		form.attr("action",url);  
		form.attr("method","post");  
		form.attr("display","none");  
		form.append("<input type='hidden' name='authmode' value = 'pki'></input>");  
		form.submit();  
	}
	function openSelectPane() {
		//alert($("#department").blur);
		$(".department_select").css({
			"display":"block"
		});
	}
	function resetPassWord(){
	    var urlTempBase = decodeURIComponent((window.location.href).replace(/\+/g, '%20'));
	    var urlTemp = urlTempBase.split("?");
	    if (urlTemp == "" || urlTemp.length < 2) {
	        alert("路径错误");
	        return false;
	    }
	    var urltemp1 = urlTemp[1].split("=");
	    if (urltemp1 == "" || urltemp1.length < 2) {
	        alert("路径错误");
	        return false;
	    }
	    var url = "";
	    var strs = urltemp1[1].split("/");
	    if (strs != "" && strs.length >= 4) {
	        var controller = "iscPassword"; //方法controller
	        var method = "sendToSecPwdPage"; // method
	        	if(strs[3] !="isc-portal"){
	        		url = $("#portalUri").val()+"/" + controller + "/" + method;
	        	}else{
	        		 url = strs[0] + "//" + strs[2] + "/" + strs[3] + "/" + controller + "/" + method;
	        	}
	        window.location.href = url;
	    }
	}
	function TrimPhone(str){ 
		 return str.replace(/(^\s*)|(\s*$)/g, ""); 
		}
$(function() {
	phoneSwitchCheck = eval(TrimPhone(phoneSwitchCheck));
	if(phoneSwitchCheck){
	   $("#showhide").hide();
	}
            /**
             * 自助注册
             */
            // 打开密保设置页面
            $("#userReg").click(function() {
                        $("#pw_options").window("open");
                    });
            // 关闭注册窗口
            $('#cancel').on('click', function() {
                        $("#pw_options").window("close");
                    });
            // 所属单位数据初始化
            $('#institute').combotree({
                        url : baseJS + '/servlet/GetOrgServlet',
                        valueField : 'id',
                        textField : 'text',
                        method : 'post',
                        editable : false,
                        panelHeight : 'auto',
                        onBeforeExpand : function(node) {
                            var nodeId = node.id;
                            if ("null" != flug && flug != "") {
                                nodeId = flug;
                            }
                            $('#institute').combotree('tree').tree('options').url = baseJS + '/servlet/GetOrgServlet?id=' + nodeId;
                        },
                        onLoadSuccess : function(data) {
                            // 默认值设置选中根节点 方法二：
                            // 获取combotree的树tree对象
                            var tree = $('#institute').combotree('tree');
                            // 通过树tree对象获取根节点
                            var root = tree.tree('getRoot');
                            // 设置默认选中根节点
                            $("#institute").combotree("setValue", root.id);
                        }
                    });
            // 用户注册提交
            $('#registerSubmit').on('click', function() { // 验证必填项是否正确
                        var institute = $('#institute');
                        var username = $('#customername');
                        var account = $('#account');
                        var pwd = $('#pwd');
                        var repeatPwd = $('#repeatPwd');
                        var phone = $('#telphone');
                        var phoneCode = $('#phoneCode');
                        var idCard = $('#idCard');
                        var email = $('#email');
                        var attention = $('#attention');
                        var condition = $('#condition');
                        var flagReg = checkCondition(institute, username, idCard, account, pwd, repeatPwd, phone, phoneCode, email, condition, attention);
                        var instituteValue = $('#institute').combotree('tree').tree('getSelected').id;
                        var b = new Base64();
                        var password = b.encode($.rsa.encrypt(mykey, pwd.val()));
                        var repeatPassword = b.encode($.rsa.encrypt(mykey, pwd.val()));
                        var userName = b.encode(username.val());
//                        var email = email.val();
                        var email = b.encode($.rsa.encrypt(mykey, email.val()));
                        var phone = b.encode($.rsa.encrypt(mykey, phone.val()));
                        var idCard = b.encode($.rsa.encrypt(mykey, idCard.val()));
                        
                        
                        var account_temp = b.encode($.rsa.encrypt(mykey, account.val()));
                        
                        
                        if (flagReg) {
                            jQuery.ajax({
                                        url : baseJS + "/servlet/GetOrgServlet",
                                        type : "POST",
                                        data : {
                                            "institute" : instituteValue,
                                            "username" : userName,
                                            "account" : account_temp,
                                            "pwd" : password,
                                            "repeatPwd" : repeatPassword,
                                            "phone" : phone,
                                            "phoneCode" : phoneCode.val(),
                                            "idCard" : idCard,
                                            "email" : email,
                                            "attention" : attention.val(),
                                            "condition" : condition[0].checked,
                                            "methodType" : "submit"
                                        },
                                        success : function(data) {
                                            if (data == 'usuccess') {
                                                $("#pw_options").window("close");
                                                alert("注册成功！");
                                            } else if (data == 'apsuccess') {
                                                $("#pw_options").window("close");
                                                alert("提交成功，等待管理员审批！");
                                            } else if (data == 'codefailure') {
                                                alert("手机验证码错误！");
                                            } else if (data == 'notFoundApprover') {
                                                alert("当前地市局没有审批人员，请联系管理员！");
                                            } else {
                                                alert(data);
                                            }
                                        }
                                    });
                        }
                    });
            // 生成账号
            $('#validAccount').on('click', function() {
                        var idCard = $('#idCard');
                        var username = $('#customername');
                        var name = username.val();
                        var idcard = idCard.val();
                        if (name == undefined || name == "") {
                            showToolTip(username, '请输入用户姓名');
                        }
                        if (idcard == undefined || idcard == "") {
                            showToolTip(idCard, '请输入身份证号码');
                        } else if (!(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/).test(idcard)) {
                            showToolTip(idCard, '请输入正确的身份证号码！');
                        }
                        if (null != name && name != '') {
                            name = name.replace(/\s+/g, "");
                        }
                        var instituteValue = $('#institute').combotree('tree').tree('getSelected').id;
                        $.post(baseJS + '/servlet/GetOrgServlet', {
                                    id : $('#id').val(),
                                    name : name,
                                    baseorgId : instituteValue,
                                    privateIdentityId : idcard,
                                    methodType : 'generateAccount'
                                }, function(data) {
                                    if (data == "") {
                                        $.messager.alert("提示：", "没有相关策略，请输入门户帐号", 'info');
                                    } else {
                                        $('#account').val(data);
                                    }
                                }, 'text');
                    });
            $("#validPhone").on('click', function() {
                        var telphone = $('#telphone').val();
                        if (telphone == "" || undefined == telphone) {
                            showToolTip($('#telphone'), '请填写手机号码!');
                            return;
                        } else if (!(/^1[34578]\d{9}$/.test(telphone))) {
                            showToolTip($('#telphone'), '请填写正确的手机号码!');
                            return;
                        }
                        $.ajax({
                                    url : baseJS + "/servlet/GetValidateCodeServlet",
                                    type : 'POST',
                                    dataType : 'json',
                                    data : {
                                        "type" : "register",
                                        "phoneCode" : telphone
                                    },
                                    success : function() {
                                        timer($("#validPhone"));
                                    }
                                });
                    });
        });

/**
 * 手机登录
 */
function jumpToPhone() {
    var url = window.location.href;
    var form = $("<form></form>");
    $("body").append(form);
    form.attr("action", url);
    form.attr("method", "post");
    form.attr("display", "none");
    form.append("<input type='hidden' name='authmode' value='phone'></input>");
    form.submit();
}

function destoryToolTip(nowObject) {
    $(nowObject).tooltip('destroy');
}

function validNum(obj) {
    var phonecode = $(obj).val();
    checkPhoneCode($(obj), phonecode);
}

function checkPhoneCode(obj, phonecode) {
    if (!(/^\d{6}$/).test(phonecode)) {
        showToolTip(obj, '请输入正确的验证码！');
    }
    return false;
}

function showToolTip(obj, str) {
    obj.tooltip({
                position : 'top',
                content : '<span style="color:#fff">' + str + '</span>',
                onShow : function() {
                    obj.tooltip('tip').css({
                                backgroundColor : '#666',
                                borderColor : '#666'
                            });
                }
            });
    obj.tooltip('show');
    return false;
}



function checkCondition(institute, username, idCard, account, pwd, repeatPwd, phone, phoneCode, email, condition, attention) {
    var instituteValue = institute.combotree('tree').tree('getSelected').id;
    if (instituteValue == undefined || instituteValue == "") {
        showToolTip(institute, '请选择所属组织！');
        return false;
    }
    if (username.val() == undefined || username.val() == "") {
        showToolTip(username, '请输入用户姓名！');
        return false;
    } else {
        if (!(/^[\ue4e00-\u9fa5]{2,10}$/).test(username.val())) {
            showToolTip(username, '请输入正确的格式！');
            return false;
        }
    }
    if (idCard.val() == undefined || idCard.val() == "") {
        showToolTip(idCard, '请填写身份证号码！');
        return false;
    } else if (!(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/).test(idCard.val())) {
        showToolTip(idCard, '请输入正确的身份证号码！');
        return false;
    }
    if (account.val() == undefined || account.val() == "") {
        showToolTip(account, '请输入用户账号！');
        return false;
    } else {
        validAccount();
    }
    if (pwd.val() == undefined || pwd.val() == "") {
        showToolTip(pwd, '请输入密码！');
        return false;
    } else {
        if (pwd.val().length < 8) {
            showToolTip(pwd, "新密码最小长度为8位！");
            return false;
        }
        if (pwd.val().length > 20) {
            showToolTip(pwd, "新密码最大长度为20位！");
            return false;
        }
        var regValidNum = /[0-9]+/;
        if (!regValidNum.test(pwd.val())) {
            showToolTip(pwd, "密码必须包含数字！");
            return false;
        }
        var regValidletter = /[a-z]+/;
        if (!regValidletter.test(pwd.val())) {
            showToolTip(pwd, "密码必须包含小写字母！");
            return false;
        }
        var regValidletters = /[A-Z]+/;
        if (!regValidletters.test(pwd.val())) {
            showToolTip(pwd, "密码必须包含大写字母！");
            return false;
        }
        if (!containSpecial(pwd.val())) {
            showToolTip(pwd, "密码必须包含(@.#$%*)等特殊字符");
            return false;
        }
    }
    if (repeatPwd.val() == undefined || repeatPwd.val() == "") {
        showToolTip(repeatPwd, '请输入确认密码！');
        return false;
    }
    if (phone.val() == undefined || phone.val() == "") {
        showToolTip(phone, '请填写手机号码！');
        return false;
    } else if (!(/^1[23456789]\d{9}$/.test(phone.val()))) {
        showToolTip(phone, '请输入正确的手机号码！');
        return false;
    }
    if (phoneCode.val() == undefined || phoneCode.val() == "") {
        showToolTip(phoneCode, '请填写手机验证码！');
        return false;
    } else {
        checkPhoneCode(phoneCode, phoneCode.val());
    }
    if (condition[0].checked == false) {
        showToolTip(condition, '请勾选同意条件！');
        return false;
    }
    if (attention.val() != undefined && attention.val() != "" && attention.val() != null) {
        var remark = attention.val();
        if (remark.indexOf('[xxx]') != -1) {
            var array = remark.split("[xxx]");
            if (array != null && array != '' && array != 0 && array.length == 4) {
                var orgName = institute.combotree('tree').tree('getSelected').text;
                var value = array[0] + '[' + username.val() + ']' + array[1] + '[' + account.val() + ']' + array[2] + '[' + orgName + ']' + array[3];
                $('#attention').val(value);
            }
        }
    }
    if (pwd.val() != undefined && pwd.val() != "" && repeatPwd.val() != undefined && repeatPwd.val() != "") {
        if (pwd.val() != repeatPwd.val()) {
            showToolTip(repeatPwd, '两次输入密码不一致！');
            return false;
        }
    }
    return true;
}





function timer(t) {
    if (wait == 0) {
        t.removeAttr("disabled");
        t.val("点击获取验证码");
        wait = resetWait;
    } else {
        t.attr("disabled", true);
        t.val("重新发送(" + wait + ")");
        wait--;
        setTimeout(function() {
                    timer(t);
                }, 1000);
    }
}

function validAccount() {
    var account = $('#account').val();
    if (account == "" || undefined == account) {
        showToolTip($('#account'), '请填写用户账号!');
        return false;
    }
    var regName = /^[A-Za-z0-9_\u4e00-\u9fa5\-\.\@\（\）\(\)]+$/;
    if (!regName.test(account)) {
        showToolTip($('#account'), '格式只能输入数字、字母和下划线!');
        return false;
    }
    var instituteValue = $('#institute').combotree('tree').tree('getSelected').id;
    if (instituteValue == undefined || instituteValue == "") {
        showToolTip($('#institute'), '请选择所属组织！');
        return false;
    }
    return true;
}

function containSpecial(str) {
    var tem = new Array("@", ".", "#", "$", "%", "*");
    var i = 0;
    for (i = 0; i < tem.length - 1; i++) {
        if (str.indexOf(tem[i]) != -1) {
            return true;
        }
    }
    return false;
}
