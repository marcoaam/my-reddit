require 'rails_helper'

describe 'Comments' do

	before(:each) do
		user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		user2 = User.create(username: 'marco2', email: 'm@m2.com', password: '12345678', password_confirmation: '12345678')
		Post.create(title: 'Challenge day at makers academy', url: 'marco.com', user: user)
		login_as user2
	end

	it 'can be created to a post with a user' do
		visit '/posts'
		fill_in 'Thoughts', with: 'great idea'
		click_button 'Leave comment'
		expect(page).to have_content 'great idea'
		expect(page).to have_content 'by marco2'
	end

end