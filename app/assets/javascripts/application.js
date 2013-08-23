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
//= require bootstrap
//= require_tree .

jQuery(function($) {
  // for work place
  $("#level").change(function() {
    // make a POST call and replace the content
    var level = $('select#level :selected').val();
    if(level === "") level="0";
    jQuery.get('/workspace/update_level_select/' + level, function(data){
        $("#schedule_table").html(data);
    })
    return false;
  });
  
})
