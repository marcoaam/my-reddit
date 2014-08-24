require 'rails_helper'

describe 'Users' do

	context 'Without users' do

		it 'can sign up', js: true do
			visit '/posts'
			click_button 'Sign up'
			within '.modal-content' do
				fill_in 'user[username]', with: 'm2'
				fill_in 'user[email]', with: 'm@m2.com'
				fill_in 'user[password]', with: '12345678'
				fill_in 'user[password_confirmation]', with: '12345678'
				click_button 'Submit'
			end
				expect(page).to have_content 'Welcome! You have signed up successfully.'
		end

	end

	context 'With users' do

		let(:user) { User.create(username: 'm', email: 'm@m.com', password: '12345678', password_confirmation: '12345678') }

		it 'can sign in' do
			user
			visit '/posts'
			fill_in 'user[login]', with: 'm'
			fill_in 'user[password]', with: '12345678', match: :prefer_exact
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