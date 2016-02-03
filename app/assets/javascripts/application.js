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
//= require jQuery-2.1.4.min
//= require bootstrap
//= require datepicker
//= require jquery.tablesorter.min
//= require jquery.slimscroll
//= require admin-lte
//= require jquery_ujs 
//= require depends_on.js
//= require_self
//= require_tree .

$(document).ready(function() {
  if($(".mainbar").length > 0)
  {
    $("#menu-togle").click(function () {
      $('body').toggleClass('menu-on');
      if($('body').hasClass('menu-on')){
        document.cookie = 1;
        $("#menu-togle").find('i').removeClass('fa-bars').addClass('fa-times');
      } else {
        document.cookie = 0;
        $("#menu-togle").find('i').removeClass('fa-times').addClass('fa-bars');
      }
    });
  
    if(document.cookie == 1 && $(window).width() > 720) {
      $('body').addClass('menu-on');
      $("#menu-togle").find('i').removeClass('fa-bars').addClass('fa-times');
    }
  }
  
  $('input[type!=hidden]').first().focus();

  var tabindex = 1;
  
  $('input[type!=hidden],select').each(function() {
     if (this.type != "hidden") {
       var $input = $(this);
       $input.attr("tabindex", tabindex);
       tabindex++;
     }
  });


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


  $("table.sort").tablesorter({sortList: [[0,0]]});

    var add_fields = function (link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
  }

  $(document).on("click", "a.link_to_add_fields", function(e){
        e.preventDefault();
        var link = $(this);
        var association = $(this).data("association");
        var content = $(this).data("content");
        add_fields(link, association, content);
  });

  function remove_fields(link) {
        $(link).previous("input[type=hidden]").value = "1";
        $(link).up(".fields").hide();
  }

    try { $('input.tag-input-field').tagsinput(); $('.bootstrap-tagsinput input[size=8]').typeahead({source: $('.tag-input-field').data('source')});}
  catch(err) { }

  $('.edit-tags').click(editTags);

  $('#entities').click(function(){ $("#search-form").slideUp( "slow", function() {}); })

  $('.tag-link').mousedown(function(e){
    document.oncontextmenu = function() {return false;};
    if( e.button == 2 ) {
      editTag(this);
      return false;
    } else {
      var tag = $(this).text();
      if ( tags.indexOf(tag) > -1 ) tags.splice(tags.indexOf(tag), 1);
      else tags.push(tag);
      updateTags();
      return false;
    }
  });

  $("table.sort").tablesorter( {sortList: [[0,0]]} );

  $('.tag-link').click(function(){return false;});

  $('textarea').autosize();

  $('.autocomplete').typeahead({source: $('.autocomplete').data('source')});

  $('.steps-color-change').click(function() { changeStepsColor(this); return false; })

});

var tags = [];

function editTags(){
  var path = $(this).data('path');
  var tags = $(this).data('tags');
  var model = $(this).data('model');

  var modal = '<div id="tags-modal" class="modal fade">\
    <div class="modal-dialog">\
      <div class="modal-content">\
        <div class="modal-header">\
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button\
          <h4 class="modal-title">Edit Tags</h4>\
        </div>\
        <div class="modal-body">\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="target_Tags">Tags</label>\
            <div class="col-sm-10"><input type="text" value="'+ tags +'" data-role="tagsinput" placeholder="Add tags" style="display: none;" class="form-control tag-input-field"></div>\
          </div>\
        </div>\
        <div class="modal-footer">\
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>\
          <button type="button" class="btn btn-primary">Save changes</button>\
        </div>\
      </div><!-- /.modal-content -->\
    </div><!-- /.modal-dialog -->\
  </div><!-- /.modal -->';

  $('body').append(modal);
  $('#tags-modal').modal();

  $('#tags-modal').on('hidden.bs.modal', function () {
      $(this).data('bs.modal', null);
      $('#tags-modal').remove();
  });

  $('#tags-modal input.tag-input-field').tagsinput();

  $('#tags-modal').on('shown.bs.modal', function () {
    $('#tags-modal input.tag-input-field').focus();
    $('.bootstrap-tagsinput input[size=8]').autocomplete({source: $('.tags-cloud').data('source')});
  });

  $('#tags-modal .btn-primary').click(function(){
    $('#tags-modal').modal('hide');

    var data = {};
    data[model] = {tag_names: $('#tags-modal .tag-input-field').val()};
    data['_method'] = 'put';

    $.ajax({ type: "PUT", dataType: "JSON", url: path, contentType: 'application/json', data: JSON.stringify(data) }).done(function( msg ) {
      $('#pjax-container').load( window.location.pathname + '?_pjax=1', function() {
        ready();
        $('#title').remove();
      });
    });

  });
}

