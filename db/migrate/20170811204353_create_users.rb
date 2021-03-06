class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :reset
      t.string :activation_code
      t.string :activated
      t.string :level
      t.string :enabled
      t.string :facebook
      t.string :twitter
      t.string :oneline
      t.timestamps
    end
  end
end
