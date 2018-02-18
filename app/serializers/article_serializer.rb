class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :source_id, :title, :description, :top_img, :link, :pub_date
end
