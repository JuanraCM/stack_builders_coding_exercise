# frozen_string_literal: true

require 'news_entry'

RSpec.describe NewsEntry do
  subject do
    NewsEntry.new('Foo Bar Baz', 1, 20, 50)
  end

  describe '#initialize' do
    it 'has the expected attributes' do
      expect(subject.title).to eq('Foo Bar Baz')
      expect(subject.n_order).to eq(1)
      expect(subject.n_comments).to eq(20)
      expect(subject.points).to eq(50)
    end
  end

  describe '#title_word_count' do
    it 'returns the expected word count' do
      expect(subject.title_word_count).to eq(3)
    end

    it 'memoizes the result' do
      subject.instance_variable_set(:@title_word_count, 5)
      expect(subject.title_word_count).to eq(5)
    end
  end
end
