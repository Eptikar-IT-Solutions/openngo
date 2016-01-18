var search_timeout;

function bootsearch(){
  $($('#entities').data('fields')).each(function(i, field) {
    var values = [];
    $('.' + field).each(function(){
      values.push($(this).text());
    });
    
    options = getUnique(values);
    
    if ( options.length < values.length ) $('#search-form form').append(selectField(field, options));
    else {
      $('#search-form form').append(stringField(field));
      $('#' + field + '-field').autocomplete({source: options, change: textUpdated});
    }
    
  });
  
  $('#search-form form').append('<button type="submit" class="btn btn-default">Search</button>');
  
  $('#search-form select').change(updateEntities);
  $('#search-form input[type=text]').on('change keypress paste focus textInput input', textUpdated);
  //$('#search-form input[type=text]').change(textUpdated);
  
}

function textUpdated() {
  if(search_timeout) {
    clearTimeout(search_timeout);
    search_timeout = null;
  }
  search_timeout = setTimeout(updateEntities, 500);
}

function updateEntities(){
  $('.entity-box').show();
  $('table tbody tr').show();
  $('#search-form input, #search-form select').each(function(){
    if($(this).val() != '') search($(this).val(), $(this).attr('name'));
  });
  updateGroups();
}

function search(keyword, field) {
  $('.entity-box .' + field).each(function() {
    if ($("[name='"+ field +"']").prop("tagName") == 'SELECT') { if ($(this).text().toLowerCase().trim() != keyword.toLowerCase().trim()) $(this).closest('.entity-box').hide(); }
    else { if ($(this).text().toLowerCase().indexOf(keyword.trim().toLowerCase()) < 0) $(this).closest('.entity-box').hide(); }
  });
  
  $('table tbody tr .' + field).each(function() {
    if ($("[name='"+ field +"']").prop("tagName") == 'SELECT') { if ($(this).text().toLowerCase().trim() != keyword.toLowerCase().trim()) $(this).closest('tr').hide(); }
    else { if ($(this).text().toLowerCase().indexOf(keyword.trim().toLowerCase()) < 0) $(this).closest('tr').hide(); }
  });
}

function updateGroups(){
  $('.group').next('.row').each(function(){
    var count = $(this).find('.entity-box:visible').length;
    if( count > 0)
    {
      $(this).prev('.group').find('.badge').html(count);
      $(this).prev('.group').show();
    }
    else
    {
      $(this).prev('.group').hide();
    }
  });
}

function getUnique(array){
   var u = {}, a = [];
   for(var i = 0, l = array.length; i < l; ++i){
      if(u.hasOwnProperty(array[i])) {
         continue;
      }
      a.push(array[i]);
      u[array[i]] = 1;
   }
   return a;
}

function titleize(string){
  string = string.replace("_", " ");
  var words = string.split(' ')
  var array = []
  for (var i=0; i<words.length; ++i) {
    array.push(words[i].charAt(0).toUpperCase() + words[i].toLowerCase().slice(1))
  }
  return array.join(' ')
}

function stringField(name){
  var title = titleize(name);
  return '<div class="form-group"><label class="sr-only" for="'+ name +'">'+ title +'</label><input id="'+ name +'-field" type="text" class="form-control" name="'+ name +'" placeholder="'+ title +'"></div>';
}

function selectField(name, options){
  var title = titleize(name);
  var html = '<div class="form-group"><label class="sr-only" for="'+ name +'">'+ title +'</label><select class="form-control" name="'+ name +'"><option value="">Select '+ title +'</option>';
  $(options).each(function(){
    html += '<option>'+ this +'</option>'
  });
  return html + '</select></div>';
}