require 'rails_helper'

describe 'Post with url' do

	before(:each) do
		user = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		login_as user
	end

	it 'can create a post with a url' do
		visit '/posts'
		click_link 'New post'
		fill_in 'Title', with: 'Web dev bootcamp'
		fill_in 'Url', with: 'www.makersacademy.com'
		click_button 'Post'
		expect(page).to have_link 'Web dev bootcamp'
	end

end