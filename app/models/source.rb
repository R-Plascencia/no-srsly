class Source < ApplicationRecord
    validates_presence_of :name, :website
    validates_uniqueness_of :name, :website
    validates :website, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/, message: 'must be in valid website format starting with either www or http(s)://' }
end
