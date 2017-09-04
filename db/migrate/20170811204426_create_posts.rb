class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :owner
      t.string :post_title
      t.string :post_subtitle
      t.string :post_body
      t.string :post_category
      t.string :post_shares
      t.string :post_comments
      t.string :post_views
      t.timestamps
    end
  end
end
