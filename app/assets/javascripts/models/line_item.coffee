class App.LineItem extends App.Base

  #override for animation
  handle_errors: (errors_obj, uuid) ->
    if @error?
      hideable_error_inputs = $(Object.keys(@attributes)).not(Object.keys(errors_obj)).get()
      $.each hideable_error_inputs, (i, attr) =>
        $("[data-error][data-attr='" + attr + "'][data-k-uuid='" + @uuid + "']").slideUp(100)

      $.each errors_obj, (attr, messages) =>
        error_tag = $("[data-error][data-attr='" + attr + "'][data-k-uuid='" + @uuid + "']")
        error_tag.html("")

        $.each messages, (i, message) ->
          error_tag.append("<span'>" + message + "</span><br>")


        error_tag.slideDown(100)
    else
      $.each @attributes, (attr, val) =>
        $("[data-error][data-attr='" + attr + "'][data-k-uuid='" + @uuid + "']").slideUp(100)
