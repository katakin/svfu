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
//= require select2
//= require select2_locale_ru
//= require_tree .

$.fn.toggleText = function(t1, t2){
  if (this.text() == t1) this.text(t2);
  else                   this.text(t1);
  return this;
};

jQuery(function($) {
  // for work place
  $("#level").change(function() {
    // make a POST call and replace the content
    var level = $('select#level :selected').val();
    if(level === "") level="0";
    jQuery.get('/workspace/update_level_select/' + level, function(data){
        $("#list").html(data);
    })
    return false;
  });
  
  //toggle week parity
  $("a.toggle_pair").on('click', function(e) {
    $(this).toggleText('Четная', 'Нечетная');
    $('div.week1').toggle();
    $('div.week2').toggle();
    e.preventDefault();
  });

})
