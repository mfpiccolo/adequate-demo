require "test_helper"

describe "Kindred Integration", type: :feature, js: true do
  before :each do
    @invoice = Invoice.create
  end

  # adds new line item fills out fields, saves and checks errors and dirty state allong the way
  it "New Line Item" do
    visit "/invoices/#{@invoice.id}/edit"
    page.must_have_content "Editing invoice"
    click_link 'New Line Item'
    page.must_have_content "Save"
    find(".persist")
    find(".persist").click
    page.must_have_content "can't be blank"
    find("input[data-attr='description']").set("Some Description")
    page.all(".error").count.must_equal(3)
    find(".persist").click
    page.all(".error").count.must_equal(2)
    find("input[data-attr='qty']").set("12")
    find(".persist").click
    page.all(".error").count.must_equal(1)
    find("i")["class"].must_equal("fa fa-exclamation-triangle")
    find("i")["style"].must_equal("color:red;")
    find("input[data-attr='price_cents']").set("12")
    find(".persist").click
    page.all(".error").count.must_equal(0)
    find("i")["class"].must_equal("fa fa-check-circle-o")
    find("i")["style"].must_equal("color:green;")
    find("input[data-attr='qty']").set("Not a number")
    find("i")["class"].must_equal("fa fa-exclamation-triangle")
    find("i")["style"].must_equal("color:yellow;")
    find("input[data-attr='description']").value.must_equal 'Some Description'
    find(".persist").click
    page.all(".error").count.must_equal(1)
    find("i")["style"].must_equal("color:yellow;")
    find("input[data-attr='qty']").set("13")
    find(".persist").click
    page.all(".error").count.must_equal(0)
    find("i")["style"].must_equal("color:green;")
  end
end
