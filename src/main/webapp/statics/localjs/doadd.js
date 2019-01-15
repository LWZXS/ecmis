function save(status){
	
	//$("#status").val(status);
	/* var param=$("#ff").serialize();
	alert(param); 
	$("#ff").submit(function(){
		address
		docSource
		docTypeId
		serviceNo
		documentName
		subjectTermId
		importanceDegree
		auditorId
		originalCode
		jointTrials
		approverId
		creationDate
		publishRanges
		file
		return true;
	});
	*/
	//jeasyui表单提交
	//alert(status);
	$("#status").val(status);
	if($("#status").val()==1){
		$("#docStatusId").val(2);
	}
	 $('#ff').form('submit', {
	    url:"document/add.do",
	    onSubmit: function(){
	    	//验证
			//alert($("#docTypeId").val());
			/*
			name="address"
			
			name="docSource"
			id="docTypeId"
			name="serviceNo"
			name="documentName"
			id="subjectTermId"
			id="auditorId"
			name="originalCode"
			id="joint_trial_select"
			id="approverId"
			name="creationDate"
			id="publish_range_select"
								
			id=docTypeName
			id="subjectTermName"
			id="auditorName"
			id="approverName"
								
			*/
			var flag= check($('[name="address"]')) & check($('[name="docSource"]')) & check($('#docTypeName')) &  check($('[name="documentName"]')) & check($('#subjectTermName')) & check($('#auditorName')) & check($('[name="originalCode"]')) & check($('#approverName')) & check($('[name="creationDate"]')) & check($('#docTypeName')) & check($('#subjectTermName')) & check($('#auditorName')) & check($('#approverName'));
			
			return flag;
	    },
	    success:function(data){
	    	//成功请求后的代码
	    	switch(data){
	    		case 'success':
	    			if(status==1){
	    				alert("文档发送成功");
	    				window.location.href="document/issued.html";
	    			}else{
	    				alert("保存草稿成功");
	    				window.location.href="document/draft.html";
	    			}
	    			break;
	    		case 'notLogin':
	    			alert("请先登录！");
	    			window.parent.parent.parent.location.href='user/login.html';
	    			break;
	    		case 'notProject':
	    			alert("选择项目！");
	    			break;
	    		default:
	    			alert(data);
	    	}
	    	
	    }
	});
	
	//普通提交
	//$("#myFrm").submit();
}

function check(obj){

	if(obj.val()==null || obj.val()==""){
		obj.addClass("textbox-invalid");
		return false;
	}
	obj.removeClass("textbox-invalid");
	return true;
}
//选中文档类型
function getSelected(source,targetId,targetText,dialogObj){
	var node = source.tree('getSelected');
	if (node){
		var text = node.text;
		var id = node.id;
		//alert(id);
		//赋值
		targetId.val(id);
		targetText.val(text);
		//关闭dialog
		dialogObj.dialog('close');
	}
}

//选择文档类型
function getSelectedType(source,targetId,targetText,dialogObj){
	var node = source.tree('getSelected');
	if(node.attributes.isParent){
		alert("请选择子项！");
		return;
	}
	
	if (node){
		var text = node.text;
		var id = node.id;
		
		//赋值
		targetId.val(id);
		targetText.val(text);
		//关闭dialog
		dialogObj.dialog('close');
		
		//向服务器发送一个请求
		$.ajax({
			url:'documentType/putWordPath',
			type:'get',
			data:'docName='+node.attributes.docName,
			dataType:'json',
			success:function(data){
				if(data.result=='success'){
					//增加一个tabs,用于显示正文
					if($('#file-tabs').tabs('exists','正文')){
						$('#file-tabs').tabs('select','正文');
					}else{
						
						//设置mainBody
						
						/*var docName=node.attributes.docName;
						var suffix=docName.subStr(docName.lastIndexOf("."));*/
						var mainBody="";
						if($("#mainBody").val()==""){
							var rand=Math.floor(Math.random()*10000);
							var today=new Date();
							var todayStr=today.getFullYear()+""+(today.getMonth()+1)+""+today.getHours()+""+today.getMinutes()+""+today.getSeconds()+""+today.getMilliseconds();
							mainBody=todayStr+rand;
							$("#mainBody").val(mainBody+".doc");
							$("#mainBodyNum").val(mainBody);
						}else{
							mainBody=$("#mainBodyNum").val();
							
						}
						
						$('#file-tabs').tabs('add',{
							title: '正文',
							content: '<iframe src="document/selectWord?oper=new&flag=1&mainBody='+mainBody+'&docName='+node.attributes.docName+'" style="width:100%; height:900px"></iframe>',
							closable: true,
							iconCls:'icon-main-body'
						});
					}
				}else if(data.result=='notLogin'){
					alert("请先登录！");
					window.parent.parent.parent.location.href='user/login.html';
				}
			
			}
		
		});
		
		
		
	}
}

