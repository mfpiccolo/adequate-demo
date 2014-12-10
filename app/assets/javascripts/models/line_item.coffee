class App.LineItem extends App.Base

  @route = "/line_items"
  @set_class_name("LineItem")

  # kindred override hook
  after_destroy: (data, textStatus, xhr) ->
    $("[data-error][data-k-uuid='" + @uuid + "']").parent().parent().remove()

  mark_dirty_or_clean: =>
    if !@id?
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:red;'></i></div>")
    else if @dirty_from_page()
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:yellow;'></i></div>")
    else
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-check-circle-o' style='color:green;'></i></div>")
