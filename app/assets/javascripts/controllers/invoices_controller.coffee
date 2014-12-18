class @InvoicesController
  @edit: ->
    jQuery ->
      template_info = App.Template.template_info["line_item"]
      App.LineItem.set_template template_info.template

      App.InvoiceListeners.set()

      $(template_info.collection).each (i, model_attrs) ->
        $.extend(model_attrs, {target_uuid: template_info.target_uuid})
        li = new App.LineItem(model_attrs)
        li.append_to_page()
