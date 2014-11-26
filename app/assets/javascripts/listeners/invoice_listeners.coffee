class App.InvoiceListeners

  @set: ->
    $("#line-item-table").on "click", ".persist", (evt) ->
      li = new App.LineItem({uuid: $(@).data("k-uuid")})
      li.assign_attributes_from_page()
      li.set("invoice_id", $(@).data("invoice-id"))
      li.save()
      li.mark_dirty_or_clean()

    $("#line-item-table").on "click", ".delete", (evt) ->
      li = new App.LineItem({id: $(@).data("id")})
      li.destroy()
      $(@).parent().parent().remove()

    $("#new-line-item").click (evt) ->
      li = new App.LineItem($(@).data())
      li.append_to_page()
      li.mark_dirty_or_clean()

    $("#line-item-table").on "keyup", "input[data-k-uuid]", (evt) ->
      uuid = $(@).data("k-uuid")
      li = new App.LineItem({uuid: uuid})
      li.assign_attributes_from_page()
      li.mark_dirty_or_clean()

    $("#line-items-save-all").click (evt) ->
      App.LineItem.save_all({
        add_data_to_each: =>
          {invoice_id: $(@).data("invoice-id")}
      })
