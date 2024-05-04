# frozen_string_literal: true

require_relative 'news_entry'

# Collection of new entries, it has methods to filter them
#
class NewsCollection
  attr_reader :news

  # Initializer method
  # @param news [Array<NewEntry>] ([]) Array of new entries, empty if not passed
  def initialize(news = [])
    @news = news
  end

  # Inserts an entry given the attributes
  # @param title [String] Entry title
  # @param n_order [Integer] Entry order number
  # @param n_comments [Integer] Entry comments number
  # @param points [Integer] Entry points
  def insert(title, n_order, n_comments, points)
    @news << NewsEntry.new(title, n_order, n_comments, points)
  end

  # Filters the new entries with more than 5 words in the title, sorted by comments first
  # New entries with nil comments are treated as 0 comments
  #
  # @returns [NewsCollection] New instance with filtered news
  def filter_by_long_title_and_sort_by_comments
    clone_with_filtered_news do
      @news.select { |new_entry| new_entry.title_word_count > 5 }.sort_by { |new_entry| new_entry.n_comments.to_i }
    end
  end

  # Filters the new entries with less than or equal to 5 words in the title, sorted by points first
  # New entries with nil points are treated as 0 points
  #
  # @returns [NewsCollection] New instance with filtered news
  def filter_by_short_title_and_sort_by_points
    clone_with_filtered_news do
      @news.select { |new_entry| new_entry.title_word_count <= 5 }.sort_by { |new_entry| new_entry.points.to_i }
    end
  end

  # Prints the news to stdout in a readable format
  def pretty_print_news
    @news.each do |new_entry|
      p '---'
      p "Title: #{new_entry.title}"
      p "N Order: #{new_entry.n_order}"
      p "N Comments: #{new_entry.n_comments}"
      p "Points: #{new_entry.points}"
    end

    p '---'
  end

  private

  # Returns a new instance, it allows to set modified news
  # @yieldreturn [Array<NewEntry>] New entries to be passed to the new instance
  def clone_with_filtered_news
    filtered_news = yield

    self.class.new(filtered_news)
  end
end