/* 		function getTypeSelected(source,targetId,targetText){
			var node = $('#typeTree').tree('getSelected');
			if (node){
				var text = node.text;
				var id = node.id;
				//alert(id);
				//赋值
				$("#docTypeId").val(id);
				$("#docTypeName").val(text);
				//关闭dialog
				$('#file-type').dialog('close');
			}
		} */
//加载主题词
var isLoadSubjectTerm;
function loadSubjectTerm(){
	$("#subjectTermTree").tree({
		url : "subjectTerm/findAll",//请求路径，id为根节点的id
		onLoadSuccess : function(node, data) {
			isLoadSubjectTerm=true;
			var tree = $(this);
			if (data) {
				$(data).each(function(index, d) {
					if (this.state == "closed") {
						tree.tree("expandAll");
					}
				});
			}
		}
	});
}
//加载文档类型
function loadTypeTree(){
	$("#typeTree").tree({
		url : "documentType/findAll?param="+$.trim($("#searchType").val()),//请求路径，id为根节点的id
		onLoadSuccess : function(node, data) {
			var tree = $(this);
			if (data) {
				$(data).each(function(index, d) {
					if (this.state == "closed") {
						tree.tree("expandAll");
					}
				});
			}
		}
	});
}

var isLoadAuditorTree;//是否已加载审核人的tree
//加载审核人
function loadAuditorTree(){
	$("#auditorTree").tree({
		url : "user/findAuditor",//请求路径，id为根节点的id
		onLoadSuccess : function(node, data) {
			isLoadAuditorTree=true;
			var tree = $(this);
			if (data) {
				$(data).each(function(index, d) {
					if (this.state == "closed") {
						tree.tree("expandAll");
					}
				});
			}
		}
	});
}
var isLoadPublishRange;
var isLoadApprover;//是否加载approver批准人

var isLoadJointTrialTree;//是否已加载 会审的tree
//加载会审
function jointTrialTree(){
	////loadTree($("#joint_trial_tree"),"user/findAuditor");
	$("#joint_trial_tree").tree({
		url : "user/findAuditor",//请求路径，id为根节点的id
		onLoadSuccess : function(node, data) {
			isLoadJointTrialTree=true;
			var tree = $(this);
			if (data) {
				$(data).each(function(index, d) {
					if (this.state == "closed") {
						tree.tree("expandAll");
					}
				});
			}
		}
	});
}
//公共的方法
function loadTree(treeUl,url,isLoad){
	if(!isLoad){
		treeUl.tree({
			url : url,//请求路径，id为根节点的id  
			onLoadSuccess : function(node, data) {
				var tree = $(this);
				if (data) {
					$(data).each(function(index, d) {
						if (this.state == "closed") {
							tree.tree("expandAll");
						}
					});
				}
				
			}
		});
		return true;
	}
	
}

function selectCheckBox(treeUlSelect,select,textarea){
	$(treeUlSelect).tree({
		//选中时
		onCheck:function(node, checked){
			//alert(node.id+"---"+checked);
			if(node.attributes.isParent){
				alert("请选择子项！");
				return;
			}
			if(checked){
				var separate="";
				if(select.get(0).length>0){
					separate="/";
				}
				select.append($("<option value="+node.id+" selected='selected'>"+node.text+"</option>"));
				textarea.val(textarea.val()+separate+node.text);
			}else{
				$(treeUlSelect+" option[value="+node.id+"]").remove();
				var val=textarea.val();
				if(val.indexOf(node.text)==0){
					if(val.length==node.text.length){
						val=val.replace(node.text,"");
					}else{
						val=val.replace(node.text+"/","");
					}
				}else{
					val=val.replace("/"+node.text,"");
				}
				textarea.val(val);
			}
		}
	});
}

