# frozen_string_literal: true

require_relative 'news_entry'

# Collection of entries, it has methods to filter them
#
class NewsCollection
  attr_reader :news

  # Initializer method
  def initialize
    @news = []
  end

  # Inserts an entry given the attributes
  # @param title [String] Entry title
  # @param n_order [Integer] Entry order number
  # @param n_comments [Integer] Entry comments number
  # @param points [Integer] Entry points
  def insert(title, n_order, n_comments, points)
    @news << NewsEntry.new(title, n_order, n_comments, points)
  end
end
