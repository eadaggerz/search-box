# frozen_string_literal: true

# It generates the regex which is used to determinate if a sentence is valid or not.
class RegexGeneratorService
  def initialize
    # Order of master data records are important here
    @words_arr = [
      MasterData::WhWords.all,
      MasterData::AuxiliarVerbs.all
    ]

    @str = all_words_regex_string
  end

  def run
    @words_arr.each do |words_arr_item|
      @str += generate_words_regex(words_arr_item).to_s
      @str += all_words_regex_string
    end

    question_mark = /\?/

    Regexp.new("#{@str}#{question_mark.source}")
  end

  def generate_words_regex(object)
    words_regex = //

    object.each_with_index do |item, index|
      next if item.nil? || item.word.nil?

      words_regex = if index.zero?
                      Regexp.new(item.word.to_s)
                    else
                      Regexp.new("#{words_regex.source}|#{item.word}")
                    end
    end
    words_regex
  end

  def all_words_regex_string
    regexp = /( |\w)*/
    regexp.source.to_s
  end
end
