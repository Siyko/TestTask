class ProductArticle < ApplicationRecord
  belongs_to :product
  has_many :product_sizes
  has_many :product_photos
  has_many :related_articles, foreign_key: :original_article_id
end
