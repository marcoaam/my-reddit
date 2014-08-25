require 'rails_helper'

RSpec.describe Post, :type => :model do

	let(:post) { Post.create(title: 'Hi', url: 'http://www.marco.com') }

	it 'has no category' do
		post.categories_list = ''
		expect(post.categories).to be_empty
	end

	it 'has one category' do
		post.categories_list = 'greeting'
		expect(post.categories.first.name).to eq 'greeting'
	end

	it 'has more than category' do
		post.categories_list = 'greeting nice'
		expect(post.categories.count).to eq 2
	end

	it 'doesnt create a category if already exist' do
		post.categories_list = 'greeting greeting'
		expect(post.categories.count).to eq 1
	end

	it 'doesnt create a category if the category already exist from another post' do
		post2 = Post.create(title: 'hello', url: 'http://www.london.com')
		post2.categories_list = 'hello'
		post.categories_list = 'hello'
		expect(post.categories.count).to eq 1
	end

	context 'Filter posts by' do

		before(:each) do
			Post.create(title: '5', url: 'http://www.marco.com')
			Post.create(title: '4', url: 'http://www.marco.com').likes.create

			post_with_like = Post.create(title: '3', url: 'http://www.marco.com')
			post_with_like.likes.create
			post_with_like.likes.create
			Comment.create(thoughts: 'nice!!', post: post_with_like)

			Post.create(title: '2', url: 'http://www.marco.com')
			Post.create(title: '1', url: 'http://www.marco.com')
		end

		it 'Newests' do
			expect(Post.newests.first.title).to eq '1'
			expect(Post.newests[1].title).to eq '2'
		end

		it 'hottest posts with most likes for the last 24 hours' do
			expect(Post.hot.first.title).to eq '3'
			expect(Post.hot[1].title).to eq '4'
		end

		it 'rising (latest likes of newests posts)' do
			expect(Post.rising.first.title).to eq '3'
			expect(Post.rising[1].title).to eq '4'
		end

		it 'controversial (most commented)' do
			expect(Post.controversial.first.title).to eq '3'
		end

		it 'top (most likes of all times)' do
			expect(Post.top.first.title).to eq '3'
			expect(Post.top[1].title).to eq '4'
		end

	end


	context 'Category' do

		let(:user)  { User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')   }

		before(:each)  do
			Post.create(title: 'Challenge', url: 'marco.com', user: user, categories_list: 'marco')
			Post.create(title: 'day', url: 'marco.com', user: user, categories_list: 'web')
		end

		it 'search by category' do
			expect(Post.search('marco').first.title).to eq 'Challenge'
			expect(Post.search('marco')[1]).to eq nil
		end

	end


	context 'Likes' do

		let(:user)  { User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')   }
		let(:user2) { User.create(username: 'marco2', email: 'm@m2.com', password: '12345678', password_confirmation: '12345678') }
		let(:post)  { Post.create(title: 'Challenge day at makers academy', url: 'marco.com', user: user) }
		
		before(:each) do
			post.likes.create(user_id: user.id)
			post.likes.create(user_id: user2.id)
		end

	  it 'calculates the total points' do
	  	expect(post.total_points).to eq 2
	  end

	  it 'calculates the total points with dislikes' do
	  	post.dislikes.create
	  	expect(post.total_points).to eq 1
	  end

	end
	
end
