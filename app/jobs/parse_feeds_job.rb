class ParseFeedsJob < ApplicationJob
  queue_as :default

  require 'open-uri'
  require 'feedparser'

  def perform#(*args)
    rss_sources.each do |_source, _link|
      txt = open(_link).read

      feed = FeedParser::Parser.parse(txt)

      feed.items.each do |_i|
        next if _i.published < 2.days.ago or Article.exists?(:url => _i.url)
 
        article = Article.new(
          :source_id => Source.search_by_name(_source).first.id,
          :title => _i.title,
          :url => _i.url,
          :pub_date => _i.published,
          :summary => sanitize_html(_i.summary)
        )
        article.top_img = _i.attachments[0].url unless _i.attachments.empty?
        if _i.content.nil?
          article.keywords = get_keywords(sanitize_html(_i.summary))
        else
          article.keywords = get_keywords(sanitize_html(_i.content))
        end

        if not article.save
          puts article.errors.full_messages
          next
        end
      end
    end

    ParseFeedsJob.set(wait:6.hours).perform_later
  end

  private

  def rss_sources
    @rss_sources = { 
      :Reuters_Politics => 'http://feeds.reuters.com/Reuters/PoliticsNews',
      :Reuters_Domestic => 'http://feeds.reuters.com/Reuters/domesticNews',
      :BBC => 'http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml',
      :WSJ => 'http://www.wsj.com/xml/rss/3_7085.xml',
      :FactCheck => 'https://www.factcheck.org/feed/', #skip getting summary for this - there isn't one
      :Politifact => 'http://www.politifact.com/feeds/statements/truth-o-meter/',
      :USA_Today => 'http://rssfeeds.usatoday.com/usatodaycomwashington-topstories&x=1'
    }

    # :AP => 'http://hosted2.ap.org/atom/APDEFAULT/89ae8247abe8493fae24405546e9a1aa',
    # 'The Economist - United States': 'http://www.economist.com/sections/united-states/rss.xml',
    # 'The Economist - Economics': 'http://www.economist.com/sections/economics/rss.xml',
  end

  # Using highscore gem
  def get_keywords(text)
    results = Array.new
    text.keywords.top(7).each do |_k|
      results.push(_k.text)
    end

    return results.join(',')
  end

  def sanitize_html(text)
    return ActionView::Base.full_sanitizer.sanitize(text)
  end
end
