class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :url
      t.string :subtitle
      t.timestamps
    end
  end
end
