// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery-ui

$(function () {
  $('#commune').change(function () {
    commune = $('#commune').val();
    $.ajax({
      type: "GET",
      dataType: "script",
      url: 'delivery_cost',
      data: {
      commune: commune
      },
      complete: function(data, textStatus, jqXHR){
        if((data === undefined) || (data.responseText === undefined)) { return; }
        resp = JSON.parse(data.responseText);
        $('#cost_result').text('Costo de despacho a ' + resp.commune + ': ' + resp.cost + ' + IVA');
      }
  });
  });
  $('.title_edit_si').click(function () {
      id = event.target.id
      $.ajax({
      type: "POST",
      dataType: "script",
      url: 'hide',
      data: {
        id: id
      },
    complete: function(data, textStatus, jqXHR){
      debugger;
      result = JSON.parse(data.responseText);
      alert(result.text);
      $('#'+ result.product_id +'.title_edit_si').addClass('red_text');
    }
  });
  });
});