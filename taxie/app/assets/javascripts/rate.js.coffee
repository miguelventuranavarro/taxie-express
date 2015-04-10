# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#districts_select', (evt) ->
    $.ajax 'update_zones',
      type: 'GET'
      dataType: 'script'
      data: {
        district_id: $("#districts_select option:selected").val()
        
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
$ ->    
  $(document).on 'change', '#districts_select_2', (evt) ->
    $.ajax 'update_zones_2',
      type: 'GET'
      dataType: 'script'
      data: {
        district_id: $("#districts_select_2 option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")



