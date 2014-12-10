class App.LineItemsHelper

  @mark_li_dirty_or_clean: (input) ->
    uuid = $(input).data("k-uuid")
    li = new App.LineItem({uuid: uuid})
    li.assign_attributes_from_page()
    li.mark_dirty_or_clean()
