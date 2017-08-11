class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :owner
      t.string :post_title
      t.string :post_body
      t.timestamps
    end
  end
end
