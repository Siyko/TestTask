class CreateRelatedArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :related_articles do |t|
      t.references :original_article
      t.references :related_article
      t.timestamps
    end
  end
end