$(function(){
	$(".file-input").css("width","198px");
	
	//文档类型
	$("#typeBtnLoad").click(function(){
		$("#file-type").dialog("open");
		//loadTypeTree();
		
		loadTree($("#typeTree"),"documentType/findAll?param="+$.trim($("#searchType").val()));
	});
	//主题词
	$("#subjectTermBtnLoad").click(function(){
		$("#subject-term").dialog("open");
		if(!isLoadSubjectTerm){
			loadSubjectTerm();
		}
		//loadTree($("#subjectTermTree"),"subjectTerm/findAll");
	});
	//审核 人
	$("#auditorBtnLoad").click(function(){
		$("#auditor-dlg").dialog("open");
		//如果没有加载，则加载，加载一次后不再加载
		if(!isLoadAuditorTree){
			loadAuditorTree();
		}
		//loadTree($("#auditorTree"),"user/findAuditor");
	});
	
	//会审
	$("#joint_trialBtnLoad").click(function(){
		$("#joint_trial-dlg").dialog("open");
		//alert(jointTrialJson);
		//loadTree($("#joint_trial_tree"),"user/findAuditor");
		if(!isLoadJointTrialTree){
			jointTrialTree();
		}
	});
	//分发范围  
	$("#publish_rangeBtnLoad").click(function(){
		$("#publish_range-dlg").dialog("open");
		//alert(jointTrialJson);
		//loadTree($("#joint_trial_tree"),"user/findAuditor");
		if(!isLoadPublishRange){
			isLoadPublishRange=loadTree($("#publish_range_tree"),"user/findAuditor",false);
		}
	});
	
	//批准人
	$("#approverBtnLoad").click(function(){
		$("#approver-dlg").dialog("open");
		if(!isLoadApprover){
			isLoadApprover=loadTree($("#approver_tree"),"user/findAuditor",false);
		}
	});
	
	//选中会选
	$("#joint_trial_tree").tree({
		//选中时
		onCheck:function(node, checked){
			//alert(node.id+"---"+checked);
			if(checked){
				var separate="";
				if($("#joint_trial_select").get(0).length>0){
					separate="/";
				}
				$("#joint_trial_select").append($("<option value="+node.id+" selected='selected'>"+node.text+"</option>"));
				$("#joint_trial_name").val($("#joint_trial_name").val()+separate+node.text);
			}else{
				$("#joint_trial_select option[value="+node.id+"]").remove();
				var val=$("#joint_trial_name").val();
				if($("#joint_trial_name").val().indexOf(node.text)==0){
					if(val.length==node.text.length){
						val=val.replace(node.text,"");
					}else{
						val=val.replace(node.text+"/","");
					}
				}else{
					val=val.replace("/"+node.text,"");
				}
				$("#joint_trial_name").val(val);
			}
		}
	});
	
	$("#publish_range_tree").tree({
		onCheck:function(node, checked){
			if(checked){
				var separate="";
				if($("#publish_range_select").get(0).length>0){
					separate="/";
				}
				$("#publish_range_select").append($("<option value="+node.id+" selected='selected'>"+node.text+"</option>"));
				$("#publish_range_name").val($("#publish_range_name").val()+separate+node.text);
			}else{
				$("#publish_range_select option[value="+node.id+"]").remove();
				var val=$("#publish_range_name").val();
				if(val.indexOf(node.text)==0){
					if(val.length==node.text.length){
						val=val.replace(node.text,"");
					}else{
						val=val.replace(node.text+"/","");
					}
				}else{
					val=val.replace("/"+node.text,"");
				}
				$("#publish_range_name").val(val);
			}
		}
	
	});
	
	$("#search-filetype").click(function(){
		loadTree($("#typeTree"),"documentType/findAll?param="+$.trim($("#searchType").val()));
	});

	$("#creationDate").datebox();
	/*$('#cc').calendar({
	    current:new Date()
	});*/
	/*var date =new Date();
	var year=date.getFullYear();
	var month=date.getMonth();
	var today=date.getDate();*/
	
	//$("#creationDate").datebox("setValue",(month+1)+"/"+today+"/"+year);
	//initDocSource();
	//$("#frmTb tr:even").css("background-color","#E9F2FB");
})


//初始化文档来源   指公司？
/*function initDocSource(){
	$.ajax({
		url:"company/findAll4Select",
		type:"get",
		dataType:"json",
		success:function(list){
			var $docSource=$("#docSource");
			for(var i =0;i<list.length;i++){
				$docSource.append("<option value='"+list[i].id+"'>"+list[i].text+"</option>");
			}
		}
		
		
	});
	
	
}*/

		
	