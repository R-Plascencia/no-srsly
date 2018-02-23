class PurgeOldArticlesJob < ApplicationJob
  queue_as :default

  def perform#(*args)
    init_count = Article.count
    Article.old_articles.each do |_article|
      _article.destroy
    end
    finish_count = Article.count

    puts "PURGE COMPLETE: Destroyed #{init_count - finish_count} old articles in DB"

    PurgeOldArticlesJob.set(wait: 2.days).perform_later
  end
end
