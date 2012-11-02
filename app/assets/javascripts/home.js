$(document).ready(function() {
  load_editors();
});

function load_editors(){
 tinyMCE.init({
	mode : "textareas",
	theme : "advanced",
	plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
	theme_advanced_buttons1 : "formatselect,fontselect,fontsizeselect, |, bold, italic, underline, strikethrough, |, bullist, numlist, blockquote, |, undo, redo, |, link, unlink, code, |, fullscreen",
	theme_advanced_buttons2 : "",
	theme_advanced_buttons3 : "",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : false
  });
}