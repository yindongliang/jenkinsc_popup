<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<div style="padding: 1px; border: 1px solid #ddd;">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$('#dlg').dialog('open')"
					data-options="plain:true, iconCls:'icon-add'">add </a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$('#dlg2').dialog('open')"
					data-options="plain:true, iconCls:'icon-filter'">local data</a>
			</div>

			<ul class="easyui-tree" data-options="method:'get',animate:true,dnd:true">
				<li><span>weblogic</span>
					<ul>

						<li data-options="iconCls:'icon-back'">init</li>
						<li data-options="iconCls:'icon-back'">install-weblogic</li>
						<li data-options="iconCls:'icon-back'">uninstall-weblogic</li>
					</ul></li>
				<li><span>soa</span>
					<ul>

						<li data-options="iconCls:'icon-back'">init</li>
						<li data-options="iconCls:'icon-back'">install</li>
						<li data-options="iconCls:'icon-back'">uninstall</li>
					</ul></li>

			</ul>