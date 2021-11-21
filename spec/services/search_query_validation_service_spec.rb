require 'rails_helper'

RSpec.describe SearchQueryValidationService, type: :service do

  before(:each) do
    @valid_sentences = [
      'What is a good car?',
      'How is emil hajric doing?'
    ]

    @invalid_sentences = [
      'What is',
      'What is a',
      'How is',
      'Howis emil hajric',
    ]

    @sentence_validation_service = SearchQueryValidationService.new
  end

  describe "Validates sentences" do

    it "should return true" do
      @valid_sentences.each do |sentence|
        expect(@sentence_validation_service.valid?(sentence)).to be_truthy
      end
    end

    it "should return false" do
      @invalid_sentences.each do |sentence|
        expect(@sentence_validation_service.valid?(sentence)).to be_falsy
      end
    end
  end
end
