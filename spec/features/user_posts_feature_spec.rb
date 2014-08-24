require 'rails_helper'
require_relative './support/post_support'

describe 'User Posts' do
		
	before(:each) do
		user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		login_as user
	end

	it 'can edit one of his posts' do
		create_post('web development', 'http://www.ok.com', 'technology')
		click_link 'My posts'
		click_link 'Edit'
		fill_in 'Title', with: 'new title'
		fill_in 'Url', with: 'http://www.newweb.com'
		fill_in 'Categories', with: 'new category'
		click_button 'Update'
		expect(page).not_to have_link 'web development'
		expect(page).to have_link 'new title'
	end

	it 'can delete one of his posts' do
		create_post('web development', 'http://www.ok.com', 'technology')
		click_link 'My posts'
		click_link 'Delete'
		expect(page).not_to have_link 'web development'
	end
end