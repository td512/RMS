class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :blog_name
      t.string :blog_tagline
      t.string :blog_about
      t.string :blog_facebook
      t.string :blog_twitter
      t.string :blog_email
      t.string :blog_appid
      t.string :blog_logo
      t.string :blog_css_bg
      t.string :blog_css_tc
      t.string :blog_css_post
      t.string :blog_css_button
      t.string :blog_css_header
      t.string :dash_css_bg
      t.string :dash_css_tc
      t.string :dash_css_mtc
      t.string :dash_css_highlight
      t.timestamps
    end
  end
end
