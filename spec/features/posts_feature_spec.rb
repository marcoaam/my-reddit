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
			fill_in 'Content', with: 'check out this new website'
			click_button 'Post'
			expect(page).to have_content 'check out this new website'
		end

	end

	context 'With posts' do

		before(:each) do
			Post.create(text: 'Challenge day at makers academy')
		end

		it 'Shows all posts' do
			visit '/posts'
			expect(page).to have_content 'Challenge day at makers academy'
		end
	end 
end