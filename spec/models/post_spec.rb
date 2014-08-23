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

end
