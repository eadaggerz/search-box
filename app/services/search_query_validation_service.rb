# frozen_string_literal: true

# It checks if a search is valid or not
class SearchQueryValidationService
  def initialize
    @query_format = RegexGeneratorService.new.run
  end

  def valid?(search_query)
    search_query.downcase.match(@query_format).present?
  end
end
