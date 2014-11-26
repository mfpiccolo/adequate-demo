class App.LineItem extends App.Base

  @route = "/line_items"
  @set_class_name_variables("LineItem")

  @save_all: =>
    data = {}
    # TODO fix the naive inflection
    data[@snake_name + "s"] = @collection_from_page(@snake_name)
    $.ajax
      type: "PATCH"
      url: @route + "/save_all"
      data: data

      success: (data, textStatus, xhr) =>
        $(data).each (i, response_object) =>
          attrs = response_object[@snake_name]
          model = new App[@class_name]({uuid: attrs["uuid"]})
          model.assign_attributes(attrs)
          model._clear_errors()
          model._update_data_vals_on_page()
          model.mark_dirty_or_clean()
      error: (xhr) =>
        data = JSON.parse(xhr.responseText)
        $(data).each (i, response_object) =>
          unless $.isEmptyObject(response_object["errors"])
            uuid = response_object[@snake_name].uuid
            model = new App[@class_name](response_object[@snake_name])
            model._handle_errors(response_object["errors"])


  mark_dirty_or_clean: =>
    if !@id?
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:red;'></i></div>")
    else if @dirty_from_page()
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-exclamation-triangle' style='color:yellow;'></i></div>")
    else
      $("[data-k-uuid='" + @uuid + "'][data-dirty]").html("<div data-dirty='' data-k-uuid='" + @uuid + "'><i class='fa fa-check-circle-o' style='color:green;'></i></div>")
