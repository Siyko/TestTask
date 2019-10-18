class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.belongs_to :product_article
      t.belongs_to :size
      t.string :sku
      t.boolean :available

      t.timestamps
    end
  end
end
