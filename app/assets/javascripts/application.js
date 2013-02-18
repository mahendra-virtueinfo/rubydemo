// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor-jquery
//= require_tree .

$(function() {
  $("#products th a, #products .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#products_search input").keyup(function() {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
    return false;
  });
});


function remove_fields(link, hidden_id, remove_id) {
  var new_id = parseInt(jQuery('#'+hidden_id).val());
  jQuery('#'+ hidden_id).val(new_id - 1);
  $("#"+remove_id).remove();
}

function add_fields(link, div_id, association, content, hidden_id) {
  var new_id = parseInt(jQuery('#'+hidden_id).val());
  var regexp = new RegExp("new_" + association, "g")
  $("#"+div_id).append(content.replace(regexp, new_id));
  jQuery('#'+ hidden_id).val(new_id + 1);
}
