$(document).ready ->

  $("#reverse").click ->
    source_currency = $("#source_currency").val()
    target_currency = $("#target_currency").val()
    document.getElementById('source_currency').value = target_currency
    document.getElementById('target_currency').value = source_currency
    getExchange()

  $("#source_currency").change ->
    getExchange()

  $("#target_currency").change ->
    getExchange()
    
  $("#amount").keyup ->
    getExchange()

  $('form').submit ->
    if $('form').attr('action') == '/convert'
      getExchange()

  # ajax call to get exchange by service api
  getExchange = ->
    $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;