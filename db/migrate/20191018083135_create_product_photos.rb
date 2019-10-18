class CreateProductPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :product_photos do |t|
      t.belongs_to :product_article
      t.string :url

      t.timestamps
    end
  end
end
