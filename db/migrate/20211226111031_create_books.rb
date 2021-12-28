class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :rating
      t.string :title

      t.timestamps
    end
  end
end
