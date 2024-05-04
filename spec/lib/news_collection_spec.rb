# frozen_string_literal: true

require 'news_collection'

RSpec.describe NewsCollection do
  let!(:entries) do
    [
      NewsEntry.new('Foo Bar Baz', 1, 20, 50),
      NewsEntry.new('A love letter to bicycle maintenance and repair', 2, 15, 20),
      NewsEntry.new('A Clock in the Forest 2', 3, nil, 30),
      NewsEntry.new('The Nature of Code', 4, 5, nil)
    ]
  end

  subject do
    NewsCollection.new(entries)
  end

  describe '#initialize' do
    context 'with entries' do
      it 'has the expected attributes' do
        expect(subject.news).to eq(entries)
      end
    end

    context 'without arguments' do
      let(:another_subject) { NewsCollection.new }

      it 'has the expected attributes' do
        expect(another_subject.news).to eq([])
      end
    end
  end

  describe '#insert' do
    before do
      subject.insert('The Physics of Karate', 15, 1, 5)
    end

    it 'contains the new entry' do
      latest_entry = subject.news.last

      expect(latest_entry.title).to eq('The Physics of Karate')
      expect(latest_entry.n_order).to eq(15)
      expect(latest_entry.n_comments).to eq(1)
      expect(latest_entry.points).to eq(5)
    end
  end

  describe '#filter_by_long_title_and_sort_by_comments' do
    before do
      @filtered_collection = subject.filter_by_long_title_and_sort_by_comments
    end

    it 'filters by title size' do
      titles          = @filtered_collection.news.map(&:title)
      expected_titles = ['A Clock in the Forest 2', 'A love letter to bicycle maintenance and repair']

      expect(titles).to eq(expected_titles)
    end

    it 'sorts by comments' do
      comments          = @filtered_collection.news.map(&:n_comments)
      expected_comments = [nil, 15]

      expect(comments).to eq(expected_comments)
    end
  end

  describe '#filter_by_short_title_and_sort_by_points' do
    before do
      @filtered_collection = subject.filter_by_short_title_and_sort_by_points
    end

    it 'filters by title size' do
      titles          = @filtered_collection.news.map(&:title)
      expected_titles = ['The Nature of Code', 'Foo Bar Baz']

      expect(titles).to eq(expected_titles)
    end

    it 'sorts by points' do
      points          = @filtered_collection.news.map(&:points)
      expected_points = [nil, 50]

      expect(points).to eq(expected_points)
    end
  end

  describe '#pretty_print_news' do
    it 'prints the news in the correct format' do
      expected_output = <<~TEXT
        "---"
        "Title: Foo Bar Baz"
        "N Order: 1"
        "N Comments: 20"
        "Points: 50"
        "---"
        "Title: A love letter to bicycle maintenance and repair"
        "N Order: 2"
        "N Comments: 15"
        "Points: 20"
        "---"
        "Title: A Clock in the Forest 2"
        "N Order: 3"
        "N Comments: "
        "Points: 30"
        "---"
        "Title: The Nature of Code"
        "N Order: 4"
        "N Comments: 5"
        "Points: "
        "---"
      TEXT

      expect { subject.pretty_print_news }.to output(expected_output).to_stdout
    end
  end
end
