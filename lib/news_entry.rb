# frozen_string_literal: true

# News entry, contains information about the entry
#
class NewsEntry
  attr_reader :title, :n_order, :n_comments, :points

  # Initializer method
  # @param title [String] Entry title
  # @param n_order [Integer] Entry order number
  # @param n_comments [Integer] Entry comments number
  # @param points [Integer] Entry points
  def initialize(title, n_order, n_comments, points)
    @title      = title
    @n_order    = n_order
    @n_comments = n_comments
    @points     = points
  end

  # Memoizes and returns the title word count
  #
  # @returns [Integer]
  def title_word_count
    @title_word_count ||= title.split.count
  end
end
