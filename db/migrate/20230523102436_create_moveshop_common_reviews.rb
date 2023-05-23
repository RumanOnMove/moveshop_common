class CreateMoveshopCommonReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :moveshop_common_reviews do |t|
      t.references :spree_product, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :rating ,precision: 3, scale: 2, null: false
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
