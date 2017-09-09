class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :owner
      t.string :awaiting_moderation
      t.string :post_id
      t.string :deleted
      t.string :content
      t.timestamps
    end
  end
end
