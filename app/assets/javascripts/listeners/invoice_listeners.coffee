class App.InvoiceListeners

  @set: ->
    $("#line-item-table").on "click", ".persist", (evt) ->
      li = new App.LineItem({uuid: $(@).data("k-uuid")})
      li.assign_attributes_from_page()
      li.set("invoice_id", $(@).data("invoice-id"))
      li.save()

    $("#line-item-table").on "click", ".delete", (evt) ->
      li = new App.LineItem({id: $(@).data("id")})
      li.destroy()
      $(@).parent().parent().remove()

    $("#new-line-item").click (evt) ->
      new App.LineItem($(@).data()).append_to_page()
