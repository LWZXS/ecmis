(function($){	
	var defArrData;
	if(undefined==flug|| flug==""||flug=="null"){
	 defArrData = ["csg.cn","sg.gd.csg.cn","qy.gd.csg.cn","mz.gd.csg.cn","mm.gd.csg.cn","jy.gd.csg.cn","zs.gd.csg.cn","zq.gd.csg.cn","zj.gd.csg.cn","zh.gd.csg.cn","yj.gd.csg.cn","yf.gd.csg.cn","xxzx.gd.csg.cn","sw.gd.csg.cn","st.gd.csg.cn","jm.gd.csg.cn","hz.gd.csg.cn","hy.gd.csg.cn","gsbb.gd.csg.cn","gpdc.gd.csg.cn","fs.gd.csg.cn","dky.gd.csg.cn","dg.gd.csg.cn","cz.gd.csg.cn","sbd.gd.csg.cn","pxzx.gd.csg.cn","yn.csg.cn","gzps.corp.csg","gz.csg.cn","gzgy.csg.cn","gzlps.csg.cn","gzzy.csg.cn","gzas.csg.cn","gztr.csg.cn","gzxy.csg.cn","gzbj.csg.cn","gzkl.csg.cn","gzdy.csg.cn","gzgaxq.csg.cn","gzsbd.csg.cn","gzjl.csg.cn","gzsyy.csg.cn","gzwz.csg.cn","gzyj.csg.cn","gzpx.csg.cn","gzdzy.csg.cn","gzqngs.csg.cn","gzyy.csg.cn","gzgl.csg.cn","sz.corp.csg","st.csg.cn","tc.st.csg.cn","lc.st.csg.cn","gx.st.csg.cn","hx.st.csg.cn","qx.st.csg.cn","sx.st.csg.cn","yx.st.csg.cn","mx.st.csg.cn","haix.st.csg.cn","hn.csg.cn","gzga.csg.cn"];
	 initautocomp(defArrData,$);
	}else{
		changeOrg(flug);
	}
	
  })(jQuery);
