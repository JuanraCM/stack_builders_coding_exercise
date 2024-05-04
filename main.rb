require_relative 'lib/news_crawler'

# Crawl the first 30 entries from https://news.ycombinator.com/. Only care about the title, the number of the order, the number of comments, and points for each entry
news_collection = NewsCrawler.fetch_news
p '##################'
p 'First 30 entries:'
p '##################'
p news_collection.news

# Filter entries with more than 5 words in the title by the number of comments first
p '##################'
p 'Entries with more than 5 words in the title sorted by comments:'
p '##################'
p news_collection.filter_by_long_title_and_sort_by_comments.news

# Filter entries with less than or equal to 5 words in the title ordered by points
p '##################'
p 'Entries with less than or equal to 5 words in the title sorted by points:'
p '##################'
p news_collection.filter_by_short_title_and_sort_by_points.news
