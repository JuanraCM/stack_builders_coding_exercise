# frozen_string_literal: true

require 'net/http'
require 'nokogiri'

require_relative 'news_collection'

# Static module that crawls and returns the first 30 entries of the site
#
module NewsCrawler
  SITE_URL = 'https://news.ycombinator.com/'

  class << self
    # Fetches and crawls the first 30 entries
    #
    # @returns [NewsCollection]
    def fetch_news
      document   = Nokogiri::HTML(Net::HTTP.get(URI(SITE_URL)))
      collection = NewsCollection.new

      for_each_entry(document) do |title, n_order, n_comments, points|
        collection.insert(title, n_order, n_comments, points)
      end

      collection
    end

    private

    # Iterates through every node and extracts the necessary data for each one
    # @param document [Nokogiri::HTML:Document] Source HTML document parsed by Nokogiri
    # @yield [title, n_order, n_comments, points] Gives the clean data for each entry
    def for_each_entry(document)
      document.css('tr.athing, td.subtext').each_slice(2) do |entry_nodes|
        title_node, subtext_node = entry_nodes

        title      = title_node.css('td.title span.titleline > a').text
        n_order    = clean_integer(title_node.css('td.title span.rank').text)
        n_comments = clean_integer(subtext_node.css('span.subline > a:last-child').text)
        points     = clean_integer(subtext_node.css('span.score').text)

        yield title, n_order, n_comments, points
      end
    end

    # Helper method for cleaning integer like fields
    # It will return nil if the text is nil or does not have a valid numeric value
    #
    # @returns [Integer, NilClass]
    def clean_integer(text)
      Integer(text[/\d+/], exception: false)
    end
  end
end
