require "test_helper"

describe "Line Item Kindred Integration", type: :feature, js: true do

  before do
    @invoice = Invoice.create
  end
  # adds new line item fills out fields, saves and checks errors and dirty state allong the way
  it "New Line Item" do
    visit "/invoices/#{@invoice.id}/edit"
    page.must_have_content "INVOICE ##{@invoice.id}"
    click_link 'New Line Item'
    page.must_have_content "Save"
    find(".persist").click
    page.must_have_content "can't be blank"
    find("input[data-attr='description']").set("Some Description")
    page.all(".error").count.must_equal(3)
    find(".persist").click
    page.all(".error").count.must_equal(2)
    find("input[data-attr='qty']").set("12")
    find(".persist").click
    page.all(".error").count.must_equal(1)
    find("i")["class"].must_equal("fa fa-exclamation-triangle fa-2x")
    find("i")["style"].must_equal("color:#D24D57;")
    find("input[data-attr='price_cents']").set("12")
    find(".persist").click
    page.all(".error").count.must_equal(0)
    find("i")["class"].must_equal("fa fa-check-circle-o fa-2x")
    find("i")["style"].must_equal("color:#2ECC71;")
    find("input[data-attr='qty']").set("Not a number")
    find("i")["class"].must_equal("fa fa-exclamation-triangle fa-2x")
    find("i")["style"].must_equal("color:#F4D03F;")
    find("input[data-attr='description']").value.must_equal 'Some Description'
    find(".persist").click
    page.all(".error").count.must_equal(1)
    find("i")["style"].must_equal("color:#F4D03F;")
    find("input[data-attr='qty']").set("13")
    find(".persist").click
    page.all(".error").count.must_equal(0)
    find("i")["style"].must_equal("color:#2ECC71;")
  end

  describe "delete" do
    before do
      @line_item = FactoryGirl.create(:line_item, invoice_id: @invoice.id)
    end

    it "deletes the line item" do
      visit "/invoices/#{@invoice.id}/edit"
      @invoice.line_items.count.must_equal 1
      page.find("#line-item-table").must_have_content "Save"
      find(".delete").click
      @invoice.line_items.count.must_equal 0
      page.find("#line-item-table").wont_have_content "Save"
    end
  end

  describe "persist line item" do

    it "saves a line item" do
      visit "/invoices/#{@invoice.id}/edit"
      page.find("#line-item-table").wont_have_content "Save"
      click_link 'New Line Item'
      find("input[data-attr='description']").set("Some Description")
      find("input[data-attr='qty']").set("12")
      find("input[data-attr='price_cents']").set("13")
      find(".persist").click
      visit "/invoices/#{@invoice.id}/edit"
      page.find("#line-item-table").must_have_content "Save"
    end
  end
end
