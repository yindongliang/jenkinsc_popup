$(function() {

	$('.left .item').draggable({
		revert : true,
		proxy : 'clone'
		
		
	});
	
	
	
	$('.right td.drop').droppable({
		onDragEnter : function() {
			$(this).addClass('over');
		},
		onDragLeave : function() {
			$(this).removeClass('over');
		},
		onDrop : function(e, source) {
			$(this).removeClass('over');
			if ($(source).hasClass('assigned')) {
				$(this).append(source);
			} else {
				var c = $(source).clone().addClass('assigned');
				$(this).empty().append(c);
				c.draggable({
					revert : true
				});
			}
		}
	});
	$('.left').droppable({
		accept : '.assigned',
		onDragEnter : function(e, source) {
			$(source).addClass('trash');
		},
		onDragLeave : function(e, source) {
			$(source).removeClass('trash');
		},
		onDrop : function(e, source) {
			$(source).remove();
		}
	});
	$('#dlg').dialog('close');
	$('#dlg2').dialog('close');

});

function showGroup() {
	$('#pg').propertygrid({
		showGroup : true
	});
}
function hideGroup() {
	$('#pg').propertygrid({
		showGroup : false
	});
}
function showHeader() {
	$('#pg').propertygrid({
		showHeader : true
	});
}
function hideHeader() {
	$('#pg').propertygrid({
		showHeader : false
	});
}
function getChanges() {
	var s = '';
	var rows = $('#pg').propertygrid('getChanges');
	for (var i = 0; i < rows.length; i++) {
		s += rows[i].name + ':' + rows[i].value + ',';
	}
	
};
function setOpener() {

	
	var a = window.opener.document.getElementsByName("_.targets")[0];
	
	var b = window.opener.document.getElementsByName("_.buildFile")[0];
	
	var c = window.opener.document.getElementsByName("_.properties")[0];
	
	$(a).val("init");
	$(b).val("build.xml");
	$(c).val("test=aaa");
	window.close();
	//b.children("[name=_.properties]");

}