function initautocomp(arrData,$){
	$.fn.mailAutoComplete = function(options){
		if(arguments.length>0 && typeof arguments[0] === 'string') {
			if(arguments[1])
			$('.mailListBox').show();
			else {
				$('.mailListBox').hide();
			}
		}
		var defaults = {
			boxClass: "mailListBox", //婢舵牠鍎碽ox閺嶅嘲绱?
			listClass: "mailListDefault", //姒涙顓婚惃鍕灙鐞涖劍鐗卞锟?
			focusClass: "mailListFocus", //閸掓銆冮柅澶嬬壉瀵繋鑵?
			markCalss: "mailListHlignt", //妤傛ü瀵掗弽宄扮础
			zIndex: 1,
			autoClass: true, //閺勵垰鎯佹担璺ㄦ暏閹绘帊娆㈤懛顏勭敨class閺嶅嘲绱?
			mailArr: arrData, //闁喕娆㈤弫鎵矋
			textHint: false, //閺傚洤鐡ч幓鎰仛閻ㄥ嫯鍤滈崝銊︽▔缁?桨绗岄梾鎰
			hintText: "",
			focusColor: "#333",
			blurColor: "#999",
			//display : true //add by liu,true为控件可见
		};
		var settings = $.extend({}, defaults, options || {});
		
		//妞ょ敻娼扮憗鍛版祰CSS閺嶅嘲绱?
		if(settings.autoClass && $("#mailListAppendCss").size() === 0){
			$('<style id="mailListAppendCss" type="text/css">.mailListBox{border:1px solid #369; background:#fff; font:12px/20px Arial;position:absolute;top: 10px; left: 10px;z-index:999; }.mailListDefault{padding:0 5px;cursor:pointer;white-space:nowrap;}.mailListFocus{padding:0 5px;cursor:pointer;white-space:nowrap;background:#369;color:white;}.mailListHlignt{color:red;}.mailListFocus .mailListHlignt{color:#fff;}</style>').appendTo($("head"));	
		}
		
		var cb = settings.boxClass, cl = settings.listClass, cf = settings.focusClass, cm = settings.markCalss; //閹绘帊娆㈤惃鍒ass閸欐﹢鍣?
		var z = settings.zIndex, newArr = mailArr = settings.mailArr, hint = settings.textHint, text = settings.hintText, fc = settings.focusColor, bc = settings.blurColor;
		//閸掓稑缂撻柇顔绘閸愬懘鍎撮崚妤勩?閸愬懎顔?
		$.createHtml = function(str, arr, cur){
			
			var mailHtml = "";
			if($.isArray(arr)){
				$.each(arr, function(i, n){
					if(i === cur){
						mailHtml += '<div class="mailHover '+cf+'" id="mailList_'+i+'"><span class="'+cm+'">'+str+'</span>@'+arr[i]+'</div>';	
					}else{
						mailHtml += '<div class="mailHover '+cl+'" id="mailList_'+i+'"><span class="'+cm+'">'+str+'</span>@'+arr[i]+'</div>';	
					}
				});
			}
			return mailHtml;
		};
		//娑撯偓娴滄稑鍙忕仦鈧崣姗?櫤
		var index = -1, s;
		$(this).each(function(){
			var that = $(this), i = $(".justForJs").size();	
			if(i > 0){ //閸欘亞绮︾?姘娑擃亝鏋冮張顒侇攱
			 	return;	
			}
			var w = that.outerWidth(), h = that.outerHeight(); //閼惧嘲褰囪ぐ鎾冲鐎电钖勯敍鍫濆祮閺傚洦婀板鍡礆閻ㄥ嫬顔旀锟?
			//閺嶅嘲绱￠惃鍕灥婵瀵?
			that.wrap('<span style="display:inline-block;position:relative;"></span>')
				.before('<div id="mailListBox_'+i+'" class="justForJs '+cb+'" style="min-width:'+w+'px;_width:'+w+'px;position:absolute;left:-6000px;top:'+h+'px;z-index:'+z+';"></div>');
			
			var x = $("#mailListBox_" + i), liveValue; //閸掓銆冨鍡楊嚠鐠烇拷
			that.focus(function(){
				//閻栬埖鐖ｇ粵鍓ф畱鐏炲倻楠?
				$(this).css("color", fc).parent().css("z-index", z);	
				//閹绘劗銇氶弬鍥х摟閻ㄥ嫭妯夌粈杞扮瑢闂呮劘妫?
				if(hint && text){
					var focus_v = $.trim($(this).val());
					if(focus_v === text){
						$(this).val("");
					}
				}
				//闁款喚娲忔禍瀣╂
				$(this).keyup(function(e){					
					s = v = $.trim($(this).val());	
					if(/@/.test(v)){
						s = v.replace(/@.*/, "");
					}
					if(v.length > 0){
						//婵″倹鐏夐幐澶愭暛閺勵垯绗傛稉瀣暛
						if(e.keyCode === 38){
							//閸氭垳绗?
							if(index <= 0){
								index = newArr.length;	
							}
							index--;
						}else if(e.keyCode === 40){
							//閸氭垳绗?
							if(index >= newArr.length - 1){
								index = -1;
							}
							index++;
						}else if(e.keyCode === 13){
							
							//閸ョ偠婧?
							if(index > -1 && index < newArr.length){
								//婵″倹鐏夎ぐ鎾冲閺堝绺哄ú璇插灙鐞涳拷s
								$(this).val($("#mailList_"+index).text());	
							}else{
								$(this).val($("#mailList_"+0).text());
							}
						}else{
							if(/@/.test(v)){
								index = -1;
								//閼惧嘲绶盄閸氬酣娼伴惃鍕偓锟?
								//s = v.replace(/@.*/, "");
								//閸掓稑缂撻弬鏉垮爱闁板秵鏆熺紒锟?
								var site = v.replace(/.*@/, "");
								newArr = $.map(mailArr, function(n){
									var reg = new RegExp('^'+site);	
									if(reg.test(n)){
										return n;	
									}
								});
							}else{
								newArr = mailArr;
							}
						}
						x.html($.createHtml(s, newArr, index)).css("left", 0);
						if(e.keyCode === 13){
							//閸ョ偠婧?
							if(index > -1 && index < newArr.length){
								//婵″倹鐏夎ぐ鎾冲閺堝绺哄ú璇插灙鐞涳拷
								x.css("left", "-6000px");	
							}
						}
					}else{
						x.css("left", "-6000px");	
					}
				}).blur(function(){
					if(hint && text){
						var blur_v = $.trim($(this).val());
						if(blur_v === ""){
							$(this).val(text);
						}
					}
					getDepartment($(this).val());
					$(this).css("color", bc).unbind("keyup").parent().css("z-index",0);
					x.css("left", "-6000px");	
					
				});				
				//姒х姵鐖ｇ紒蹇氱箖閸掓銆冩い閫涚皑娴狅拷
				//姒х姵鐖ｇ紒蹇氱箖				
				$("#mailListBox_0").on("mouseover",".mailHover", function(){
					index = Number($(this).attr("id").split("_")[1]);					
					liveValue = $("#mailList_"+index).text();
					x.children("." + cf).removeClass(cf).addClass(cl);
					$(this).addClass(cf).removeClass(cl);
				});
			});
			
			x.bind("mousedown", function(){																
				that.val(liveValue);		
			});

		});
	};
	}
