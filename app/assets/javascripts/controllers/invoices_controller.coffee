class this.InvoicesController
  @edit: (args) ->
    App.InvoiceListeners.set()
    App.LineItem.set_template args.template
    $($.parseJSON(args.collection)).each (i, model) ->
      li = new App.LineItem({attrs: model})
      li.append_to_page()

