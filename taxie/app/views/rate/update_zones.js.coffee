

$("#zones_select").empty().append("<option value=''>Selecciona zona</option><%= escape_javascript(render(:partial => @zones)) %>")
