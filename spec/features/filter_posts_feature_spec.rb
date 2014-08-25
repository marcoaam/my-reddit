require 'rails_helper'

describe 'Post select' do

	let(:user) { User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')}

	before(:each) do
		post_with_like = Post.create(title: 'makers academy', url: 'http://www.makersacademy.com', user: user)
		post_with_like.likes.create
		Comment.create(thoughts: 'Great webdev course', user: user, post: post_with_like)

		Post.create(title: 'Challenge day', url: 'http://www.challenge.com', user: user)
	end

	it 'can filter posts by newest to oldest' do
		visit '/posts'
		click_link 'new'
		expect(page).to have_content 'makers academy'
	end

	it 'can filter posts by hot' do
		visit '/posts'
		click_link 'hot'
		expect(page).to have_content 'makers academy'
	end

	it 'can filter posts by rising' do
		visit '/posts'
		click_link 'rising'
		expect(page).to have_content 'makers academy'
	end

	it 'can filter post by controversial' do
		visit '/posts'
		click_link 'controversial'
		expect(page).to have_content 'makers academy'
	end

	it 'can filter post by top' do
		visit '/posts'
		click_link 'top'
		expect(page).to have_content 'makers academy'
	end
end