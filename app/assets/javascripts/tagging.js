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