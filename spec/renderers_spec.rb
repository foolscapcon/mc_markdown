require 'spec_helper'

describe MCMarkdown::Renderers do

  describe "#use" do

    before :each do
      if MCMarkdown::Renderers.send(:instance_variable_defined?, :@_store)
        MCMarkdown::Renderers.send(:remove_instance_variable, :@_store)
      end
    end

    it "creates instances of redcarpet renderers" do
      expect( MCMarkdown::Renderers.use(:base).class ).to eq Redcarpet::Markdown
    end

    it "doesn't recreate instances of initialized renderers" do
      instance = MCMarkdown::Renderers.use(:base)
      expect( MCMarkdown::Renderers.use(:base) ).to eq instance
    end

  end

end

describe MCMarkdown do

  describe "#render" do
    it "renders text" do
      expect( MCMarkdown.render "# Hello World" ).to eq "<h1>Hello World</h1>\n"
    end
  end

end