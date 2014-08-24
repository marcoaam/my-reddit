require 'rails_helper'

describe 'Likes' do

	before(:each) do
		user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		user2 = User.create(username: 'marco2', email: 'm@m2.com', password: '12345678', password_confirmation: '12345678')
		Post.create(title: 'Challenge day at makers academy', url: 'marco.com', user: user)
		login_as user2
	end

	it 'User can like a post' do
		visit '/posts'
		click_link 'Like'
		expect(page).to have_content '1'
	end

	it 'User can dislike a post and substracts one like' do
		visit '/posts'
		click_link 'Like'
		click_link 'Like'
		click_link 'Dislike'
		expect(page).to have_content '1'
	end

end