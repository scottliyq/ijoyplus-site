$(document).ready(function() {
  load_editors();
});

function load_editors(){
	var editor;
	var editor_id = $('textarea').attr('id');
	if(editor_id != null) {
		KindEditor.ready(function(K) {
            editor = K.create('#'+ editor_id, {
                    themeType : 'simple', 
                    items: [
				        'source', '|','formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
				        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'hr', 'link', 'unlink', '|', 'fullscreen'
					],
					uploadJson : '/kindeditor/upload.json'
            });
	    });
	}
}