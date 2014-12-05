class this.InvoicesController
  @edit: ->
    jQuery ->
      template_info = App.Template.template_info["line_item"]
      App.InvoiceListeners.set()
      App.LineItem.set_template template_info.template
      $(template_info.collection).each (i, model) ->
        li = new App.LineItem({attrs: model})
        li.append_to_page()

