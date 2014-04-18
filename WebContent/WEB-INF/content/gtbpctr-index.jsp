<table >
<s:iterator value="set" id="column">
<s:iterator value="column" id="column2">
	<tr>
		<td name="keys"><s:property value="key" /></td>
		<td><input type="text" name="values" size="100" value='<s:property value="value" />'/></td>
		
	</tr>
</s:iterator>
</s:iterator>
</table>