//add by liuq
function getDepartment(mailAddress) {
	  var gzPattern =/^.*@gz[a-zA-Z]{0,}\.csg\.cn$/;//域名以GZ打头中间出现0次以上的英文字母后以.csg.cn结尾
	  var stPattern = /^.*@[a-zA-Z]{0,4}\.st\.csg\.cn$/;//域名开头会出现0次到4次以上的英文字母后，以.st.csg.cn结尾
	  var zbPattern = /.*@csg\.cn/;
	  var gxPattern = /^.*[0-9]{3,}[xX]?$/;//开头为任意，结尾至少出现3次数字，至少出现1次xX
	  var gyPattern = /^[a-zA-Z]+[0-9]{0,}$/;
	  if ('soaadmin'==mailAddress ) {
		  $("#department").val('公司总部');
		  $("#wangsheng").val('csg');
	  } else if (mailAddress.indexOf('@')!=-1) {//有域名的情况
		  if(mailAddress.indexOf('gd.csg.cn')!=-1) {//广东电网
			  $("#department").val('广东电网公司');
			  $("#wangsheng").val('gddw');
		  } else if (mailAddress.indexOf('yn.csg.cn')!=-1) {//云南电网公司
			  $("#department").val('云南电网公司');
			  $("#wangsheng").val('yndw');
		  } else if (mailAddress.indexOf('gzps.corp.csg')!=-1) {//广州供电局
			  $("#department").val('广州供电局');
			  $("#wangsheng").val('gzgd');
		  } else if (mailAddress.indexOf('hn.csg.cn')!=-1) {//海南电网公司
			  $("#department").val('海南电网公司');
			  $("#wangsheng").val('hndw');
		  } else if (gzPattern.test(mailAddress)) {//贵州电网公司
			  $("#department").val('贵州电网公司');
			  $("#wangsheng").val('gzdw');
		  } else if (mailAddress.indexOf('sz.corp.csg')!=-1) {//深圳供电局
			  $("#department").val('深圳供电局');
			  $("#wangsheng").val('szgd');
		  } else if (stPattern.test(mailAddress)) {//双调
			  $("#department").val('调峰调频发电公司');
			  $("#wangsheng").val('tftpfd');
		  } else if(zbPattern.test(mailAddress)) {
			  $("#department").val('公司总部');
			  $("#wangsheng").val('csg');
		  }else if(mailAddress.indexOf("gx.csg.cn")||mailAddress.indexOf("xt.gx.csg.cn")||mailAddress.indexOf("wz.gx.csg.cn")||mailAddress.indexOf("dd.gx.csg.cn")||mailAddress.indexOf("kj.gx.csg.cn")||mailAddress.indexOf("bhp.gx.csg.cn")||mailAddress.indexOf("gp.gx.csg.cn")||mailAddress.indexOf("sy.gx.csg.cn")||
				  mailAddress.indexOf("dj.gx.csg.cn")||mailAddress.indexOf("sbd.gx.csg.cn")||mailAddress.indexOf("wy.gx.csg.cn")||mailAddress.indexOf("nng.gx.csg.cn")||mailAddress.indexOf("nnby.gx.csg.cn")||mailAddress.indexOf("nnhx.gx.csg.cn")||mailAddress.indexOf("nnla.gx.csg.cn")||mailAddress.indexOf("nnms.gx.csg.cn")||
				  mailAddress.indexOf("nnpg.gx.csg.cn")||mailAddress.indexOf("nnsl.gx.csg.cn")||mailAddress.indexOf("nnwm.gx.csg.cn")||mailAddress.indexOf("nnyn.gx.csg.cn")||mailAddress.indexOf("lzg.gx.csg.cn")||mailAddress.indexOf("lzlc.gx.csg.cn")||mailAddress.indexOf("lzlj.gx.csg.cn")||mailAddress.indexOf("lzlz.gx.csg.cn")||
				  mailAddress.indexOf("lzra.gx.csg.cn")||mailAddress.indexOf("glg.gx.csg.cn")||mailAddress.indexOf("glcj.gx.csg.cn")||mailAddress.indexOf("gllg.gx.csg.cn")||mailAddress.indexOf("gllc.gx.csg.cn")||mailAddress.indexOf("glxa.gx.csg.cn")||mailAddress.indexOf("glys.gx.csg.cn")||mailAddress.indexOf("glyf.gx.csg.cn")||
				  mailAddress.indexOf("bsg.gx.csg.cn")||mailAddress.indexOf("bsll.gx.csg.cn")||mailAddress.indexOf("bstd.gx.csg.cn")||mailAddress.indexOf("bsty.gx.csg.cn")||mailAddress.indexOf("czg.gx.csg.cn")||mailAddress.indexOf("czfs.gx.csg.cn")||mailAddress.indexOf("czpx.gx.csg.cn")||mailAddress.indexOf("ylg.gx.csg.cn")||
				  mailAddress.indexOf("ylbl.gx.csg.cn")||mailAddress.indexOf("yllc.gx.csg.cn")||mailAddress.indexOf("lbg.gx.csg.cn")||mailAddress.indexOf("lbhs.gx.csg.cn")||mailAddress.indexOf("lbwx.gx.csg.cn")||mailAddress.indexOf("lbxz.gx.csg.cn")||mailAddress.indexOf("lbxc.gx.csg.cn")||mailAddress.indexOf("lbxb.gx.csg.cn")||
				  mailAddress.indexOf("ggg.gx.csg.cn")||mailAddress.indexOf("gggp.gx.csg.cn")||mailAddress.indexOf("ggpn.gx.csg.cn")||mailAddress.indexOf("hcg.gx.csg.cn")||mailAddress.indexOf("hcdh.gx.csg.cn")||mailAddress.indexOf("hcdl.gx.csg.cn")||mailAddress.indexOf("hchj.gx.csg.cn")||mailAddress.indexOf("hcjc.gx.csg.cn")||
				  mailAddress.indexOf("hclc.gx.csg.cn")||mailAddress.indexOf("hcyz.gx.csg.cn")||mailAddress.indexOf("bhg.gx.csg.cn")||mailAddress.indexOf("bhhp.gx.csg.cn")||mailAddress.indexOf("bhwz.gx.csg.cn")||mailAddress.indexOf("qzg.gx.csg.cn")||mailAddress.indexOf("qzls.gx.csg.cn")||mailAddress.indexOf("qzpb.gx.csg.cn")||
				  mailAddress.indexOf("qzcj.gx.csg.cn")||mailAddress.indexOf("fcg.gx.csg.cn")||mailAddress.indexOf("fcdx.gx.csg.cn")||mailAddress.indexOf("fcfc.gx.csg.cn")||mailAddress.indexOf("hzg.gx.csg.cn")||mailAddress.indexOf("wzg.gx.csg.cn")){
		  }
	  }
}
function changeOrg(val){
	if("广东电网公司"==val||"中山"==val||"肇庆"==val||"湛江"==val||"珠海"==val||"阳江"==val||"云浮"==val||"信息中心"==val||"汕尾"==val||"汕头"==val||"韶关"==val||"清远"==val||"梅州"==val||"茂名"==val||"揭阳"==val||"江门"==val||"惠州"==val||"河源"==val||"省公司"==val||"调控中心"==val||"佛山"==val||"电科院"==val||"东莞"==val||"潮州"==val||"输变电工程公司"==val||"培训评价中心"==val){
		 var tarrData =["zj.gd.csg.cn","zh.gd.csg.cn","yj.gd.csg.cn","yf.gd.csg.cn","xxzx.gd.csg.cn","sw.gd.csg.cn","st.gd.csg.cn","sg.gd.csg.cn","qy.gd.csg.cn","mz.gd.csg.cn","mm.gd.csg.cn","jy.gd.csg.cn","jm.gd.csg.cn","hz.gd.csg.cn","hy.gd.csg.cn","gsbb.gd.csg.cn","gpdc.gd.csg.cn","fs.gd.csg.cn","dky.gd.csg.cn ","dg.gd.csg.cn","cz.gd.csg.cn","sbd.gd.csg.cn ","pxzx.gd.csg.cn"];
		 initautocomp(tarrData,jQuery);
      }else if("广西电网公司"==val){
    	  var tarrData =["gx.csg.cn","xt.gx.csg.cn","wz.gx.csg.cn","dd.gx.csg.cn","kj.gx.csg.cn","bhp.gx.csg.cn","gp.gx.csg.cn","sy.gx.csg.cn","dj.gx.csg.cn","sbd.gx.csg.cn","wy.gx.csg.cn","nng.gx.csg.cn","nnby.gx.csg.cn","nnhx.gx.csg.cn","nnla.gx.csg.cn","nnms.gx.csg.cn","nnpg.gx.csg.cn","nnsl.gx.csg.cn","nnwm.gx.csg.cn","nnyn.gx.csg.cn","lzg.gx.csg.cn","lzlc.gx.csg.cn","lzlj.gx.csg.cn","lzlz.gx.csg.cn","lzra.gx.csg.cn","glg.gx.csg.cn","glcj.gx.csg.cn","gllg.gx.csg.cn","gllc.gx.csg.cn","glxa.gx.csg.cn","glys.gx.csg.cn","glyf.gx.csg.cn","bsg.gx.csg.cn","bsll.gx.csg.cn","bstd.gx.csg.cn","bsty.gx.csg.cn","czg.gx.csg.cn","czfs.gx.csg.cn","czpx.gx.csg.cn","ylg.gx.csg.cn","ylbl.gx.csg.cn","yllc.gx.csg.cn","lbg.gx.csg.cn","lbhs.gx.csg.cn","lbwx.gx.csg.cn","lbxz.gx.csg.cn","lbxc.gx.csg.cn","lbxb.gx.csg.cn","ggg.gx.csg.cn","gggp.gx.csg.cn","ggpn.gx.csg.cn","hcg.gx.csg.cn","hcdh.gx.csg.cn","hcdl.gx.csg.cn","hchj.gx.csg.cn","hcjc.gx.csg.cn","hclc.gx.csg.cn","hcyz.gx.csg.cn","bhg.gx.csg.cn","bhhp.gx.csg.cn","bhwz.gx.csg.cn","qzg.gx.csg.cn","qzls.gx.csg.cn","qzpb.gx.csg.cn","qzcj.gx.csg.cn","fcg.gx.csg.cn","fcdx.gx.csg.cn","fcfc.gx.csg.cn","hzg.gx.csg.cn","wzg.gx.csg.cn"];
 		 initautocomp(tarrData,jQuery);
      }else if("超高压输电公司"==val){
    	  var tarrData =[""];
  		 initautocomp(tarrData,jQuery);
      }else if("云南电网公司"==val){
    	  var tarrData =["yn.csg.cn"];
  		 initautocomp(tarrData,jQuery);
      }else if("海南电网公司"==val){
    	  var tarrData =["hn.csg.cn"];
   		 initautocomp(tarrData,jQuery);
       }else if("广州供电局"==val){
    	  var tarrData =["gzps.corp.csg"];
  		 initautocomp(tarrData,jQuery);
      }else if("贵州电网公司"==val||"贵州电网公司"==val||"贵阳供电局"==val||"六盘水供电局"==val||"遵义供电局"==val||"安顺供电局"==val||"铜仁供电局"==val||"兴义供电局"==val||"毕节供电局"==val||"凯里供电局"==val||"都匀供电局"==val||"贵安新区供电局筹备组"==val||"贵州电网公司电网规划研究中心"==val||"贵州送变电工程公司"==val||"贵州电力工程建设监理公司"==val||"贵州电网公司电力调度控制中心"==val||"贵州电力试验研究院"==val||"贵州电网公司信息通信分公司"==val||"贵州电网公司物流服务中心"==val||"贵州电网公司输电运行检修分公司"==val||"贵州电网公司培训与评价中心"==val||"贵州黔能企业（集团）公司"==val||"贵州电力职工医院"==val||"贵州贵龙饭店"==val||"贵安供电局"==val){
    	  var tarrData =["gz.csg.cn","gzgy.csg.cn","gzlps.csg.cn","gzzy.csg.cn","gzas.csg.cn","gztr.csg.cn","gzxy.csg.cn","gzbj.csg.cn","gzkl.csg.cn","gzdy.csg.cn","gzgaxq.csg.cn","gzsbd.csg.cn","gzjl.csg.cn","gzsyy.csg.cn","gzwz.csg.cn","gzyj.csg.cn","gzpx.csg.cn","gzdzy.csg.cn","gzqngs.csg.cn","gzyy.csg.cn","gzgl.csg.cn","gzga.csg.cn"];
   		 initautocomp(tarrData,jQuery);
       }else if("深圳供电局"==val){
     	  var tarrData =["sz.corp.csg"];
   		 initautocomp(tarrData,jQuery);
       }else if("调峰调频公司本部"==val){
     	  var tarrData =["st.csg.cn"];
   		 initautocomp(tarrData,jQuery);
       }else if("天生桥二级水力发电有限公司"==val){
     	  var tarrData =["tc.st.csg.cn"];
   		 initautocomp(tarrData,jQuery);
       }else if("鲁布革水力发电厂"==val){
      	  var tarrData =["lc.st.csg.cn"];
    		 initautocomp(tarrData,jQuery);
        }else if("广东蓄能发电有限公司"==val){
       	  var tarrData =["gx.st.csg.cn"];
    		 initautocomp(tarrData,jQuery);
        }else if("惠州抽水蓄能电站建管局"==val){
       	  var tarrData =["hx.st.csg.cn"];
    		 initautocomp(tarrData,jQuery);
        }else if("清远蓄能发电有限公司"==val){
       	  var tarrData =["qx.st.csg.cn"];
    		 initautocomp(tarrData,jQuery);
        }else if("深圳蓄能发电有限公司"==val){
       	  var tarrData =["sx.st.csg.cn"];
    		 initautocomp(tarrData,jQuery);
        }else if("阳江抽水蓄能电站项目部"==val){
         	  var tarrData =["yx.st.csg.cn"];
     		 initautocomp(tarrData,jQuery);
         }else if("梅州抽水蓄能电站项目部"==val){
          	  var tarrData =["mx.st.csg.cn"];
     		 initautocomp(tarrData,jQuery);
         }else if("海南蓄能发电有限公司"==val){
          	  var tarrData =["haix.st.csg.cn"];
     		 initautocomp(tarrData,jQuery);
         }else{
        	  var defArrData = ["csg.cn","sg.gd.csg.cn","qy.gd.csg.cn","mz.gd.csg.cn","mm.gd.csg.cn","jy.gd.csg.cn","zs.gd.csg.cn","zq.gd.csg.cn","zj.gd.csg.cn","zh.gd.csg.cn","yj.gd.csg.cn","yf.gd.csg.cn","xxzx.gd.csg.cn","sw.gd.csg.cn","st.gd.csg.cn","jm.gd.csg.cn","hz.gd.csg.cn","hy.gd.csg.cn","gsbb.gd.csg.cn","gpdc.gd.csg.cn","fs.gd.csg.cn","dky.gd.csg.cn","dg.gd.csg.cn","cz.gd.csg.cn","sbd.gd.csg.cn","pxzx.gd.csg.cn","yn.csg.cn","gzps.corp.csg","gz.csg.cn","gzgy.csg.cn","gzlps.csg.cn","gzzy.csg.cn","gzas.csg.cn","gztr.csg.cn","gzxy.csg.cn","gzbj.csg.cn","gzkl.csg.cn","gzdy.csg.cn","gzgaxq.csg.cn","gzsbd.csg.cn","gzjl.csg.cn","gzsyy.csg.cn","gzwz.csg.cn","gzyj.csg.cn","gzpx.csg.cn","gzdzy.csg.cn","gzqngs.csg.cn","gzyy.csg.cn","gzgl.csg.cn","sz.corp.csg","st.csg.cn","tc.st.csg.cn","lc.st.csg.cn","gx.st.csg.cn","hx.st.csg.cn","qx.st.csg.cn","sx.st.csg.cn","yx.st.csg.cn","mx.st.csg.cn","haix.st.csg.cn","hn.csg.cn","gzga.csg.cn"];
        	  initautocomp(defArrData,jQuery);
          }
	}

