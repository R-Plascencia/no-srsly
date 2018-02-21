class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :source_id, :title, :summary, :top_img, :url, :pub_date, :keywords
  belongs_to :source
end
