# frozen_string_literal: true

require 'news_crawler'

RSpec.describe NewsCrawler do
  describe '#fetch_news' do
    before do
      VCR.use_cassette('Fetch news') do
        @result = described_class.fetch_news
      end
    end

    it 'returns a news collection object' do
      expect(@result).to be_a(NewsCollection)
    end

    it 'fetches the first 30 entries' do
      expect(@result.news.count).to eq(30)
    end

    it 'correctly sets entries attributes' do
      news_entry = @result.news.first

      expect(news_entry.title).to eq('UEFI, BIOS, and other confusing x86 PC (firmware) terms')
      expect(news_entry.n_order).to eq(1)
      expect(news_entry.n_comments).to be_nil
      expect(news_entry.points).to eq(3)
    end
  end
end
