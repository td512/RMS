# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{id: 1, first_name: "Demo", last_name: "Account", email: "example@example.com", password_digest: "do-not-touch-me", activated: "1", level: "1", enabled: "1", facebook: "https://fb.me", twitter: "facebook", oneline: "You got me! It's panther!"}])
settings = Setting.create([{id: 1, blog_name: "Panther", blog_tagline: "A Blogging Platform, Powered by Rails and Awesome", blog_about: "Hi, You're looking at Panther :)", blog_facebook: "https://fb.me", blog_twitter: "https://twitter.com/facebook", blog_email: "example@example.com", blog_logo: "/images/logo-text-white.png", blog_css_bg: "#212327", blog_css_tc: "#FFFFFF", blog_css_post: "#353941", blog_css_button: "#FFFFFF", blog_css_header: "#212327", blog_css_highlight: "#2EBAAE", dash_css_bg: "#212327", dash_css_tc: "#FFFFFF", dash_css_mtc: "#FFFFFF", dash_css_highlight: "#F2849E"}])
posts = Post.create([{id: 1, slug: "welcome-to-panther", owner: "1", post_title: "Welcome to Panther!", post_subtitle: "What, you expected more from me?", post_body: "# Welcome to Panther!\n\n## This is a demo copy of Panther\n\nBe aware, not all features may work. Enjoy :)", post_category: "Welcome"}])
