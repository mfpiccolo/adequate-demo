class App.LineItem extends App.Base

  @route = "/line_items"

  @save_all: =>
    $.ajax
      type: "PATCH"
      url: @route + "/save_all"
      data:
        line_items: @collection_from_page("line_item")
      success: (data, textStatus, xhr) ->
        console.log data
        console.log textStatus
        console.log xhr
      error: (xhr) ->
        data = JSON.parse(xhr.responseText)

  mark_dirty_or_clean: =>
    if !@id?
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:red;'></i></div>")
    else if @dirty_from_page()
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:yellow;'></i></div>")
    else
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-check-circle-o' style='color:green;'></i></div>")
