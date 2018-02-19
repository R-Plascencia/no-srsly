class Article < ApplicationRecord
    belongs_to :source

    validates_presence_of :title, :url
end
