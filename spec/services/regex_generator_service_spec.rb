require 'rails_helper'

RSpec.describe RegexGeneratorService, type: :service do

  before(:each) do
    @regex_generator_service = RegexGeneratorService.new
  end

  describe "Run" do
    it "should generate final regex" do
      regex = /( |\w)*(?-mix:what|which|whose|who|whom|whose|where|whither|whence|when|how|why|whatsover)( |\w)*(?-mix:am|is|are|was|were|have|has|does|do)( |\w)*\?/

      expect(@regex_generator_service.run.source).to eq(regex.source)
    end
  end

  describe "Generates all words regex string" do
    it "should generate a regex to check all words or space" do
      regex = /( |\w)*/

      expect(@regex_generator_service.all_words_regex_string).to eq(regex.source.to_s)
    end
  end

  describe "Generates regex from master data words" do
    it "should return an empty regex" do
      words_arr = []

      expect(@regex_generator_service.generate_words_regex(words_arr)).to eq(//)
    end

    it "should generate regex for wh words" do
      r = @regex_generator_service.generate_words_regex(MasterData::WhWords.all)

      expect(r).to eq(/what|which|whose|who|whom|whose|where|whither|whence|when|how|why|whatsover/)
    end

    it "should generate regex for auxiliar verbs" do
      r = @regex_generator_service.generate_words_regex(MasterData::AuxiliarVerbs.all)

      expect(r).to eq(/am|is|are|was|were|have|has|does|do/)
    end


  end


end