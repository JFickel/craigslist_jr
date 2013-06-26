class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :email
      t.decimal :price
      t.string :secret_key
      t.integer :category_id
    end
  end
end
