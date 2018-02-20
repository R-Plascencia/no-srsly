class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :website
  has_many :articles
end
