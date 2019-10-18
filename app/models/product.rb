class Product < ApplicationRecord
  has_one :product_article, dependent: :delete

  accepts_nested_attributes_for :product_article
end
