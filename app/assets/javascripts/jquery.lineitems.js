var products_data = false;
var lines_parent_type = 'quote';

$.fn.lineItems = function(url){
  lines_parent_type = $(this).data('model');
  $.getJSON(url,
  function(products){
    products_data = products;
    afterLine();
  });
  
  return true;
}

function afterLine(){
  $('.delete-line').click(function() {
    if(confirm('Are you sure you want to delete this line?'))
    {
      $(this).next("input[type=hidden]").val("1");
      $(this).parent().parent().fadeOut("slow");
      return false;
    }
  });
  
  $('.product-select').change(function(){
    var id = $(this).val();
    setPrice(this, getPrice(id));
    if (hasAttributes(id)) $(this).parent().parent().find('.add-attribute').css('visibility','visible');
    else $(this).parent().parent().find('.add-attribute').css('visibility','hidden');
  });
  
  $('.attributes').change(function(){
    var id = $(this).val();
    var options = getAttributeOptions(id);
    var options_select = $(this).parent().parent().find('.options');
    fillSelect(options_select, options);
    setPrice(options_select, getOptionPrice(options[0].id));
  });
  
  $('.options').change(function(){
    var id = $(this).val();
    setPrice(this, getOptionPrice(id));
  });
}

function fillSelect(select, dataset) {
  $(select).empty();
  for (var i=0; i<dataset.length; i++) {
    $(select).append('<option value="' + dataset[i].id + '">' + dataset[i].name + '</option>');
  }
}

function setPrice(select, price) {
  var price_field = $(select).parent().parent().find('.product-price');
  price_field.val(price);
}

function hasAttributes(id) {
  var hasAttributes = false;
  $.each(products_data, function(i, product) {
      if (parseInt(product.id) == parseInt(id)) {
        hasAttributes = product.product_attributes.length > 0;
        return false;
      }
  });
  return hasAttributes;
}

function getPrice(id){
  var price = 0;
  $.each(products_data, function(i, product) {
      if (parseInt(product.id) == parseInt(id)) {
        price = product.price;
        return false;
      }
  });
  return price;
}

function getProductAttributes(id) {
  var attributes = false;
  $.each(products_data, function(i, product) {
      if (parseInt(product.id) == parseInt(id)) {
        attributes = product.product_attributes;
        return false;
      }
  });
  return attributes;
}

function getAttributeOptions(id) {
  var options = false;
  $.each(products_data, function(i, product) {
    $.each(product.product_attributes, function(i, attribute) {
        if (parseInt(attribute.id) == parseInt(id)) {
          options = attribute.options;
          return false;
        }
    });
    if(options) return false;
  });
  return options;
}

function getOptionPrice(id){
  var price = 0;
  $.each(products_data, function(i, product) {
    $.each(product.product_attributes, function(i, attribute) {
      $.each(attribute.options, function(i, option) {
          if (parseInt(option.id) == parseInt(id)) {
            price = option.price;
            return false;
          }
      });
      if(price != 0) return false;
    });
    if(price != 0) return false;
  });
  return price;
}

function newLine(){
  var line = $('.line-item').length + 1;
  
  $('.line-items').append('<tr class="line-item" id="line-'+ line +'">\
     <td><input class="form-control" name="' + lines_parent_type + '[lines_attributes][' + line + '][name]" type="text"></td>\
    <td><input class="form-control" name="' + lines_parent_type + '[lines_attributes][' + line + '][quantity]" type="number" value="1"></td>\
    <td><input class="form-control product-price" name="' + lines_parent_type + '[lines_attributes][' + line + '][price]" type="number" value="'+ price +'"></td>\
    <td class="hidden-print">\
      <a class="btn btn-default add-attribute" href="javascript:newAttribute(' + line + ', \'line-'+ line +'\')" rel="nofollow" style="visibility:hidden;"><span class="glyphicon glyphicon-plus"></span></a>\
      <a class="btn btn-danger delete-line" href="#" rel="nofollow"><span class="glyphicon glyphicon-remove"></span></a>\
      <input name="' + lines_parent_type + '[lines_attributes][' + line + '][_destroy]" type="hidden" value="false">\
    </td>\
  </tr>');
  
  afterLine();
  
  if(products_data[0].product_attributes && products_data[0].product_attributes.length > 0) $('#line-'+ line + ' .add-attribute').css('visibility','visible');

}

function newAttribute(line, line_id){
  if( $('.line-' + line + '-attribute').length == 0 ) var attribute = 0;
  else var attribute = $('.line-' + line + '-attribute').length + 1;
  
  var html = '<tr class="product_attributes line-' + line + '-attribute">\
    <td>\
      <input name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][line_id]" type="hidden" value="' + line_id + '">\
      <select class="form-control attributes" name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][product_attribute_id]"></select>\
    </td>\
    <td><select class="form-control options" name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][option_id]"></select></td>\
    <td><input class="form-control product-price" name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][price]" type="number"></td>\
    <td><input class="form-control" name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][note]" type="text"></td>\
    <td class="hidden-print">\
      <a class="btn btn-danger delete-line" href="#" rel="nofollow"><span class="glyphicon glyphicon-remove"></span></a>\
      <input id="' + lines_parent_type + '_lines_attributes_0__destroy" name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][_destroy]" type="hidden" value="false">\
    </td>\
  </tr>';
  
  if( attribute == 0 ) $(html).insertAfter('#line-' + line);
  else $(html).insertAfter('.line-' + line + '-attribute:last');
  
  var product_id = $('[name="' + lines_parent_type + '[lines_attributes][' + line + '][product_id]"]').val();
  var attributes = getProductAttributes(product_id);
  var attribute_select = $('[name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][product_attribute_id]"]');
  var options_select = $('[name="' + lines_parent_type + '[lines_attributes][' + line + '][line_attributes_attributes]['+ attribute + '][option_id]"]');
  
  fillSelect(attribute_select, attributes);
  fillSelect(options_select, attributes[0].options);
  setPrice(options_select, getOptionPrice(attributes[0].options[0].id));
  
  afterLine();
}