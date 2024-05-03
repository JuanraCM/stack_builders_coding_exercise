require_relative 'lib/news_crawler'

# Crawl the first 30 entries from https://news.ycombinator.com/. Only care about the title, the number of the order, the number of comments, and points for each entry
news_collection = NewsCrawler.fetch_news

# TODO: Filter entries with more than 5 words in the title by the number of comments first

# TODO: Filter entries with less than or equal to 5 words in the title ordered by points
