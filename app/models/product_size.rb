class ProductSize < ApplicationRecord
  belongs_to :size
  belongs_to :product_article
end
