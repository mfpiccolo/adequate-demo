#= require spec_helper

describe 'Line Item instance', ->
  before ->
    @line_item = new App.LineItem()

  describe "without args", ->
    before ->
      @uuid_matcher = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

    it 'should initialize with a uuid', ->
      @line_item.uuid.should.match @uuid_matcher

    it "should set model name to dash case", ->
      @line_item.model_name.should.equal "line-item"

  describe "with uuid passed in", ->
    before ->
      @line_item = new App.LineItem({uuid: "295f1ee2-7328-4319-b232-b07c63c1cf2e"})

    it "should set the uuid", ->
      @line_item.uuid.should.equal "295f1ee2-7328-4319-b232-b07c63c1cf2e"

  describe "get and set", ->
    before ->
      @line_item.set "some_var", "some_val"

    describe "#set", ->
      it "should set the varaible in @attributes", ->
        @line_item.attributes.should.eql {some_var: "some_val"}

    describe "#get", ->
      it "should set the varaible in @attributes", ->
        @line_item.get("some_var").should.equal "some_val"

  # describe "#save", ->
  #   it "should ", ->

