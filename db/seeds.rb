# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Like.destroy_all
Comment.destroy_all
Dislike.destroy_all
User.destroy_all
Category.destroy_all

user = User.create(username: 'marco_araujo', email: 'marco@araujo.com', password: '12345678', password_confirmation: '12345678')
user2 = User.create(username: 'lucila_melendez', email: 'lucila@melendez.com.com', password: '12345678', password_confirmation: '12345678')
user3 = User.create(username: 'luisa_araujo', email: 'luisa@araujo.com.com', password: '12345678', password_confirmation: '12345678')

1.upto(15) do |n|
	users = [user, user2, user3]
	post = Post.create(title: "Challenge day at makers academy #{n}", url: "http://www.wesite#{n}.com", categories_list: "category#{rand(1..5)} short#{rand(1..5)}", user: users.sample)
	rand(1..5).times { post.likes.find_or_create_by(user_id: users.sample.id) }
	rand(1..5).times { Comment.create(thoughts: "Commenting this post as a example #{n}", user: users.sample, post: post) }
end