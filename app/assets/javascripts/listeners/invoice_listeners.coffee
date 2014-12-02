class App.InvoiceListeners extends App.Listener

  @set: ->
    $("#line-item-table").on "click.Listeners.LineItem.save", ".persist", (evt) ->
      li = new App.LineItem({uuid: $(@).data("k-uuid")})
      li.assign_attributes_from_page()
      li.set("invoice_id", $(@).data("invoice-id"))
      li.save()
      li.mark_dirty_or_clean()

    $("#line-item-table").on "click.Listeners.LineItem.delete", ".delete", (evt) ->
      li = new App.LineItem({id: $(@).data("id"), uuid: $(@).data("k-uuid")})
      li.destroy()
      $(@).parent().parent().remove()

    $("#line-item-buttons").on "click.Listeners.LineItem.new_li", "#new-line-item", (evt) ->
      li = new App.LineItem($(@).data())
      li.append_to_page()
      li.mark_dirty_or_clean()

    $("#line-item-table").on "keyup.Listeners.LineItem.dirty", "input[data-k-uuid]", (evt) ->
      uuid = $(@).data("k-uuid")
      li = new App.LineItem({uuid: uuid})
      li.assign_attributes_from_page()
      li.mark_dirty_or_clean()

    $("#line-item-buttons").on "click.Listeners.LineItem.save_all", "#line-items-save-all", (evt) ->
      App.LineItem.save_all({
        add_data_to_each: =>
          {invoice_id: $(@).data("invoice-id")}
      })

