class Article < ApplicationRecord
    belongs_to :source

    validates_presence_of :title, :url
    validates :url, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/, message: 'must be in valid website format starting with either www or http(s)://' }

    scope :old_articles, lambda { where('pub_date < ?', 2.days.ago) }
end
