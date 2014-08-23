require 'rails_helper'

describe 'Users' do

	context 'Without users' do

		it 'can sign up' do
			visit '/users/sign_up'
			fill_in 'user[email]', with: 'm@m.com'
			fill_in 'user[password]', with: '12345678'
			fill_in 'user[password_confirmation]', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end

	end

	context 'With users' do

		let(:user) { User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678') }

		it 'can sign in' do
			user
			visit '/users/sign_in'
			fill_in 'user[email]', with: 'm@m.com'
			fill_in 'user[password]', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'Signed in successfully.'
		end

		it 'can sign out' do
			login_as user
			visit '/posts'
			click_link 'Sign out'
			expect(page).to have_content 'Signed out successfully'
		end

	end

end