class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :blog_name
      t.string :blog_facebook
      t.string :blog_twitter
      t.timestamps
    end
  end
end
