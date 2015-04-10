# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#zones_select', (evt) ->
    $.ajax 'calc_rate',
      type: 'GET'
      dataType: 'script'
      data: {
        zone_o_id: $("#zones_select option:selected").val()
        zone_d_id: $("#zones_select_2 option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error calc rate: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic zones select rate 1 OK!")

  $(document).on 'change', '#zones_select_2', (evt) ->
    $.ajax 'calc_rate',
      type: 'GET'
      dataType: 'script'
      data: {
        zone_o_id: $("#zones_select option:selected").val()
        zone_d_id: $("#zones_select_2 option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error calc rate: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Calc rate OK!")

  
  $(document).on 'click', "input[name='reservation[reservation_type_id]']", (evt) ->                                                                            
    type = $(this).val()
    $(".datetime").hide()
    if type == '2'
      $(".datetime").show() 

    
  $(document).on 'click', "button#submit", (evt) ->  
    $.ajax 'favorite_address_select',
      type: 'GET'
      dataType: 'script'
      data: {
        favaddress_o_id: $("#favaddress_o_select option:selected").val()
        favaddress_d_id: $("#favaddress_d_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        $("#myModal").modal('hide')
        console.log("Fav sel OK!")

    
