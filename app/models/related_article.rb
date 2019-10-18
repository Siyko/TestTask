class RelatedArticle < ApplicationRecord
  belongs_to :original_article, class_name: 'ProductArticle'
  belongs_to :related_article, class_name: 'ProductArticle'
end