function editTag(tag_link){
  var tag = $(tag_link).text();
  var path = $(tag_link).data('path');
  var color_code = $(tag_link).data('color');

  var modal = '<div id="tags-modal" class="modal fade">\
    <div class="modal-dialog">\
      <div class="modal-content">\
        <div class="modal-header">\
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button\
          <h4 class="modal-title">Edit '+ tag +'</h4>\
        </div>\
        <div class="modal-body">\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="target_Tags">Color</label>\
            <div class="col-sm-10">\
              <input id="color_code" type="text" class="form-control colorpicker" style="border:none;color:#FFF;background-color:'+ color_code +'" >\
            </div>\
          </div>\
        </div>\
        <div class="modal-footer">\
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>\
          <button type="button" class="btn btn-primary">Save changes</button>\
        </div>\
      </div><!-- /.modal-content -->\
    </div><!-- /.modal-dialog -->\
  </div><!-- /.modal -->';

  $('body').append(modal);
  $('#tags-modal').modal();

  $('#tags-modal').on('hidden.bs.modal', function () {
      $(this).data('bs.modal', null);
      $('#tags-modal').remove();
      $('.colorpicker.dropdown-menu').remove();
      document.oncontextmenu = function() {return true;};
  });

  $('#color_code').val(color_code);

  $('#tags-modal').on('shown.bs.modal', function () {
    $('.colorpicker').focus();
  });

  $('.colorpicker').colorpicker().on('changeColor', function(ev){
    $('.colorpicker').css('background-color', ev.color.toHex());
  });

  $('#tags-modal .btn-primary').click(function(){
    $('#tags-modal').modal('hide');

    var data = { tag:{ color_code: $('#color_code').val() }, _method: 'put' };

    $.ajax({ type: "PUT", dataType: "JSON", url: path, contentType: 'application/json', data: JSON.stringify(data) }).done(function( msg ) {
      $('#pjax-container').load( window.location.pathname + '?_pjax=1', function() {
        ready();
        $('#title').remove();
      });
    });

  });
}

function changeStepsColor(action_link){
  var path = $(action_link).data('path');
  var steps_array = $('input[name=selected_steps]:checked').map(function() { return this.value; });

  var modal = '<div id="steps-coloring-modal" class="modal fade">\
    <div class="modal-dialog">\
      <div class="modal-content">\
        <div class="modal-body">\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="target_Tags">Color</label>\
            <div class="col-sm-10">\
              <input id="color_code" type="text" class="form-control colorpicker" style="border:none;color:#FFF;" >\
            </div>\
          </div>\
        </div>\
        <div class="modal-footer">\
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>\
          <button type="button" class="btn btn-primary">Save changes</button>\
        </div>\
      </div><!-- /.modal-content -->\
    </div><!-- /.modal-dialog -->\
  </div><!-- /.modal -->';

  $('body').append(modal);
  $('#steps-coloring-modal').modal();

  $('#steps-coloring-modal').on('hidden.bs.modal', function () {
      $(this).data('bs.modal', null);
      $('#steps-coloring-modal').remove();
      $('.colorpicker.dropdown-menu').remove();
      document.oncontextmenu = function() {return true;};
  });

  $('#steps-coloring-modal').on('shown.bs.modal', function () {
    $('.colorpicker').focus();
  });

  $('.colorpicker').colorpicker().on('changeColor', function(ev){
    $('.colorpicker').css('background-color', ev.color.toHex());
  });

  $('#steps-coloring-modal .btn-primary').click(function(){
    $('#steps-coloring-modal').modal('hide');

    var data = { steps_ids: steps_array.get(), color_code: $('#color_code').val(), _method: 'post'};

    $.ajax({ type: "POST", dataType: "JSON", url: path, contentType: 'application/json', data: JSON.stringify(data) }).done(function( msg ) {
      $('#pjax-container').load( window.location.pathname + '?_pjax=1', function() {
        ready();
        $('#title').remove();
      });
    });

  });
}

function updateTags() {

  if(tags.length > 0) {
    $('.entity-box').hide();
    $('table tbody tr').hide();
  }
  else {
    $('.entity-box').show();
    $('table tbody tr').show();
  }
  $('.tags-cloud .tags li a.active').removeClass('active');

  $(tags).each(function(){
    tag = this;
    $('.tags-cloud .tags li a:contains("'+ tag +'")').addClass('active');

    $('.entity-box').each(function() {
      var entity = this;
      $(this).find('.entity-tags .tags li a').each(function() {
        if ($(this).text().toLowerCase().indexOf(tag.trim().toLowerCase()) >= 0) $(entity).show();
      });
    });

    $('table tbody tr').each(function() {
      var entity = this;
      $(this).find('.tags li a').each(function() {
        if ($(this).text().toLowerCase().indexOf(tag.trim().toLowerCase()) >= 0) $(entity).show();
      });
    });

  });

  updateGroups();

  return false;
}
