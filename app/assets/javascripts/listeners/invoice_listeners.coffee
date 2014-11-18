class App.InvoiceListeners

  @set: ->
    $(document).on "click", ".persist", (evt) ->
      li = new App.LineItem({uuid: $(@).data("adq-uuid")})
      li.assign_attributes_from_page()
      li.set("invoice_id", $(@).data("invoice-id"))
      response = li.save()
      console.log response

    $(document).on "click", ".delete", (evt) ->
      li = new App.LineItem({id: $(@).data("id")})
      li.destroy()
      $(@).parent().parent().remove()

    $(document).on "click", "#new-line-item", (evt) ->
      new App.LineItem($(@).data()).append_to_page()
