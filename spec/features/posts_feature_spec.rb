require 'rails_helper'

describe 'Posts' do

	context 'Without posts' do

		let(:user) { User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')}

		it 'Shows a message' do
			visit '/posts'
			expect(page).to have_content 'No posts have been added'
		end

		it 'need to have a user to be able to post' do
			visit '/posts'
			click_link 'New post'
			expect(page).to have_content 'You need to sign in or sign up before continuing.'
		end

		it 'can create a new post' do
			login_as user
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'check out this new website'
			click_button 'Post'
			expect(page).to have_content 'check out this new website'
		end

		it 'a post belongs to a user' do
			login_as user
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'check out this new website'
			fill_in 'Url', with: 'http://www.makersacademy.com/'
			click_button 'Post'
			expect(page).to have_content 'Posted by m@m.com'
		end

	end

	context 'Posts with urls' do

		before(:each) do
			user = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'can create a post with a url' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Web dev bootcamp'
			fill_in 'Url', with: 'http://www.makersacademy.com/'
			click_button 'Post'
			expect(page).to have_link 'Web dev bootcamp'
		end
	end

	context 'Posts with a category' do

		before(:each) do
			user = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'can create a post with a category' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Web dev bootcamp'
			fill_in 'Url', with: 'http://www.makersacademy.com/'
			fill_in 'Categories', with: 'webdev'
			click_button 'Post'
			expect(page).to have_link 'Web dev bootcamp'
			expect(page).to have_content 'category: webdev'
		end
	end

	context 'With posts' do

		let(:user) { User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')}

		before(:each) do
			Post.create(title: 'Challenge day at makers academy',user: user)
		end

		it 'Shows all posts' do
			visit '/posts'
			expect(page).to have_content 'Challenge day at makers academy'
		end
	end 
end