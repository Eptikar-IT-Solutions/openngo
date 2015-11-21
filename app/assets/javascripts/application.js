// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.pjax
//= require datepicker
//= require jquery.tablesorter.min
//= require jquery.tablecloth
//= require_self
//= require_tree .

$( document ).ready(function() {
	
  $('input[type!=hidden]').first().focus();
  
  var tabindex = 1;
    $('input[type!=hidden],select').each(function() {
       if (this.type != "hidden") {
         var $input = $(this);
         $input.attr("tabindex", tabindex);
         tabindex++;
       }
    });
  
	$(document).pjax('a', '#pjax-container');

	$('.pickdate').datepicker({
		format: "yyyy-mm-dd",
		weekStart: 6,
		todayBtn: "linked",
		autoclose: true,
		todayHighlight: true
	});

	$('.goto').click(function(){
		$(this).target = "_blank";
        window.open($(this).prop('href') + '/' + $(this).parent(".input-group-btn").prev().val());
        return false;
	});

	$("table").tablecloth({
	  theme: "default",
	  bordered: false,
	  condensed: false,
	  striped: true,
	  sortable: false,
	  clean: false
	});


	$("table.sort").tablesorter( {sortList: [[0,0]]} );

});

$(window).load(function() {$('#locker').remove();});

$(document).on('pjax:click', function(e) {
	$('body').append('<div id="locker"><div class="loader"><div class="msg"></div><div class="stripe first"></div><div class="stripe second"></div><div class="stripe last"></div></div></div></div>');
});

$(document).on('pjax:complete', function(e) {
	$(document).attr( "title", $("#title").html());
	$('#locker, #title').remove();
});