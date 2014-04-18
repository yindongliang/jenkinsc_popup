<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<div id="dlg2" class="easyui-dialog" title="Choose local data"
		data-options="iconCls:'icon-save',buttons:'#btn2',modal:true"
		style="width: 400px; height: 200px; padding: 10px">

		local data:<select class="easyui-combobox" name="state"
			style="width: 200px;">
			<option value="A1"></option>
			<option value="AL">test20140111</option>
			<option value="AK">test20140114</option>
			<option value="AZ">test20140112</option>
			<option value="AR">test20140113</option>

		</select>
	</div>
	<div id="btn2">
		<a href="#" class="easyui-linkbutton" data-options="plain:true"
			onclick="alert(12)">OK</a> <a href="javascript:void(0)"
			class="easyui-linkbutton">Close</a>
	</div>