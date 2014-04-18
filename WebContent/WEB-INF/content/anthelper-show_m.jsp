<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
	name="viewport" />
<title>ant setting</title>
<link href="${pageContext.request.contextPath}/themes/gray/easyui.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/themes/icon.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/demo.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/custom.css"
	type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>


</head>



<body>

	<div class="easyui-layout" style="width: 100%; height: 700px;">
		<div data-options="region:'south'" style="width: 100%; height: 50px;">
			<div style="margin: 15px 0;"></div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="setValues()">OK </a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="window.close()">Close </a>
		</div>
		<div data-options="region:'center',title:'setting'">
			<div style="margin: 2px 0;"></div>
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'west',split:true,border:false"
					style="width: 150px">
					<div class="easyui-layout" data-options="fit:true">

						<div data-options="region:'center',title:'xml'">
							<ul id="xmltree" class="easyui-tree"
								data-options="method:'get',animate:true,checkbox:true">


							</ul>
						</div>

					</div>


				</div>

				<div class="left" data-options="region:'center',border:false"
					style="width: 100px">
					<div class="easyui-layout" data-options="fit:true">
						<div id="target_trash"
							data-options="region:'north',title:'trash',collapsible:false"
							style="width: 100%; height: 100px;"></div>
						<div id="targets" data-options="region:'center',title:'targets'">
							

						</div>
					</div>



				</div>

				<div data-options="region:'east',split:true,border:false"
					style="width: 720px">

					<div id="src_keyvalue" class="easyui-tabs"
						style="width: 710px; height: 600px">

						<div title="key&values" style="padding: 10px"
							class="easyui-droppable targetarea"
							data-options="
                    accept: '.item',
                    
                    onDrop: function(e,source){
                    
                    	var t=$('#xmltree').tree('getSelected');
                    	var m=t.attributes[$(source).html()].keyvalues;
                    	var d=changetoDatagriddata(m);
                      $('#kvtb').datagrid('loadData',d);
                      
                     
                    	
                    	
                        $('#codearea').text(t.attributes[$(source).html()].src);
                    }
                ">

							<table id="kvtb" class="easyui-datagrid"
								style="width: 680px; height: 500px"
								data-options="singleSelect:true,collapsible:false">
								<thead>
									<tr>
										<th data-options="field:'key',width:80">key</th>
										<th data-options="field:'value',width:600">value</th>

									</tr>
								</thead>
							</table>
						</div>

						<div id="codearea" title="code" style="padding: 10px"
							class="easyui-droppable targetarea"
							data-options="
                    accept: '.item',
                    
                    onDrop: function(e,source){
                    
                    	var t=$('#xmltree').tree('getSelected');
                    	
                    	
                        $(this).text(t.attributes[$(source).html()].src);
                    }
                ">

						</div>


					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		var test=<s:property value="result" escape="false"/>;
	//	var test={'build.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build1.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build2.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build3.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build4.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build5.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build6.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build7.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}},'build8.xml':{'echo':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'help':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-scp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'init-contrib':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'build':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-nodownload':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-norcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-shiphome':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'download-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip-sites':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'unzip':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-rcu':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'install-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'check-port-availabe':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'config-domain':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'clean':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcp':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wcc':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}},'uninstall-wls':{'src':'a','keyvalues' : { 'dir.shiphome' : 'basedir/2shiphome1', 'dir.logs' : 'dir.shiphome/logs'}}}};
		//datajson=test;
		var datajson = {
			"build.xml" : {
				"int" : {
					"src" : '<target name="init" description="Inital build environment e.g. directory,dependency libs" depends="init-scp,init-contrib">'
							+ '<mkdir dir="${dir.shiphome}" />'
							+ '<mkdir dir="${dir.logs}" />'
							+ '<mkdir dir="${middlewarehome}" />' + '</target>',
					"keyvalues" : {
						"dir.shiphome" : "\$\{basedir\}/2shiphome1",
						"dir.logs" : "\$\{dir.shiphome\}/logs"
					}
				},
				'check-scp' : {
					"src" : '<target name="check-scp">'
							+ '<condition property="scp.notfound">' + '<not>'
							+ '<typefound name="scp"/>' + ' </not>'
							+ '</condition>' + '</target>',
					"keyvalues" : {
						"dir.shiphome" : "\$\{basedir\}/shiphome"
					}
				}

			},
			"build2.xml" : {
				"int2" : {
					"src" : '<target name="init2" description="Inital build environment e.g. directory,dependency libs" depends="init-scp,init-contrib">'
							+ '<mkdir dir="${dir.shiphome}" />'
							+ '<mkdir dir="${dir.logs}" />'
							+ '<mkdir dir="${middlewarehome}" />' + '</target>',
					"keyvalues" : {
						"dir.shiphome" : "\$\{basedir\}/shiphome1",
						"dir.logs" : "\$\{dir.shiphome\}/logs"
					}
				},
				'check-scp' : {
					"src" : '<target name="check-scp">'
							+ '<condition property="scp.notfound">' + '<not>'
							+ '<typefound name="scp"/>' + ' </not>'
							+ '</condition>' + '</target>',
					"keyvalues" : {
						"dir.shiphome" : "\$\{basedir\}/shiphome"
					}
				}

			}
		};

		function changetoDatagriddata(dt) {
			var res = [];
			$.each(dt, function(k, v) {
				var tp = {};
				tp.key = k;
				tp.value = v;
				//alert(k+v);
				res.push(tp);

			});
			return res;
		}
		function changetoTreeData(dt) {
			var res = [];
			var id=0;
			$.each(dt, function(k, v) {
				var tp = {};
				tp.id=id;
				tp.text = k;
				tp.attributes = v;
				id++;
				//tp.checked=false;
				res.push(tp);
				//	$('#xmltree').attr("data","");
			});
			
			return res;
		}

		var indicator = $('<div class="indicator">>></div>').appendTo('body');
		function settDragDropable() {
			$('.item').draggable({
				revert : true,
				proxy : 'clone',
				deltaX : 0,
				deltaY : 0

			}).droppable({
				onDragOver : function(e, source) {
					indicator.css({
						display : 'block',
						left : $(this).offset().left - 10,
						top : $(this).offset().top + $(this).outerHeight() - 5
					});
				},
				onDragLeave : function(e, source) {
					indicator.hide();
				},
				onDrop : function(e, source) {
					$(source).insertAfter(this);
					indicator.hide();
				}
			});

			$('#target_trash')
					.droppable(
							{
								accept : '.item',
								onDragEnter : function(e, source) {
									$(source).draggable('options').cursor = 'auto';
									$(source).draggable('proxy').css('border',
											'1px solid red');
									$(this).addClass('over');
								},
								onDragLeave : function(e, source) {
									$(source).draggable('options').cursor = 'not-allowed';
									$(source).draggable('proxy').css('border',
											'1px solid #ccc');
									$(this).removeClass('over');
								},
								onDrop : function(e, source) {

									$(this).append(source);

									$(this).removeClass('over');

								}
							});

		}
		function showtarget(targets) {
			$('#targets').html("");
			$.each(targets, function(k, v) {
				//$('#targets').append('<div class="item easyui-panel easyui-tooltip" title="drag me" ><ul><li><a onclick="alert(0)">xxx</a><span>' + k + '</span></li></div>');
				//$('#targets').append('<div class="item easyui-panel easyui-tooltip" title="drag me" ><ul style="list-style-type: none;"><li style="text-align:left,width:100%"><img src="${pageContext.request.contextPath}/themes/icons/back.png" style="float:left"/><span>' + k + '</span></li></div>');
				
				$('#targets').append('<div class="item easyui-panel easyui-tooltip" title="drag me" >' + k + '</div>');
				
			});
			settDragDropable();
			$('#target_trash').html("");
		}

		$(function() {

			$('#xmltree').tree({
				checkbox : false
			});
			$('#xmltree').tree('loadData', changetoTreeData(test));
			$('#xmltree').tree({
				onClick : function(node) {

					showtarget(node.attributes)

				}
			});

			settDragDropable();

		});
	
		function setValues() {
			alert(Sizzle('#targets:nth-child(1)').length)
			var buildfile = $('#xmltree').tree('getSelected');
			var targets="";
			if (buildfile == null) {
				$.messager.alert('ERROR', 'No build xml file selected!',
						'error');
			} else if ($('#targets').html() == "") {
				$.messager.alert('ERROR', 'No target selected!', 'error');
			} else {
				
				$.each($('#targets').children(".item"), function(i, e) {
					if(i==0){
						targets=$(e).html();
					}else{
						targets=targets+" "+$(e).html();
					}
					
				});
				
				var a = window.opener.document.getElementsByName("_.targets")[0];
				
				var b = window.opener.document.getElementsByName("_.buildFile")[0];
				
				//var c = window.opener.document.getElementsByName("_.properties")[0];
				
				$(a).val(targets);
				$(b).val(buildfile.text);
				
				
				window.close();

			}

			

		}
	</script>




</body>