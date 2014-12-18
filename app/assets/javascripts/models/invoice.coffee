class App.Invoice extends App.Base

  @route = "/invoices"
  @set_class_name("Invoice")
  @has_many("line_items")

  @all: ->

    $.ajax
      type: "get"
      url: @route + ".json"
      dataType: "json"
      success: (data, textStatus, xhr) =>
        console.log "success"
        console.log data
      error: (xhr) =>
        console.log "error"
        console.log xhr


