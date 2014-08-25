require 'rails_helper'

describe 'Likes' do

	before(:each) do
		user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		user2 = User.create(username: 'marco2', email: 'm@m2.com', password: '12345678', password_confirmation: '12345678')
		post = Post.create(title: 'Challenge day at makers academy', url: 'marco.com', user: user)
		post.likes.create(user_id: user.id)
		login_as user2
	end

	it 'User can like a post' do
		visit '/posts'
		page.find('.glyphicon-chevron-up').click
		expect(page).to have_content '2'
	end

	it 'User can dislike a post and points go down by one' do
		visit '/posts'
		page.find('.glyphicon-chevron-down').click
		expect(page).to have_content '0'
	end

	it 'User can like a post only once' do
		visit '/posts'
		page.find('.glyphicon-chevron-up').click
		page.find('.glyphicon-chevron-up').click
		expect(page).to have_content '2'
	end

	it 'User can like a comment' do
		visit '/posts'
		click_link 'comments: '
		fill_in 'Thoughts', with: 'great idea'
		click_button 'Leave comment'
		within '.comment' do
			click_link 'Like'
		end
		expect(page).to have_content 'Points: 1'
	end

	it 'User can dislike a comment' do
		visit '/posts'
		click_link 'comments: '
		fill_in 'Thoughts', with: 'great idea'
		click_button 'Leave comment'
		within '.comment' do
			click_link 'Like'
			click_link 'Dislike'
		end
		expect(page).to have_content 'Points: 0'
	end

end