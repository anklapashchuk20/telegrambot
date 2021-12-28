class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :book, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
